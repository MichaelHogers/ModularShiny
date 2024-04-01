library(shiny)
library(bslib)

ui <- helperDesign::ui_wrapper(
    name = "App1",
    shiny::tags$div("First page content.")
)

server <- function(input, output, session) {

}

shinyApp(ui, server)
