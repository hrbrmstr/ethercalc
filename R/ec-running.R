#' Export an EtherCalc "room" to a local data frame
#'
#' @param timeout how long to wait (useful if accessing a remote ethercalc)
#' @param ec_host See [ethercalc_host()]
#' @export
ec_running <- function(timeout = 1, ec_host = ethercalc_host()) {

  res <- try(httr::GET(ec_host, httr::timeout(timeout)), silent = TRUE)
  if (inherits(res, "try-error")) {
    message("ethercalc is not running.")
    return(invisible(FALSE))
  } else {
    pg <- httr::content(res)
    title_node <- xml2::xml_find_first(pg, ".//title")
    title_text <- xml2::xml_text(title_node)
    out <- any(grepl("ethercalc", title_text, ignore.case=TRUE))
    if (out) message("ethercalc is running.") else message("ethercalc is not running.")
    return(invisible(out))
  }

}

