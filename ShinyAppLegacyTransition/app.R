library(shiny)
library(bslib)

# How to install the package from the mono repo
# remotes::install_github(
#     "MichaelHogers/ModularShiny/ShinyAdmin"
# )

ui <- bslib::page_navbar(
    title = "Penguins Ltd.",
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
        ShinyAdmin::app_ui(id = "ShinyAdmin")
    )
)

server <- function(input, output, session) {

    ShinyAdmin::app_server(id = "ShinyAdmin")
}

shiny::shinyApp(ui, server)
