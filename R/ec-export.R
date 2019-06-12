#' Export an EtherCalc "room" to a local data frame
#'
#' @param room name of an EtherCalc "room"
#' @param ec_host See [ethercalc_host()]
#' @export
ec_export <- function(room, ec_host = ethercalc_host()) {

  room <- room[1]

  httr::GET(
    url = glue::glue("{ec_host}/_/{room}/csv")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  out

}

