#' @rdname rates
#' @title AAPOR Survey Response Rates
#' @description Calculate AAPOR response, cooperation, refusal, and contact rates.
#' @param x A character or factor vector containing unit-specific disposition codes, or a named table or list summarizing the disposition codes.
#' @param w Optionally, if \code{x} is a vector of disposition codes, the weights to be applied to each case in calculating final, weighted disposition counts.
#' @template e
#' @param \dots Additional arguments passed to methods.
#' @details This function calculates all response, cooperation, refusal, and contact rates based upon the disposition code information supplied in \code{x}.
#' The allowed disposition codes are \dQuote{i}, \dQuote{p}, \dQuote{r}, \dQuote{nc}, \dQuote{o}, \dQuote{uh}, and \dQuote{uo}. Both upper and lower case are allowed.
#' \code{e} is assumed to be 1 unless specified otherwise. Smith (2009) provides a review of estimation of \code{e}. One possible calculation of \code{e} suggested by the Standard Definition's calculator is the number of eligible \eqn{e = \frac{i + p + r + nc + o}{i + p + r + nc + o + uo}}. The default used here, however, is the more conservative value of 1.
#' @return A list of class \dQuote{aapor_rates} containing the calculated response rates. Printing of the results is handled by a method that accepts a \code{fmt} argument in the form required by \code{\link[base]{sprintf}}.
#' @references
#'  AAPOR. 2016. \href{http://www.aapor.org/AAPOR_Main/media/publications/Standard-Definitions20169theditionfinal.pdf}{\dQuote{Standard Definitions Final Dispositions of Case Codes and Outcome Rates for Surveys.}}
#'  Smith, Tom W. 2009. \href{http://www.aapor.org/AAPOR_Main/media/MainSiteFiles/ERATE09.pdf}{\dQuote{A Revised Review of Methods to Estimate the Status of Cases with Unknown Eligibility.}} NORC/University of Chicago.
#' @seealso See \code{\link{rr1}}, \code{\link{ref1}}, \code{\link{coop1}}, \code{\link{con1}} for calculation of each rate.
#' @examples
#' # `x` is a character vector of codes
#' rates(c(rep("I", 100), rep("NC", 20)))
#' rates(c(rep("I", 100), rep("NC", 20)), w = runif(120))
#' 
#' # `x` is a list/table of code counts
#' rates(list(i = 100, nc = 20))
#' 
#' # specifying `e`
#' rates(list(i = 100, nc = 20, uo = 100, e = .25))
#' 
#' @export
rates <- function(x, ...) {
    UseMethod("rates")
}

rates.disposition_summary <- function(x, ...) {
    if (is.null(x$e)) {
        x$e <- 1
    } else if (x$e > 1 | x$e < 0) {
        stop("'e' must be a proportion between 0 and 1")
    }
    rates <- list()
    rates[["rr1"]] <- with(x, rr1(i, p, r, nc, o, uh, uo))
    rates[["rr2"]] <- with(x, rr2(i, p, r, nc, o, uh, uo))
    rates[["rr3"]] <- with(x, rr3(i, p, r, nc, o, uh, uo, e))
    rates[["rr4"]] <- with(x, rr4(i, p, r, nc, o, uh, uo, e))
    rates[["rr5"]] <- with(x, rr5(i, p, r, nc, o))
    rates[["rr6"]] <- with(x, rr6(i, p, r, nc, o))
    rates[["coop1"]] <- with(x, coop1(i, p, r, o))
    rates[["coop2"]] <- with(x, coop2(i, p, r, o))
    rates[["coop3"]] <- with(x, coop3(i, p, r))
    rates[["coop4"]] <- with(x, coop4(i, p, r))
    rates[["ref1"]] <- with(x, ref1(i, p, r, nc, o, uh, uo))
    rates[["ref2"]] <- with(x, ref2(i, p, r, nc, o, uh, uo, e))
    rates[["ref3"]] <- with(x, ref3(i, p, r, nc, o))
    rates[["con1"]] <- with(x, con1(i, p, r, nc, o, uh, uo))
    rates[["con2"]] <- with(x, con2(i, p, r, nc, o, uh, uo, e))
    rates[["con3"]] <- with(x, con3(i, p, r, nc, o))
    out <- structure(rates, class = "aapor_rates")
    out
}

#' @rdname rates
#' @export
rates.factor <- function(x, ...) {
    rates(as.character(x), ...)
}

#' @rdname rates
#' @export
rates.character <- function(x, w = NULL, e = 1, ...) {
    x <- tolower(x)
    disp_codes <- c("i", "p", "r", "nc", "o", "uh", "uo")
    if (any(!x %in% disp_codes)) {
        warning("'x' contains unrecognized disposition codes")
    }
    if (!is.null(w)) {
        if (length(x) != length(w)) {
            stop("length of 'w' (weights) not equal to length of 'x'")
        }
        dc <- lapply(disp_codes, 
                     function(disposition) { sum((x == disposition) * w) })
    } else {
        dc <- lapply(disp_codes, function(disposition) { sum(x == disposition) })
    }
    names(dc) <- disp_codes
    dc <- structure(c(dc, e = if (is.null(e)) 1 else e, n = length(x)), class = "disposition_summary")
    rates(dc, ...)
}

#' @rdname rates
#' @export
rates.table <- function(x, ...) {
    rates(as.list(x), ...)
}

#' @rdname rates
#' @export
rates.list <- function(x, e = 1, ...) {
    names(x) <- tolower(names(x))
    disp_codes <- c("i", "p", "r", "nc", "o", "uh", "uo")
    if (any(!names(x) %in% c(disp_codes, "e"))) {
        warning("'x' contains unrecognized disposition codes")
    }
    to_add <- disp_codes[!disp_codes %in% names(x)]
    x2 <- c(x, rep(0, length(to_add)))
    names(x2) <- c(names(x), to_add)
    dc <- structure(c(x2, e = if (is.null(e)) 1 else e, 
                      n = sum(unlist(x[names(x) %in% disp_codes]))), 
                    class = "disposition_summary")
    rates(dc)
}
