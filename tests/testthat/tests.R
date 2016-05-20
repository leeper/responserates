context("rates() function")

context("S3 method dispatch for rates()")
test_that("rates() for character vector", {
    expect_true(inherits(rates("i"), "aapor_rates"))
})

test_that("rates() for factor vector", {
    expect_true(inherits(rates(factor("i")), "aapor_rates"))
})

test_that("rates() for character vector w/weights", {
    expect_true(inherits(rates("i", w = 1), "aapor_rates"))
})

test_that("rates() w/ non-default e", {
    expect_true(inherits(rates(c("i", "uh"), e = .5), "aapor_rates"))
})

test_that("rates() for list", {
    expect_true(inherits(rates(list(i = 1)), "aapor_rates"))
})

test_that("rates() for table", {
    expect_true(inherits(rates(table("i")), "aapor_rates"))
})

context("response rates")
test_that("response rates correct", {
    expect_true(is.numeric(rr1(1)))
    expect_true(rr1(1) == 1)

    expect_true(is.numeric(rr2(1)))
    expect_true(rr2(1) == 1)

    expect_true(is.numeric(rr3(1)))
    expect_true(rr3(1) == 1)

    expect_true(is.numeric(rr4(1)))
    expect_true(rr4(1) == 1)

    expect_true(is.numeric(rr5(1)))
    expect_true(rr5(1) == 1)

    expect_true(is.numeric(rr6(1)))
    expect_true(rr6(1) == 1)

})

context("refusal rates")
test_that("refusal rates correct", {
    expect_true(is.numeric(ref1(1)))
    expect_true(ref1(i = 1) == 0)
    expect_true(ref1(i = 0, r = 1) == 1)

    expect_true(is.numeric(ref2(1)))
    expect_true(ref2(i = 1) == 0)
    expect_true(ref2(i = 0, r = 1) == 1)

    expect_true(is.numeric(ref3(1)))
    expect_true(ref3(i = 1) == 0)
    expect_true(ref3(i = 0, r = 1) == 1)
})

context("cooperation rates")
test_that("cooperation rates correct", {
    expect_true(is.numeric(coop1(1)))
    expect_true(coop1(1) == 1)

    expect_true(is.numeric(coop2(1)))
    expect_true(coop2(1) == 1)

    expect_true(is.numeric(coop3(1)))
    expect_true(coop3(1) == 1)

    expect_true(is.numeric(coop4(1)))
    expect_true(coop4(1) == 1)
})

context("contact rates")
test_that("contact rates correct", {
    expect_true(is.numeric(con1(1)))
    expect_true(con1(1) == 1)
    
    expect_true(is.numeric(con2(1)))
    expect_true(con2(1) == 1)
    
    expect_true(is.numeric(con2(1)))
    expect_true(con2(1) == 1)
})
