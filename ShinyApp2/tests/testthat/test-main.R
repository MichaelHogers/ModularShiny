test_that("app_server works", {
    shiny::testServer(app_server, {
        # expect no error
    })
})

test_that("app_ui works", {
    result <- app_ui(id = "app1")
    expect_s3_class(result, "shiny.tag.list")
})
