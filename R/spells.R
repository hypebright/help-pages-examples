#' Light the tip of your wand
#'
#' @description `r hogwarts_badge('gryffindor')`
#' A stand-in for the *Lumos* charm: prints a short message to light up
#' whatever you point it at.
#'
#' @param object The target of the spell. What "printed", "illuminated", or
#'   "summoned" means depends on which charm you cast.
#'
#' @section Wand safety:
#' Every spell in this family that has a counter-charm is undone by it
#' (`lumos()` is undone by `nox()`). Casting a charm twice in a row is
#' harmless, just noisy.
#'
#' @return `object`, invisibly.
#' @family spells
#' @concept wand magic
#' @spell Lumos. "Let there be light." The go-to charm for a dark
#'   corridor, or a dark corner of your code you're trying to understand.
#' @export
#'
#' @examplesIf interactive()
#' lumos("the way forward")
lumos <- function(object) {
  message("\U0001F526 ", object)
  invisible(object)
}

#' Extinguish the light from `lumos()`
#'
#' @description `r hogwarts_badge('ravenclaw')`
#' The counter-charm to [lumos()]: quietly undoes the light, returning
#' `object` without comment.
#'
#' @inheritParams lumos
#' @inheritSection lumos Wand safety
#'
#' @return `object`, invisibly.
#' @family spells
#' @spell Nox. "Darkness." Cancels *Lumos*; casting it without a lit wand
#'   does nothing at all.
#' @export
#'
#' @examplesIf interactive()
#' nox("the light")
nox <- function(object) {
  invisible(object)
}

#' Summon an object from anywhere in scope
#'
#' @description `r hogwarts_badge('hufflepuff')`
#' A stand-in for the *Accio* summoning charm: fetches `object` and hands it
#' straight back, the unglamorous way [reliable_util()] does its job.
#'
#' @inheritParams lumos
#'
#' @return `object`, unchanged.
#' @family spells
#' @spell Accio. "Come to me." Summons almost anything that isn't alive or
#'   warded against it; range and control both improve with practice.
#' @export
#'
#' @examples
#' accio(mtcars)
accio <- function(object) {
  object
}
