#' List all of the available EtherCalc documents
#'
#' Connects to the `ec_host` EtherCalc instance and retrieves
#' a list of all the available documents. Note that documents
#' ending in `_formdata` are for internal API use only and should
#' not be used as "room" names.
#'
#' @param all if `TRUE` then return a list of all "rooms" including the
#'        internal-use only `_formdata` rooms.
#' @param ec_host See [ethercalc_host()]
#' @export
#' @examples
#' ec_list()
ec_list <- function(all = FALSE, ec_host = ethercalc_host()) {

  httr::GET(
    url = "{ec_host}/_rooms"
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  if (all) return(out)

  grep("_formdata", out, value = TRUE, invert = TRUE)

}
