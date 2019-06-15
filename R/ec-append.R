#' Append a data frame to a "room", optionally starting at a given row
#'
#' @note Since this is an append operation the header will not be sent. Set
#'       `col_names` and `append` (both) to `TRUE`
#' @note You will receive an error if `x` has a total cell count over 500,000.
#' @param x a data frame
#' @param room name of an existing EtherCalc "room".
#' @param at if not "`end`" then the row where the data will be inserted and pasted at.
#' @param append,col_names see [readr::write_csv()] and this function's Note
#' @param browse if `TRUE` (`FALSE` is the default) then open up a browser tab/window to
#'        the room
#' @param ... passed on to [write.csv()]
#' @param ec_host See [ethercalc_host()]
#' @return the commands used by EtherCalc to process the append operation (invisibly)
#' @family EthercCalc importers/exporters
#' @export
#' @examples \dontrun{
#' ec_edit(iris, "test")
#' ec_append(iris, "test")
#' }
ec_append <- function(x, room, at = "end", append = TRUE, col_names = FALSE,
                      browse = FALSE, ..., ec_host =ethercalc_host()) {

  stopifnot(is.data.frame(x))

  cell_ct <- Reduce(`*`, dim(x))

  if (cell_ct > .EC_MAX_CELLS) {
    stop(
      "EtherCalc's behaviour is unstable when posting a data frame with ",
      "more than 500,000 total cells. Your data frame has a total of ",
      formatC(cell_ct, format="d", big.mark=","), " cells and the sheet ",
      "you are appending to may already have cells.",
      call.=FALSE
    )
  }

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
    body = to_csv_text(x, append = append, col_names = col_names)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  if (out == "OK") out <- glue::glue("/{room}")

  out <- glue::glue("{ec_host}{out}")

  invisible(out)

}


