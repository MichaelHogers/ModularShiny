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

#' Main application UI module
#' @param id namespace
#' @export
app_ui <- function(id) {
  ns <- shiny::NS(id)

  bslib::page_fillable(
    bslib::layout_column_wrap(
      width = "250px",
      fill = FALSE,
      bslib::value_box(
        title = "Registered users",
        value = shiny::uiOutput(
          outputId = ns("user_count")
        ),
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
      plotly::plot_ly(x = stats::rnorm(100))
    ),
    bslib::card(
      full_screen = TRUE,
      max_height = 350,
      bslib::card_header(
        "User table",
        shiny::actionButton(
          inputId = ns("add_user_modal"),
          label = "Add user",
          class = "btn-secondary float-right"
        )
      ),
      DT::dataTableOutput(ns("dt"))
    )
  )
}

#' Main application server module
#' @param id namespace
#' @export
app_server <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {

    ns <- session$ns

    update_trigger <- shiny::reactiveVal()

    # Display user count -----------------------------------------------
    output$user_count <- shiny::renderUI({
      update_trigger()
      shiny::tagList(
        helperDbManagement::get_user_count()
      )
    })

    # Add user modal --------------------------------------------------
    shiny::observeEvent(input$add_user_modal, {
      shiny::showModal(
        shiny::modalDialog(
          title = "Add user",
          shiny::textInput(ns("user_name"), "User name"),
          shiny::selectInput(
           ns("access_rights"), "Access rights", c("admin", "user")
          ),
          shiny::actionButton(ns("add_user_save"), "Save")
        )
      )
    })

    shiny::observeEvent(input$add_user_save, {
      result <- helperDbManagement::add_user(
        user_name = input$user_name,
        last_login = Sys.time(),
        access_rights = input$access_rights
      )
      if (result) {
        shiny::showNotification("User added", duration = 5)
        shiny::removeModal()
        update_trigger(runif(1))
      } else {
        shiny::showNotification("Failed to add user", duration = 5)
      }
    })

    # Display user table -----------------------------------------------
    output$dt <- DT::renderDataTable({
      update_trigger()
      DT::datatable(
        helperDbManagement::get_users(),
        fillContainer = TRUE
      )
    })

  })
}
