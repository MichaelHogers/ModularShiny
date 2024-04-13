test_that("get_users() works", {
    data <- get_users()
    expect_true(is.data.frame(data))
})

test_that("add_user works", {
    result <- add_user(
        user_name = "test_user",
        last_login = Sys.time(),
        access_rights = "example",
        testing = TRUE
    )
    expect_true(result)
})

test_that("get_user_count works", {
    result <- get_user_count()
    expect_true(is.integer(result))
})
