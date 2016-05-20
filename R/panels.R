#' @rdname panels
#' @title Panel Participation Rates
#' @description AAPOR panel participation formulae
#' @template arguments1
#' @template arguments2
#' @template e
#' @param FUN A function specifying the calculation of the rate. Default is \code{\link{rr5}}.
#' @return A numeric value indicating the response rate.
#' @details These functions calculate response/participation metrics relevant to panel surveys, especially probability-based online panels. Specifically, three functions are exposed based upon definitions provided in AAPOR's \dQuote{Standard Definitions}:
#' \itemize{
#'  \item \code{recr} provides a \dQuote{recruitment rate}, used to calculate the proportion of invited respondents who agree to empanelment.
#'  \item \code{pror} provides a \dQuote{profile rate}, used to calculate the proportion of empaneled respondents who complete an initial panel profile questionnaire.
#'  \item \code{comr} provides a \dQuote{completion rate}, used to calculate the response rate for a given survey.
#' }
#' \code{pror} and \code{comr} are simply wrappers for \code{\link{rr5}} (by default) or another response rate function (specified in \code{FUN}. One possible calculation of \code{e} suggested by the Standard Definition's calculator is the number of eligible \eqn{e = \frac{i + p + r + nc + o}{i + p + r + nc + o + uo}}. The default used here, however, is the more conservative value of 1.
#' @references
#'  AAPOR. 2016. \href{http://www.aapor.org/AAPOR_Main/media/publications/Standard-Definitions20169theditionfinal.pdf}{\dQuote{Standard Definitions Final Dispositions of Case Codes and Outcome Rates for Surveys.}}
#' @examples
#' # recruitment/empanelment rate
#' recruitment <- recr(1000, r = 1000, nc = 1000)
#' 
#' # profile rate
#' profile <- pror(i = 900, nc = 100)
#' 
#' # single-study completion rate
#' completion <- comr(i = 200, p = 50, r = 100)
#' 
#' # cumulative response rate
#' recruitment * profile * completion
#' 
#' @seealso \code{\link{rates}}, \code{\link{rr1}}, \code{\link{coop1}}, \code{\link{ref1}}, \code{\link{con1}}
#' @export
recr <- function(i, r = 0, nc = 0, o = 0, uh = 0, uo = 0, e = 1) {
    rate <- rr1(i = i, r = r, nc =nc, o = o, uh =uh, uo = uo, e = e)
    rate
}

#' @rdname panels
#' @export
pror <- function(i, p = 0, r = 0, nc = 0, o = 0, FUN = rr5) {
    rate <- FUN(i = i, p = p, r = r, nc = nc, o = o)
    rate
}

#' @rdname panels
#' @export
comr <- function(i, p = 0, r = 0, nc = 0, o = 0, FUN = rr5) {
    rate <- FUN(i = i, p = p, r = r, nc = nc, o = o)
    rate
}

