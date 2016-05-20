#' @rdname ref
#' @title Refusal Rates
#' @description AAPOR refusal rate formulae
#' @template arguments1
#' @template arguments2
#' @template e
#' @return A numeric value indicating the refusal rate.
#' @details Refusal rates measure the number of refused interviews out of the total units sampled. The denominator for each rate varies. Here are the definitions of each response rate, according to AAPOR's \dQuote{Standard Definitions}:
#' \itemize{
#'  \item Refusal Rate 1 (REF1) is the number of refusals divided by the interviews (complete and partial) plus the non-respondents (refusals, non-contacts, and others) plus the cases of unknown eligibility.
#'  \item Refusal Rate 2 (REF2) includes estimated eligible cases among the unknown cases similar to Response Rate 3 (RR3) and Response Rate 4 (RR4).
#'  \item Refusal Rate 3 is analogous to Response Rate 5 (RR5) and Response Rate 6 (RR6). As in those cases the elimination of the unknowns from the equation must be fully justified by the actual situation. Non-contact and other rates can be calculated in a manner similar to refusal rates. Refusal, non-contact, and other rates will sum to equal the non-response rate.
#' }
#' One possible calculation of \code{e} suggested by the Standard Definition's calculator is the number of eligible \eqn{e = \frac{i + p + r + nc + o}{i + p + r + nc + o + uo}}. The default used here, however, is the more conservative value of 1.
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
