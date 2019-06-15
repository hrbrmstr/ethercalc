#' Delete a "room" from an EtherCalc instance
#'
#' @param room name of an EtherCalc "room"
#' @param ec_host See [ethercalc_host()]
#' @export
#' @examples \dontrun{
#' ec_delete("test")
#' }
ec_delete <- function(room, ec_host = ethercalc_host()) {

  ec_host <- sub("/$", "", ec_host[1])
  room <- room[1]

  httr::DELETE(
    url = glue::glue("{ec_host}/_/{room}")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")

  invisible(out)

}
