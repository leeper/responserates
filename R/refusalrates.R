#' @rdname ref
#' @title Refusal Rates
#' @description AAPOR refusal rate formulae
#' @template arguments1
#' @template arguments2
#' @template e
#' @return A numeric value indicating the refusal rate.
#' @references
#'  AAPOR. 2016. \href{http://www.aapor.org/AAPOR_Main/media/publications/Standard-Definitions20169theditionfinal.pdf}{\dQuote{Standard Definitions Final Dispositions of Case Codes and Outcome Rates for Surveys.}}
#' @seealso \code{\link{rates}}, \code{\link{rr1}}, \code{\link{coop1}}, \code{\link{con1}}
#' @export
ref1 <- function(i = 0, p = 0, r = 0, nc = 0, o = 0, uh = 0, uo = 0) {
    rate <- (r) / ((i + p) + (r + nc + o) + (uh + uo) )
    structure(rate, class = "response_rate", rate = "aapor_ref1")
}

#' @rdname ref
#' @export
ref2 <- function(i = 0, p = 0, r = 0, nc = 0, o = 0, uh = 0, uo = 0, e = 1) {
    rate <- (r) / ((i + p) + (r + nc + o) + (e*(uh + uo)) )
    structure(rate, class = "response_rate", rate = "aapor_ref2")
}

#' @rdname ref
#' @export
ref3 <- function(i = 0, p = 0, r = 0, nc = 0, o = 0) {
    rate <- (r) / ((i + p) + (r + nc + o))
    structure(rate, class = "response_rate", rate = "aapor_ref3")
}
