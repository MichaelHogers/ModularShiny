server <- shiny::shinyServer(function(input, output, session) {
    ShinyAdmin::app_server(id = "app1")
})

ui <- helperDesign::ui_wrapper(
    name = "ShinyAdmin",
    ShinyAdmin::app_ui(id = "app1")
)

shiny::shinyApp(ui, server)
