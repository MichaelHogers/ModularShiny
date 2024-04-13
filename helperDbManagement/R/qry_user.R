#' User query
#'
#' This retrieves user data from the database
#' @export
get_users <- function() {
    DBI::dbReadTable(
        get_db_connection(),
        "users"
    )
}
