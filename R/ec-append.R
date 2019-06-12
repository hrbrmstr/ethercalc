#' Append a data frame to a "room", optionally starting at a given row
#'
#' @param x a data frame
#' @param room name of an existing EtherCalc "room".
#' @param at if not "`end`" then the row where the data will be inserted and pasted at.
#' @param browse if `TRUE` (`FALSE` is the default) then open up a browser tab/window to
#'        the room
#' @param ... passed on to [write.csv()]
#' @param ec_host See [ethercalc_host()]
#' @return the commands used by EtherCalc to process the append operation (invisibly)
#' @export
#' @examples
#' ec_edit(iris, "test")
#' ec_append(iris, "test")
ec_append <- function(x, room, at = "end", browse = FALSE, ..., ec_host =ethercalc_host()) {

  stopifnot(is.data.frame(x))
  at <- at[1]

  params <- list()
  if (at != "end") params[["row"]] <- at

  httr::POST(
    url = glue::glue("{ec_host}/_/{room}"),
    httr::content_type("text/csv"),
    httr::add_headers(
      `Accept-Encoding` = "",
      `User-Agent` = ""
    ),
    encode = "raw",
    query = params,
    body = paste0(capture.output(write.csv(x, row.names = FALSE, ...)), collapse = "\n")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  if (out == "OK") out <- glue::glue("/{room}")

  out <- glue::glue("{ec_host}{out}")

  invisible(out)

}


