#' Create database connection
#'
#' Currently sqlite, please note that sqlite has significant limitations
#' in a multi-tenant environment with several modules sharing a database
#' and is not recommended for production use unless it fits your use case.
get_db_connection <- function() {
    DBI::dbConnect(
        RSQLite::SQLite(),
        dbname = system.file(
            "extdata/db.sqlite3",
            package = "helperDbManagement"
        )
    )
}
