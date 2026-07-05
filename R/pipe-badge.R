#' Build a pipe-friendliness badge for use in roxygen documentation
#'
#' Mirrors the trick `lifecycle::badge()` uses: returns a string of Rd markup
#' that gets spliced into your generated `.Rd` file when called inline
#' inside a roxygen `@description`, e.g. `` `r pipe_badge('pipeable')` ``.
#'
#' @param kind One of `"pipeable"` (the function returns something you can
#'   keep piping into) or `"terminal"` (the function ends the chain: it
#'   prints, plots, or returns something that isn't meant to be piped
#'   further).
#'
#' @return A string of Rd markup.
#' @export
#'
#' @examples
#' pipe_badge("pipeable")
pipe_badge <- function(kind) {
  kind <- rlang::arg_match0(kind, c("pipeable", "terminal"))
  html <- sprintf(
    "\\figure{pipe-%s.svg}{options: alt='[%s]'}", kind, kind
  )
  text <- sprintf("\\strong{[%s]}", kind)
  sprintf("\\ifelse{html}{%s}{%s}\\cr\\cr", html, text)
}

#' Tidy up a data frame
#'
#' @description `r pipe_badge('pipeable')`
#' Trims whitespace and lowercases the column names of a data frame. The
#' result is a plain data frame, so it's safe to keep piping into the next
#' step.
#'
#' @param data A data frame.
#' @return A data frame.
#' @export
#'
#' @examples
#' df <- data.frame(A = 1, B = 2)
#' names(df) <- c(" A ", " B ")
#' tidy_up(df)
tidy_up <- function(data) {
  names(data) <- tolower(trimws(names(data)))
  data
}

#' Preview a data frame as a plot
#'
#' @description `r pipe_badge('terminal')`
#' Draws a quick plot of a data frame and returns it invisibly. This ends
#' the pipe: there's nothing meaningful left to pipe into after a plot.
#'
#' @param data A data frame.
#' @return `data`, invisibly.
#' @export
#'
#' @examples
#' preview_plot(mtcars)
preview_plot <- function(data) {
  plot(data)
  invisible(data)
}
