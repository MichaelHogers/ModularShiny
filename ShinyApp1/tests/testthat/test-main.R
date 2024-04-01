test_that("app1_server works", {
    shiny::testServer(app1_server, {
        # expect no error
    })
})

test_that("app1_ui works", {
    result <- app1_ui(id = "app1")
    expect_s3_class(result, "shiny.tag.list")
})
