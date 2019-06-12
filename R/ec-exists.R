#' Does an EtherCalc "room" name exist?
#'
#' @param room name of an EtherCalc "room"
#' @param ec_host See [ethercalc_host()]
#' @export
#' @examples
#' ec_exists("test")
ec_exists <- function(room, ec_host = ethercalc_host()) {

  room <- room[1]

  httr::GET(
    url = glue::glue("{ec_host}/_exists/{room}")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  out

}

