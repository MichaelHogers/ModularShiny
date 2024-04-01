#' Checks whether the user has access to a resource
#'
#' This is for demonstration purposes, ideally this package is connected
#' to a database or other authentication system.
#' @param user the user to check
#' @param resource one of
#' - "App1"
#' - "App2"
#' - "App3"
#' @return TRUE if the user has access, FALSE otherwise
#' @export
access <- function(
    user,
    resource = c(
        "App1",
        "App2",
        "App3"
    )) {

    resource <- match.arg(resource)

    return(TRUE)
}
