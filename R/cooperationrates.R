#' @rdname coop
#' @title Cooperation Rates
#' @description AAPOR cooperation rate formulae
#' @template arguments1
#' @return A numeric value indicating the cooperation rate.
#' @references
#'  AAPOR. 2016. \href{http://www.aapor.org/AAPOR_Main/media/publications/Standard-Definitions20169theditionfinal.pdf}{\dQuote{Standard Definitions Final Dispositions of Case Codes and Outcome Rates for Surveys.}}
#' @seealso \code{\link{rates}}, \code{\link{rr1}}, \code{\link{ref1}}, \code{\link{con1}}
#' @export
coop1 <- function(i = 0, p = 0, r = 0, o = 0) {
    rate <- (i) / ((i + p) + r + o)
    structure(rate, class = "response_rate", rate = "aapor_coop1")
}

#' @rdname coop
#' @export
coop2 <- function(i = 0, p, r = 0, o = 0) {
    rate <- (i + p) / ((i + p) + r + o)
    structure(rate, class = "response_rate", rate = "aapor_coop2")
}

#' @rdname coop
#' @export
coop3 <- function(i = 0, p = 0, r = 0) {
    rate <- (i) / ((i + p) + r)
    structure(rate, class = "response_rate", rate = "aapor_coop3")
}

#' @rdname coop
#' @export
coop4 <- function(i = 0, p = 0, r = 0) {
    rate <- (i + p) / ((i + p) + r)
    structure(rate, class = "response_rate", rate = "aapor_coop4")
}
