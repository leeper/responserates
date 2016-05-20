#' @rdname coop
#' @title Cooperation Rates
#' @description AAPOR cooperation rate formulae
#' @template arguments1
#' @return A numeric value indicating the cooperation rate.
#' @details Cooperation rates measure the number of complete (or complete and partial) interviews out of the total eligible units contacted. The denominator for each rate varies. Here are the definitions of each response rate, according to AAPOR's \dQuote{Standard Definitions}:
#' \itemize{
#'  \item Cooperation Rate 1 (COOP1), or the minimum cooperation rate, is the number of complete interviews divided by the number of interviews (complete plus partial) plus the number of non-interviews that involve the identification of and contact with an eligible respondent (refusal and break-off plus other).
#'  \item Cooperation Rate 2 (COOP2) counts partial interviews as respondents.
#'  \item Cooperation Rate 3 (COOP3) defines those unable to do an interview as also incapable of cooperating and they are excluded from the base. 
#'  \item Cooperation Rate 4 (COOP4) does the same as Cooperation Rate 3, but includes partials as interviews.
#' }
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
coop2 <- function(i = 0, p = 0, r = 0, o = 0) {
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
