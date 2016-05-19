#' @rdname rr
#' @title Response Rates
#' @description AAPOR response rate formulae
#' @template arguments1
#' @template arguments2
#' @template e
#' @return A numeric value indicating the response rate.
#' @seealso \code{\link{coop1}}, \code{\link{ref1}}, \code{\link{con1}}
#' @export
rr1 <- function(i, p, r, nc, o, uh, uo) {
    rate <- (i) / ((i + p) + (r + nc + o) + (uh + uo) )
    rate
}

#' @rdname rr
#' @export
rr2 <- function(i, p, r, nc, o, uh, uo) {
    rate <- (i + p) / ((i + p) + (r + nc + o) + (uh + uo) )
    rate
}

#' @rdname rr
#' @export
rr3 <- function(i, p, r, nc, o, uh, uo, e = 1) {
    rate <- (i) / ((i + p) + (r + nc + o) + (e *(uh + uo)) )
    rate
}

#' @rdname rr
#' @export
rr4 <- function(i, p, r, nc, o, uh, uo, e = 1) {
    rate <- (i + p) / ((i + p) + (r + nc + o) + (e *(uh + uo)) )
    rate
}

#' @rdname rr
#' @export
rr5 <- function(i, p, r, nc, o) {
    rate <- (i) / ((i + p) + (r + nc + o))
    rate
}

#' @rdname rr
#' @export
rr6 <- function(i, p, r, nc, o) {
    rate <- (i + p) / ((i + p) + (r + nc + o))
    rate
}
