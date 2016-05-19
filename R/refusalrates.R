#' @rdname ref
#' @title Refusal Rates
#' @description AAPOR refusal rate formulae
#' @template arguments1
#' @template arguments2
#' @template e
#' @return A numeric value indicating the refusal rate.
#' @seealso \code{\link{rr1}}, \code{\link{coop1}}, \code{\link{con1}}
#' @export
ref1 <- function(i, p, r, nc, o, uh, uo) {
    rate <- (r) / ((i + p) + (r + nc + o) + (uh + uo) )
    rate
}

#' @rdname ref
#' @export
ref2 <- function(i, p, r, nc, o, uh, uo, e = 1) {
    rate <- (r) / ((i + p) + (r + nc + o) + (e*(uh + uo)) )
    rate
}

#' @rdname ref
#' @export
ref3 <- function(i, p, r, nc, o) {
    rate <- (r) / ((i + p) + (r + nc + o))
    rate
}
