#' Read an EtherCalc "room" to a local data frame
#'
#' @param room name of an EtherCalc "room"
#' @param ... passed on to [readr::read_csv()]
#' @param ec_host See [ethercalc_host()]
#' @family EthercCalc importers/exporters
#' @export
#' @examples \dontrun{
#' ec_edit(mtcars, "mtcars")
#' ec_read("mtcars")
#' }
ec_read <- function(room, ..., ec_host = ethercalc_host()) {

  room <- room[1]

  httr::GET(
    url = glue::glue("{ec_host}/_/{room}/csv")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "raw")

  out <- readr::read_csv(out, ...)

  out

}

#' Export an EtherCalc "room" to a local file
#'
#' @param room name of an EtherCalc "room"
#' @param type EtherCalc supports exporting as CSV, JSON, HTML, markdown, or Excel.
#'        Use "`csv`", "`json`", "`html`", "`md`", or "`xlsx`" (respectively).
#' @param path place to save the file. Value will be [path.expand()]ed but you
#'        are responsible for naming the file (including extension).
#' @param overwrite overwrite `path` if a file exists? Default: `TRUE`.
#' @param ec_host See [ethercalc_host()]
#' @return a `raw` vector containing the contents of what was written to `path`.
#' @family EthercCalc importers/exporters
#' @export
#' @examples \dontrun{
#' ec_edit(mtcars, "mtcars")
#' ec_export("mtcars", "csv", "mtcars.csv")
#' ec_export("mtcars", "json", "mtcars.json")
#' ec_export("mtcars", "html", "mtcars.html")
#' ec_export("mtcars", "md", "mtcars.md")
#' ec_export("mtcars", "xlsx", "mtcars.xlsx")
#' }
ec_export <- function(room, type = c("csv", "json", "html", "md", "xlsx"),
                      path, overwrite = TRUE, ec_host = ethercalc_host()) {

  room <- room[1]

  type <- match.arg(type[1], c("csv", "json", "html", "md", "xlsx"))

  path <- path.expand(path)

  export <- .export_trans[[type]]

  httr::GET(
    url = glue::glue("{ec_host}/{room}.{export}"),
    httr::write_disk(path, overwrite = overwrite)
  ) -> res

  httr::stop_for_status(res)

  invisible(httr::content(res, as = "raw"))

}
