#' Edit a data frame in a new or existing EtherCalc "room"
#'
#' @param x a data frame
#' @note You will receive an error if `x` has a total cell count over 500,000.
#' @param room name of an existing EtherCalc "room" or `NULL` to create a new one
#' @param browse if `TRUE` (default) then open up a browser tab/window to the new room
#' @param ... passed on to [write.csv()]
#' @param ec_host See [ethercalc_host()]
#' @family EthercCalc importers/exporters
#' @export
#' @examples \dontrun{
#' ec_edit(iris, "test")
#' }
ec_edit <- function(x, room = NULL, browse = TRUE, ..., ec_host =ethercalc_host()) {

  stopifnot(is.data.frame(x))

  cell_ct <- Reduce(`*`, dim(x))

  if (cell_ct > .EC_MAX_CELLS) {
    stop(
      "EtherCalc's behaviour is unstable when posting a data frame with ",
      "more than 500,000 total cells. Your data frame has a total of ",
      formatC(cell_ct, format = "d", big.mark = ","), " cells.",
      call.=FALSE
    )
  }

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
    httr::add_headers(
      `Accept-Encoding` = "",
      `User-Agent` = ""
    ),
    encode = "raw",
    body = to_csv_text(x)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  if (out == "OK") out <- glue::glue("/{room}")

  out <- glue::glue("{ec_host}{out}")

  if (browse) browseURL(out)

  invisible(out)

}


