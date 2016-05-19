#' @rdname coop
#' @title Cooperation Rates
#' @description AAPOR cooperation rate formulae
#' @template arguments1
#' @return A numeric value indicating the cooperation rate.
#' @seealso \code{\link{rr1}}, \code{\link{ref1}}, \code{\link{con1}}
#' @export
coop1 <- function(i, p, r, o) {
    rate <- (i) / ((i + p) + r + o)
    rate
}

#' @rdname coop
#' @export
coop2 <- function(i, p, r, o) {
    rate <- (i + p) / ((i + p) + r + o)
    rate
}

#' @rdname coop
#' @export
coop3 <- function(i, p, r) {
    rate <- (i) / ((i + p) + r)
    rate
}

#' @rdname coop
#' @export
coop4 <- function(i, p, r) {
    rate <- (i + p) / ((i + p) + r)
    rate
}
