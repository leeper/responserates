#' @rdname contact
#' @title Contact Rates
#' @description AAPOR contact rate formulae
#' @template arguments1
#' @template arguments2
#' @template e
#' @return A numeric value indicating the contact rate.
#' @details Contact rates measure the number of contacted units (including refusals and others) out of the total units sampled. The denominator for each rate varies. Here are the definitions of each response rate, according to AAPOR's \dQuote{Standard Definitions}:
#' \itemize{
#'  \item Contact Rate 1 (CON1) assumes that all cases of indeterminate eligibility are actually eligible.
#'  \item Contact Rate 2 (CON2) includes in the base only the estimated eligible cases among the undetermined cases.
#'  \item Contact Rate 3 (CON3) includes in the base only known eligible cases.
#' }
#' One possible calculation of \code{e} suggested by the Standard Definition's calculator is the number of eligible \eqn{e = \frac{i + p + r + nc + o}{i + p + r + nc + o + uo}}. The default used here, however, is the more conservative value of 1.
#' @references
#'  AAPOR. 2016. \href{http://www.aapor.org/AAPOR_Main/media/publications/Standard-Definitions20169theditionfinal.pdf}{\dQuote{Standard Definitions Final Dispositions of Case Codes and Outcome Rates for Surveys.}}
#' @seealso \code{\link{rates}}, \code{\link{rr1}}, \code{\link{coop1}}, \code{\link{ref1}}
#' @export
con1 <- function(i = 0, p = 0, r = 0, nc = 0, o = 0, uh = 0, uo = 0) {
    rate <- (i + p + r + o) / ((i + p) + (r + nc + o) + (uh + uo) )
    structure(rate, class = "response_rate", rate = "aapor_con1")
}

#' @rdname contact
#' @export
con2 <- function(i = 0, p = 0, r = 0, nc = 0, o = 0, uh = 0, uo = 0, e = 1) {
    rate <- (i + p + r + o) / ((i + p) + (r + nc + o) + (e*(uh + uo)) )
    structure(rate, class = "response_rate", rate = "aapor_con2")
}

#' @rdname contact
#' @export
con3 <- function(i = 0, p = 0, r = 0, nc = 0, o = 0) {
    rate <- (i + p + r + o) / ((i + p) + (r + nc + o) )
    structure(rate, class = "response_rate", rate = "aapor_con3")
}
