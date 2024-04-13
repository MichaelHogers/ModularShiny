test_that("app_server works", {
    shiny::testServer(app_server, {

        # get init values
        count1 <- output$user_count


        # add new user and update
        session$setInputs(user_name = "test")
        session$setInputs(access_rights = "admin")
        session$setInputs(add_user_save = 1)

        session$flushReact()

        # retrieve new values
        count2 <- output$user_count

        # compare
        expect_true(!identical(count1, count2))
    })
})

test_that("app_ui works", {
    result <- app_ui(id = "app1")
    expect_s3_class(result, "shiny.tag.list")
})
