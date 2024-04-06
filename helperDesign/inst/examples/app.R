library(shiny)
library(bslib)

ui <- helperDesign::ui_wrapper(
    name = "ShinyApp2",
    shiny::tags$div("First page content.")
)

server <- function(input, output, session) {

}

shinyApp(ui, server)
