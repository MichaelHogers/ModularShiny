test_that("access works", {
    resources <- rlang::fn_fmls(access)$resource
    resources <- eval(resources)

    lapply(resources, function(x) {
        access(
            user = "test@example.com",
            resource = x
        ) |>
        testthat::expect_in(c(TRUE, FALSE))
    })
})
