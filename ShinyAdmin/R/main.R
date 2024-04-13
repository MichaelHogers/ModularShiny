#' @title Launch test app
#' @description Launch the shiny app inst inst/app, for local testing
#' @param port The port to run the app on
#' @param host The host to run the app on
#' @importFrom shiny shinyAppDir
#' @export
start_app <- function(
    port = 8080,
    host = "0.0.0.0") {
  shiny::shinyAppDir(
    system.file("app/",
      package = "ShinyAdmin"
    ),
    options = list(
      port = port,
      host = host
    )
  )
}

#' @export
app_ui <- function(id) {

  ns <- shiny::NS(id)

  bslib::page_fillable(
    bslib::layout_column_wrap(
      width = "250px",
      fill = FALSE,
      bslib::value_box(
        title = "Registered users",
        value = "5,000",
        showcase = bsicons::bs_icon("bar-chart"),
        theme = "blue",
        shiny::tags$p("These users completed the entire registration journey")
      ),
      bslib::value_box(
        title = "Daily page visits",
        value = "1,000",
        showcase = bsicons::bs_icon("graph-up"),
        theme = "light"
      )
    ),
    bslib::card(
      min_height = 200,
      plotly::plot_ly(x = rnorm(100))
    ),
    bslib::card(
      full_screen = TRUE,
      max_height = 350,
      bslib::card_header("My table"),
      DT::dataTableOutput(ns("dt"))
    )
  )
}

#' @export
app_server <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    logger::log_info("app server loaded")

    output$dt <- DT::renderDataTable({
      DT::datatable(
        data.frame(
          `User` = c("Alice", "Bob", "Charlie"),
          `Number of Logins` = c(10, 20, 30),
          check.names = FALSE
        ),
        fillContainer = TRUE
      )
    })
  })
}
