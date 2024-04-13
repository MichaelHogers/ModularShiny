test_that("get_users() works", {
    data <- get_users()
    expect_true(is.data.frame(data))
})

test_that("", {
    result <- add_user(
        user_name = "test_user",
        last_login = Sys.time(),
        access_rights = "example",
        testing = TRUE
    )
    expect_true(result)
})
