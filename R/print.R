#' @export
print.disposition_summary <- function(x, ...) {
    cat("Disposition code summary\n")
    cat("Total units:              ", x[["n"]], "\n")
    cat("Completes, I:             ", x[["i"]], "\n")
    cat("Partials, P:              ", x[["p"]], "\n")
    cat("Refusals, R:              ", x[["r"]], "\n")
    cat("Non-contacts, NC:         ", x[["nc"]], "\n")
    cat("Other, O:                 ", x[["o"]], "\n")
    cat("Unknown if occupied, HU:  ", x[["uh"]], "\n")
    cat("Unknown other, HO:        ", x[["uo"]], "\n")
    cat("Est. elig. among unk., e: ", x[["e"]], "\n")
    invisible(x)
}

#' @export
print.aapor_rates <- function(x, fmt = "%.1f%%", ...) {
    x <- lapply(x, function(z) formatC(sprintf(fmt = fmt, 100*z), width = 6))
    #cat("Response Rate Summary\n")
    #cat(paste0(rep("=", 21), collapse = ""), "\n")
    cat("Response Rates\n")
    cat(" RR1:  ", x$rr1, "\n")
    cat(" RR2:  ", x$rr2, "\n")
    cat(" RR3:  ", x$rr3, "\n")
    cat(" RR4:  ", x$rr4, "\n")
    cat(" RR5:  ", x$rr5, "\n")
    cat(" RR6:  ", x$rr6, "\n")
    cat("Cooperation Rates\n")
    cat(" COOP1:", x$coop1, "\n")
    cat(" COOP2:", x$coop2, "\n")
    cat(" COOP3:", x$coop3, "\n")
    cat(" COOP4:", x$coop4, "\n")
    cat("Refusal Rates\n")
    cat(" REF1: ", x$ref1, "\n")
    cat(" REF2: ", x$ref2, "\n")
    cat(" REF3: ", x$ref3, "\n")
    cat("Contact Rates\n")
    cat(" CON1: ", x$con1, "\n")
    cat(" CON2: ", x$con2, "\n")
    cat(" CON3: ", x$con3, "\n")
    invisible(x)
}

#' @export
print.response_rate <- function(x, fmt = "%.1f%%", ...) {
    cat("Response Rate (", 
        toupper(attr(x, "rate")), "): ", 
        formatC(sprintf(fmt = fmt, 100*x), width = 6),
        "\n", sep = "")
    invisible(x)
}
