#' Get or set ETHERCALC_HOST value
#'
#' The API wrapper functions in this package all rely on using EtherCalc instance
#' info residing in the environment variable `ETHERCALC_HOST`. The
#' easiest way to accomplish this is to set it in the `.Renviron` file in your
#' home directory.
#'
#' @md
#' @param force Force setting a new EtherCalc ETHERCALC_HOST info for the current environment?
#' @return atomic character vector containing the EtherCalc ETHERCALC_HOST value
#' @export
#' @examples \dontrun{
#' ethercalc_host("http://localhost:8000")
#' }
ethercalc_host <- function(force = FALSE) {

  env <- sub("/$", "", Sys.getenv("ETHERCALC_HOST"))

  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop(
      "Please set env var ETHERCALC_HOST to the URL prefix of your EtherCalc instance",
      call. = FALSE
    )
  }

  message(
    "Couldn't find env var ETHERCALC_HOST See ?ethercalc_host for more details.\n",
    "Please enter your URL prefix of your EtherCalc instance and press enter:"
  )

  val <- readline(": ")

  if (identical(val, "")) {
    stop("URL prefix of your EtherCalc instance entry failed", call. = FALSE)
  }

  message("Updating ETHERCALC_HOST env var...")

  Sys.setenv(ETHERCALC_HOST = sub("/$", "", val))

  val

}