#' Generate a UI wrapper
#'
#' This UI wrapper creates a standardised app layout, the name argument
#' points to specific Shiny modules. Setting "App1", will render the
#' first navbar item as active.
#' @param ui the UI to wrap
#' @param name the name of the app module
#' @return a standardised dashboard layout, shiny.tag.list class
#' @export
ui_wrapper <- function(
    ui,
    name = c("App1", "App2", "App3")
) {
  bslib::page_navbar(
    title = "Penguins Ltd.",
    theme = internal_theme,
    sidebar = bslib::sidebar(
      title = "Company information",
      bg = "#003366",
      width = "20%",
      class = "fw-bold font-monospace",
      "Company news"
    ),
    bslib::nav_panel(title = "App1", shiny::tags$p("First page content.")),
    bslib::nav_panel(title = "App2", shiny::tags$p("Second page content.")),
    bslib::nav_panel(title = "App3", shiny::tags$p("Third page content.")),
    bslib::nav_spacer()
  )
}
