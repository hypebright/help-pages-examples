#' Build a Hogwarts house badge for use in roxygen documentation
#'
#' A purely-for-fun companion to [pipe_badge()], showing how far you can push
#' the same `\figure{}` plus conditional-rendering trick: instead of a flat,
#' shields.io-style rectangle, this points at a small illustrated house
#' crest.
#'
#' @param house One of `"gryffindor"`, `"slytherin"`, `"ravenclaw"`, or
#'   `"hufflepuff"`.
#'
#' @return A string of Rd markup.
#' @export
#'
#' @examples
#' hogwarts_badge("ravenclaw")
hogwarts_badge <- function(house) {
  house <- rlang::arg_match0(
    house, c("gryffindor", "slytherin", "ravenclaw", "hufflepuff")
  )
  html <- sprintf(
    "\\figure{hogwarts-%s.svg}{options: width=64px alt='[%s]'}", house, house
  )
  text <- sprintf("\\strong{[%s]}", house)
  sprintf("\\ifelse{html}{%s}{%s}\\cr\\cr", html, text)
}

#' Charge ahead without checking your inputs
#'
#' @description `r hogwarts_badge('gryffindor')`
#' Charges ahead without checking its inputs first. Brave. Possibly unwise.
#'
#' @param x Anything.
#' @return `x`, unchanged, if it survives.
#' @export
charge_ahead <- function(x) {
  x
}

#' Solve it in one clean, slightly too-clever line
#'
#' @description `r hogwarts_badge('ravenclaw')`
#' Solves the problem in one clean, slightly too-clever line.
#'
#' @param x A numeric vector.
#' @return A numeric vector, sorted.
#' @export
clever_trick <- function(x) {
  x[order(x)]
}

#' Get the job done through an undocumented workaround
#'
#' @description `r hogwarts_badge('slytherin')`
#' Gets the job done through a workaround nobody asked for, but it works.
#'
#' @param x Anything.
#' @return `x`, unchanged.
#' @export
sneaky_workaround <- function(x) {
  x
}

#' Do the unglamorous job reliably, every time
#'
#' @description `r hogwarts_badge('hufflepuff')`
#' The utility function that quietly does its job every single time.
#'
#' @param x Anything.
#' @return `x`, unchanged.
#' @export
reliable_util <- function(x) {
  x
}
