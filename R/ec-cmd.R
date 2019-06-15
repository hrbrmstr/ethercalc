#' Issue EtherCalc "commands" to a room
#'
#' TODO find a cmd ref
#'
#' @param commands character vector of valid EtherCalc commands
#' @param room name of an EtherCalc "room"
#' @param ec_host See [ethercalc_host()]
#' @export
#' @examples \dontrun{
#' ec_cmd(c("set A1:E1 font normal bold \* \*", "deleterow A12"), "test")
#' }
ec_cmd <- function(commands = "", room, ec_host = ethercalc_host()) {

  room <- room[1]

  httr::POST(
    url = glue::glue("{ec_host}/_/{room}"),
    encode = "json",
    body = list(
      "command" = commands
    )
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  invisible(out)

}