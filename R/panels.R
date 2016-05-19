# internet panel rates

## recruitment rate
recr <- function(initial, r, nc, o, uh, uo, e = 1) {
    rate <- (initial) / ((initial) + (r + nc + o) + (e*(uh + uo)) )
    rate
}

## profile rate
pror <- function(i, p = NULL, r, nc, o) {
    if (is.null(p)) {
        rate <- (i) / ((i + p) + (r + nc + o))
    } else {
        rate <- (i + p) / ((i + p) + (r + nc + o))
    }
    rate
}

## completion rate
comr <- function() {
}

## cumulative response rate
cumrr <- function(initial, i, p = NULL, r, nc, o, uh, uo, e = 1) {
    recr <- recr(initial, r, nc, o, uh, uo, e)
    pror <- pror(i, p, r, nc, o)
    comr <- comr(i, p, r, nc, o)
    recr * pror * comr
}
