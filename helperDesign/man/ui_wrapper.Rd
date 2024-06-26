% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ui.R
\name{ui_wrapper}
\alias{ui_wrapper}
\title{Generate a UI wrapper}
\usage{
ui_wrapper(ui, name = c("App1", "App2", "App3"))
}
\arguments{
\item{ui}{the UI to wrap}

\item{name}{the name of the app module, one of
"App1", "App2", "App3", "Admin"}
}
\value{
a standardised dashboard layout, shiny.tag.list class
}
\description{
This UI wrapper creates a standardised app layout, the name argument
points to specific Shiny modules. Setting "App1", will render the
first navbar item as active.
}
