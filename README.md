# Help pages, but make them pretty!
Some inspiration for awesome looking help pages: custom badges, other lesser-known markup, and some best practices 🤌🏻

## What's in here

A tiny demo package (`helppages`) showing how to embed custom badges into R
function help pages, using the same trick `lifecycle::badge()` uses under
the hood: `\figure{}` for the image, wrapped in `\ifelse{html}{...}{...}` so
non-HTML help (like the consol or PDF manual) falls back to plain text.

Two badge families, on purpose at opposite ends of the effort scale:

- **Pipe-friendliness** (`pipe_badge()`, in `R/pipe-badge.R`): flat,
  shields.io-style badges marking whether a function returns something you
  can keep piping into (`pipeable`, see `?tidy_up`) or ends the chain
  (`terminal`, see `?preview_plot`). 
- **Hogwarts houses** (`hogwarts_badge()`, in `R/hogwarts-badge.R`): small
  illustrated house crests, purely for fun, showing how you can bring some
  fancy stuff into your function docs. See
  `?charge_ahead`, `?clever_trick`, `?sneaky_workaround`, and
  `?reliable_util`.

## Lesser-known roxygen2 tags

Beyond badges, this demo package demonstrates a handful of roxygen2 tags that 
might be lesser known. See `R/spells.R`
(`?lumos`, `?nox`, `?accio`) for all of them in context:

- **`@family`**: group related functions and get a "See Also" block for
  free!
- **`@inheritParams`**: reuse a `@param` description from another function
  instead of copy-pasting it. Lifesaver.
- **`@inheritSection`**: same idea as above, for an entire `@section`.
- **`@examplesIf`**: wrap an example in a runtime condition (like
  `@examplesIf interactive()`) so you don't have to add `\dontrun{}`/
  `\dontshow{}` safeguards.
- **`@concept`**: add extra searchable keywords that don't fit the title,
  so `??` and index searches still find the function.

### Extending roxygen2: a custom `@spell` tag

roxygen2 also lets you invent your own tags. Beautifully documented at
[extending roxygen2](https://roxygen2.r-lib.org/articles/extending.html). 
`R/roxygen-spell-tag.R` adds a `@spell` tag as a fun example: 
three S3 methods (`roxy_tag_parse()`, `roxy_tag_rd()`, and
`format()`) turn `@spell <text>` into a `\section{}` marked with a magic
wand (🪄) that looks like a callout. See `?lumos`
for it in action, or `?extending-roxygen2` for the how-and-why.

## Try it

```r
devtools::load_all()
?tidy_up
?charge_ahead
?lumos
```

Or in the console, where the fallback text kicks in instead of the image
(and the 🪄 section still renders):

```r
tools::Rd2txt("man/lumos.Rd")
```

All badge SVGs live in `man/figures/`.

## Acknowledgments

🤖 Built with the help of [Claude Code](https://claude.com/claude-code) for some inspiration.
