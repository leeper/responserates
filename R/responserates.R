#' @rdname rr
#' @title Response Rates
#' @description AAPOR response rate formulae
#' @template arguments1
#' @template arguments2
#' @template e
#' @return A numeric value indicating the response rate.
#' @details Response rates measure the number of complete (or complete and partial) interviews out of the total units sampled. The denominator for each rate varies. Here are the definitions of each response rate, according to AAPOR's \dQuote{Standard Definitions}:
#' \itemize{
#'  \item Response Rate 1 (RR1), or the minimum response rate, is the number of complete interviews divided by the number of interviews (complete plus partial) plus the number of non-interviews (refusal and break-off plus non-contacts plus others) plus all cases of unknown eligibility (unknown if housing unit, plus unknown, other).
#'  \item Response Rate 2 (RR2) counts partial interviews as respondents.
#'  \item Response Rate 3 (RR3) estimates what proportion of cases of unknown eligibility is actually eligible. In estimating \code{e}, one must be guided by the best available scientific information on what share eligible cases make up among the unknown cases and one must not select a proportion in order to boost the response rate.
#'  \item Response Rate 4 (RR4) allocates cases of unknown eligibility as in RR3, but also includes partial interviews as respondents as in RR2.
#'  \item Response Rate 5 (RR5) is either a special case of RR3 in that it assumes that \samp{e=0} (i.e. that there are no eligible cases among the cases of unknown eligibility) or the rare case in which there are no cases of unknown eligibility
#'  \item Response Rate 6 (RR6) makes that same assumption and also includes partial interviews as respondents. RR6 represents the maximum response rate.
#' }
#' One possible calculation of \code{e} suggested by the Standard Definition's calculator is the number of eligible \eqn{e = \frac{i + p + r + nc + o}{i + p + r + nc + o + uo}}. The default used here, however, is the more conservative value of 1.
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
rr3 <- function(i = 0, p = 0, r = 0, nc = 0, o = 0, uh = 0, uo = 0, e = 1) {
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
