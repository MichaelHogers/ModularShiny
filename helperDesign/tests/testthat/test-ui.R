test_that("ui_wrapper works", {
    fn_args <- rlang::fn_fmls(helperDesign::ui_wrapper)
    lapply(eval(fn_args$name), function(x) {
        result <- ui_wrapper(
            ui = shiny::tags$div("a"),
            name = x
        )
        expect_s3_class(result, "shiny.tag.list")
    })
})
