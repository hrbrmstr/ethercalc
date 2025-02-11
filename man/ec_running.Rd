% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ec-running.R
\name{ec_running}
\alias{ec_running}
\title{Export an EtherCalc "room" to a local data frame}
\usage{
ec_running(timeout = 1, ec_host = ethercalc_host())
}
\arguments{
\item{timeout}{how long to wait (useful if accessing a remote ethercalc)}

\item{ec_host}{See \code{\link[=ethercalc_host]{ethercalc_host()}}}
}
\description{
Export an EtherCalc "room" to a local data frame
}
\examples{
\dontrun{
ec_running()
}
}
