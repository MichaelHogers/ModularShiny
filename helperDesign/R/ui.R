#' Generate a UI wrapper
#'
#' This UI wrapper creates a standardised app layout, the name argument
#' points to specific Shiny modules. Setting "App1", will render the
#' first navbar item as active.
#' @param ui the UI to wrap
#' @param name the name of the app module, one of
#' "App1", "App2", "App3", "Admin"
#' @return a standardised dashboard layout, shiny.tag.list class
#' @export
ui_wrapper <- function(
    ui,
    name = c(
      "ShinyApp1",
      "ShinyApp2",
      "ShinyApp3",
      "ShinyAdmin"
    )
) {

  name <- match.arg(name)

  bslib::page_navbar(
    title = "Example Ltd.",
    theme = internal_theme,
    sidebar = bslib::sidebar(
      title = "Company information",
      bg = "#003366",
      width = "20%",
      class = "fw-bold font-monospace",
      "Company news"
    ),
    !!!generate_ui(
      name = name,
      ui = ui
    ),
    bslib::nav_spacer()
  )
}

endpoints <- list(
  "ShinyApp1" = "/app/app1",
  "ShinyApp2" = "/app/app2",
  "ShinyApp3" = "/app/app3",
  "ShinyAdmin" = "/app/admin"
)

generate_ui <- function(
  name,
  ui
) {
  result <- lapply(names(endpoints), function(app) {
    active <- app == name

    if (active) {
      bslib::nav_panel(
        title = app,
        ui
      )
    } else {
      url <- endpoints[[app]]
      bslib::nav_item(
        shiny::tags$a(
          app,
          href = url,
          target = "_parent"
        ),
        active = active
      )
    }
  })
}
