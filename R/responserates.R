#' @rdname rr
#' @title Response Rates
#' @description AAPOR response rate formulae
#' @template arguments1
#' @template arguments2
#' @template e
#' @return A numeric value indicating the response rate.
#' @references
#'  AAPOR. 2016. \href{http://www.aapor.org/AAPOR_Main/media/publications/Standard-Definitions20169theditionfinal.pdf}{\dQuote{Standard Definitions Final Dispositions of Case Codes and Outcome Rates for Surveys.}}
#' @seealso \code{\link{rates}}, \code{\link{coop1}}, \code{\link{ref1}}, \code{\link{con1}}
#' @export
rr1 <- function(i = 0, p = 0, r = 0, nc = 0, o = 0, uh = 0, uo = 0) {
    rate <- (i) / ((i + p) + (r + nc + o) + (uh + uo) )
    structure(rate, class = "response_rate", rate = "aapor_rr1")
}

#' @rdname rr
#' @export
rr2 <- function(i = 0, p = 0, r = 0, nc = 0, o = 0, uh = 0, uo = 0) {
    rate <- (i + p) / ((i + p) + (r + nc + o) + (uh + uo) )
    structure(rate, class = "response_rate", rate = "aapor_rr2")
}

#' @rdname rr
#' @export
rr3 <- function(i = 0, p = 0, r = 0, nc, o = 0, uh = 0, uo = 0, e = 1) {
    rate <- (i) / ((i + p) + (r + nc + o) + (e *(uh + uo)) )
    structure(rate, class = "response_rate", rate = "aapor_rr3")
}

#' @rdname rr
#' @export
rr4 <- function(i = 0, p = 0, r = 0, nc = 0, o = 0, uh = 0, uo = 0, e = 1) {
    rate <- (i + p) / ((i + p) + (r + nc + o) + (e *(uh + uo)) )
    structure(rate, class = "response_rate", rate = "aapor_rr4")
}

#' @rdname rr
#' @export
rr5 <- function(i = 0, p = 0, r = 0, nc = 0, o = 0) {
    rate <- (i) / ((i + p) + (r + nc + o))
    structure(rate, class = "response_rate", rate = "aapor_rr5")
}

#' @rdname rr
#' @export
rr6 <- function(i = 0, p = 0, r = 0, nc = 0, o = 0) {
    rate <- (i + p) / ((i + p) + (r + nc + o))
    structure(rate, class = "response_rate", rate = "aapor_rr6")
}
