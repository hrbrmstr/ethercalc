#' Create a new, empty EtherCalc "room"
#'
#' @param room name of an EtherCalc "room"
#' @param browse if `TRUE` (default) then open up a browser tab/window to the new room
#' @param ec_host See [ethercalc_host()]
#' @return the full URL to the newly created room (invisibly)
#' @export
#' @examples
#' ec_new("test")
ec_new <- function(room, browse = TRUE, ec_host = ethercalc_host()) {

  room <- room[1]

  if (browse) ec_view(room = room, ec_host = ec_host)

  invisible(glue::glue("{ec_host}/{room}"))

}

#' Open a browser window/tab to an EtherCalc "room"
#'
#' @param room name of an EtherCalc "room"
#' @param ec_host See [ethercalc_host()]
#' @export
ec_view <- function(room, ec_host = ethercalc_host()) {

  room <- room[1]

  browseURL(glue::glue("{ec_host}/{room}"))

}
