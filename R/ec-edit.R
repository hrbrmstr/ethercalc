#' Edit a data frame in a new or existing EtherCalc "room"
#'
#' @param x a data frame
#' @param room name of an existing EtherCalc "room" or `NULL` to create a new one
#' @param browse if `TRUE` (default) then open up a browser tab/window to the new room
#' @param ... passed on to [write.csv()]
#' @param ec_host See [ethercalc_host()]
#' @export
#' @examples
#' ec_edit(iris, "test")
ec_edit <- function(x, room = NULL, browse = TRUE, ..., ec_host =ethercalc_host()) {

  stopifnot(is.data.frame(x))

  verb <- NULL

  if (is.null(room)) {

    verb <- "POST"
    ec_url <- glue::glue("{ec_host}/_")

  } else {

    room <- room[1]
    verb <- "PUT"
    ec_url <- glue::glue("{ec_host}/_/{room}")

  }

  httr::VERB(
    verb = verb,
    url = ec_url,
    httr::content_type("text/csv"),
    encode = "raw",
    body = paste0(capture.output(write.csv(x, row.names = FALSE, ...)), collapse = "\n")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  if (out == "OK") out <- glue::glue("/{room}")

  out <- glue::glue("{ec_host}{out}")

  if (browse) browseURL(out)

  invisible(out)

}


