homePage <- shiny::tags$div(
    shiny::tags$h1("Welcome to Shiny SaaS"),
    shiny::tags$p(
        "This is a simple Shiny app, meant to illustrate a legacy Shiny app that we want to further evolve into something that can function as
        part of a SaaS setup."
    )
)

servicePages <- lapply(1:5, function(x){
    shiny::tags$div(
        shiny::tags$h1(paste0("Service ", x))
    )
})

adminPage <- shiny::tags$div(
    shiny::tags$h1("Admin Page")
)

ui <- page_navbar(
  title = "Shiny SaaS",
  nav_spacer(),
  nav_panel("Home", homePage),
  nav_panel("Service 1", servicePages[[1]]),
  nav_panel("Service 2", servicePages[[2]]),
  nav_panel("Service 3", servicePages[[3]]),
  nav_panel("Admin page", adminPage)
)
