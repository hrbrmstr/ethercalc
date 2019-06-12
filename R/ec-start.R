#' Start an EtherCalc instance (requires you to install EtherCalc first)
#'
#' If you have a working Node.js installation and have performed an "`npm i -g ethercalc`"
#' this function will look for the `ethercalc` executable and run start it in the background.
#' You should save the return value since that will allow you to stop the instance (the
#' instance will stop when the R session is termianted). You can
#' also add arguments to the call via the `args` parameter.
#'
#' @param host,port interface and port for `ethercalc` to bind to. Defaults
#'        to `localhost` and `8000`.
#' @param args optional arguments to pass in to the `ethercalc` executable
#' @return a `processx` `process` object
#' @export
ec_start <- function(host = "localhost", port = 8000, args = NULL) {

  ec_cmd <- Sys.which("ethercalc")
  if (ec_cmd == "") {

    advice <- ""
    if (Sys.which("npm") == "") {
      advice <- paste0(c(
        "'npm'/Node.js not found.",
        "Please install Node.js (https://nodejs.org/) and ",
        "'npm' (https://www.npmjs.com/) for your platform, then run 'npm i -g ethercalc'."
      ), collapse = " ")
    } else {
      advice <- "Please run 'npm i -g ethercalc' to install EtherCalc."
    }

    stop(
      "'ethercalc' executable not found.\n", advice, call.=FALSE
    )

  }

  processx::process$new(
    command = ec_cmd,
    args = c("--host", host, "--port", port, args),
    supervise = TRUE
  )

}