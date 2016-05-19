#' @rdname contact
#' @title Contact Rates
#' @description AAPOR contact rate formulae
#' @template arguments1
#' @template arguments2
#' @template e
#' @return A numeric value indicating the contact rate.
#' @seealso \code{\link{rr1}}, \code{\link{coop1}}, \code{\link{ref1}}
#' @export
con1 <- function(i, p, r, nc, o, uh, uo) {
    rate <- (i + p + r + o) / ((i + p) + (r + nc + o) + (uh + uo) )
    rate
}

#' @rdname contact
#' @export
con2 <- function(i, p, r, nc, o, uh, uo, e = 1) {
    rate <- (i + p + r + o) / ((i + p) + (r + nc + o) + (e*(uh + uo)) )
    rate
}

#' @rdname contact
#' @export
con3 <- function(i, p, r, nc, o) {
    rate <- (i + p + r + o) / ((i + p) + (r + nc + o) )
    rate
}
