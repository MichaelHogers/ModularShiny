#' Retrieve all users in a df
#'
#' This retrieves user data from the database
#' (not always advisable to read the entire table)
#' @return A data frame with user data
#' @export
get_users <- function() {
    DBI::dbReadTable(
        conn = get_db_connection(),
        name = "users"
    )
}

#' Retrieve user count
#' @return The number of users, an integer
#' @export
get_user_count <- function() {
    conn <- get_db_connection()
    res <- DBI::dbGetQuery(
        conn,
        "SELECT COUNT(*) AS n FROM users"
    )
    DBI::dbDisconnect(conn)
    as.integer(res$n)
}

#' Add a user to the database
#' @param user_name The user's name
#' @param last_login The user's last login
#' @param access_rights The user's access rights
#' @param testing Whether to run in testing mode, will rollback
#' the db transaction if TRUE
#' @return true if successful
#' @export
add_user <- function(
    user_name,
    last_login,
    access_rights,
    testing = FALSE
) {

    entry <- data.frame(
        user_name = user_name,
        last_login = last_login,
        access_rights = access_rights
    )

    conn <- get_db_connection()

    DBI::dbWithTransaction(
      conn, {
        DBI::dbWriteTable(
            conn = conn,
            name = "users",
            value = entry,
            append = TRUE
        )

        if (testing) {
            # rolls back the transaction
            DBI::dbBreak()
        }
    })

    DBI::dbDisconnect(conn)

    TRUE

}
