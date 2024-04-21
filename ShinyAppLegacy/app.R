library(shiny)
library(bslib)

ui <-   bslib::page_navbar(
    title = "Example Ltd.",
    theme = bslib::bs_theme(
        version = 5
    ),
    sidebar = bslib::sidebar(
        title = "Company information",
        bg = "#003366",
        width = "20%",
        class = "fw-bold font-monospace",
        "Company news"
    ),
    bslib::nav_panel(
        title = "ShinyApp1",
        bslib::page_fillable(
            "ShinyApp1"
        )
    ),
    bslib::nav_panel(
        title = "ShinyApp2",
        bslib::page_fillable(
            "ShinyApp2"
        )
    ),
    bslib::nav_panel(
        title = "ShinyApp3",
        bslib::page_fillable(
            "ShinyApp3"
        )
    ),
    bslib::nav_panel(
        title = "ShinyAdmin",
        bslib::page_fillable(
            bslib::layout_column_wrap(
            width = "250px",
            fill = FALSE,
            bslib::value_box(
                title = "Registered users",
                value = shiny::uiOutput(
                outputId = ("user_count")
                ),
                showcase = bsicons::bs_icon("bar-chart"),
                theme = "blue",
                shiny::tags$p("
                    These users completed the entire registration journey
                ")
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
                inputId = ("add_user_modal"),
                label = "Add user",
                class = "btn-secondary float-right"
                )
            ),
            DT::dataTableOutput(("dt"))
            )
        )
    )
)

server <- function(input, output, session) {

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
          shiny::textInput(("user_name"), "User name"),
          shiny::selectInput(
           ("access_rights"), "Access rights", c("admin", "user")
          ),
          shiny::actionButton(("add_user_save"), "Save")
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

}

shinyApp(ui, server)
