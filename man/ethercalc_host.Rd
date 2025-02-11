% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ethercalc-host.R
\name{ethercalc_host}
\alias{ethercalc_host}
\title{Get or set ETHERCALC_HOST value}
\usage{
ethercalc_host(force = FALSE)
}
\arguments{
\item{force}{Force setting a new EtherCalc ETHERCALC_HOST info for the current environment?}
}
\value{
atomic character vector containing the EtherCalc ETHERCALC_HOST value
}
\description{
The API wrapper functions in this package all rely on using EtherCalc instance
info residing in the environment variable \code{ETHERCALC_HOST}. The
easiest way to accomplish this is to set it in the \code{.Renviron} file in your
home directory.
}
\examples{
\dontrun{
ethercalc_host("http://localhost:8000")
}
}
