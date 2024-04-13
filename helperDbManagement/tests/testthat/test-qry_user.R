test_that("get_users() works", {
    data <- get_users()
    expect_true(is.data.frame(data))
})
