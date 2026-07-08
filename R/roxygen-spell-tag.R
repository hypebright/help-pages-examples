#' Extending roxygen2: a custom `@spell` tag
#'
#' roxygen2 isn't limited to its built-in tags. You can define your own by
#' writing a few S3 methods, as described in
#' `vignette("extending", package = "roxygen2")` (also at
#' <https://roxygen2.r-lib.org/articles/extending.html>). `@spell` below is a
#' fun example: a Harry Potter themed version of the `@tip` tag, rendered as a
#' "Try this spell" section marked with a magic wand (🪄), so it stands out
#' from the rest of the help page. Styled as an HTML callout.
#'
#' The three methods involved:
#'
#' - `roxy_tag_parse()` decides how the raw tag text is parsed. Here we hand
#'   it to [roxygen2::tag_markdown()] so `@spell` supports the same Markdown
#'   (`code`, *emphasis*, links) as everything else.
#' - `roxy_tag_rd()` turns the parsed tag into an [roxygen2::rd_section()],
#'   which is how roxygen2 collects and merges tags of the same kind across
#'   a block.
#' - `format.rd_section_spell()` turns that section into actual `.Rd`
#'   syntax, i.e. the text roxygen2 writes into the `man/*.Rd` file. For the
#'   HTML rendering it converts the tag's Markdown to HTML itself (via the
#'   `commonmark` package, already a roxygen2 dependency).
#'
#' Because these methods extend generics that live in roxygen2 (not in this
#' package), each is exported with `@exportS3Method pkg::generic` rather
#' than a plain `@export`. See `vignette("namespace")`. And because
#' `roxygen2::roxygenise()` loads this package before it scans it for
#' documentation, the tag is available to use on functions defined right
#' here (see `R/spells.R`) with no extra wiring. Reuse it from another
#' package and you would additionally need
#' `Config/roxygen2/packages: helppages` in that package's `DESCRIPTION`,
#' as explained in the vignette linked above.
#'
#' @name extending-roxygen2
#' @keywords internal
NULL

#' @exportS3Method roxygen2::roxy_tag_parse
roxy_tag_parse.roxy_tag_spell <- function(x) {
  roxygen2::tag_markdown(x)
}

#' @exportS3Method roxygen2::roxy_tag_rd
roxy_tag_rd.roxy_tag_spell <- function(x, base_path, env) {
  # Keep both forms: `rd` (Rd markup, from tag_markdown() above) for the
  # console/PDF fallback, and `raw` (the untouched Markdown) so the HTML
  # branch can render it independently.
  roxygen2::rd_section("spell", list(list(rd = x$val, raw = x$raw)))
}

#' @exportS3Method base::format
format.rd_section_spell <- function(x, ...) {
  # Render the *entire* HTML as one self-contained
  # `\out{}`: markdown -> HTML via commonmark (already a roxygen2
  # dependency) done here in R, not left to Rd's own converter.
  rd_text <- paste0(vapply(x$value, `[[`, "", "rd"), collapse = "\n\n")
  html_body <- paste0(
    vapply(x$value, function(v) commonmark::markdown_html(v$raw), ""),
    collapse = ""
  )
  html <- paste0(
    "\\out{<div style=\"margin: 0.2em 0 0.6em; padding: 0.7em 1em; ",
    "border-left: 4px solid #7c3aed; border-radius: 6px; ",
    "background: rgba(124, 58, 237, 0.08);\">",
    html_body,
    "</div>}"
  )

  paste0(
    "\\section{\U0001FA84 Try this spell}{\n",
    "\\ifelse{html}{",
    html,
    "}{",
    rd_text,
    "}\n",
    "}\n"
  )
}
