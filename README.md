# Help pages, but make them pretty!
Some inspiration for awesome looking help pages: custom badges, other lesser-known markup, and some best practices 🤌🏻

## What's in here

A tiny demo package (`helppages`) showing how to embed custom badges into R
function help pages, using the same trick `lifecycle::badge()` uses under
the hood: `\figure{}` for the image, wrapped in `\ifelse{html}{...}{...}` so
non-HTML help (console, PDF manual) falls back to plain bracketed text
instead of a broken image reference.

Two badge families, on purpose at opposite ends of the effort scale:

- **Pipe-friendliness** (`pipe_badge()`, in `R/pipe-badge.R`): flat,
  shields.io-style badges marking whether a function returns something you
  can keep piping into (`pipeable`, see `?tidy_up`) or ends the chain
  (`terminal`, see `?preview_plot`). Genuinely useful, not just decoration.
- **Hogwarts houses** (`hogwarts_badge()`, in `R/hogwarts-badge.R`): small
  illustrated house crests, purely for fun, showing how far you can push
  the same mechanism when a flat rectangle isn't fancy enough. See
  `?charge_ahead`, `?clever_trick`, `?sneaky_workaround`, and
  `?reliable_util`.

## Try it

```r
devtools::load_all()
?tidy_up
?charge_ahead
```

Or in the console, where the fallback text kicks in instead of the image:

```r
tools::Rd2txt("man/tidy_up.Rd")
```

All badge SVGs live in `man/figures/`.

## Acknowledgments

🤖 Built with the help of [Claude Code](https://claude.com/claude-code).
