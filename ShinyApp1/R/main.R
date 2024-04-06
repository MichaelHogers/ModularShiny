#' @title Launch test app
#' @description Launch the shiny app inst inst/app, for local testing
#' @param port The port to run the app on
#' @param host The host to run the app on
#' @importFrom shiny shinyAppDir
#' @export
start_app <- function(
    port = 8080,
    host = "0.0.0.0"
) {
  shiny::shinyApp(
    ui = app_ui(id = "app1"),
    server = function(input, output, session) {
        app_server(id = "app1")
    },
    options = list(
      port = port,
      host = host
    )
  )
}

app_ui <- function(id) {
    helperDesign::ui_wrapper(
        name = "ShinyApp1",
        shiny::tags$div("ShinyApp1 functionality")
    )
}

app_server <- function(
    id
) {
    shiny::moduleServer(id, function(input, output, session) {
        logger::log_info("App1 server loaded")
    })
}
