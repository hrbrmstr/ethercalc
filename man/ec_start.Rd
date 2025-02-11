% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ec-start.R
\name{ec_start}
\alias{ec_start}
\title{Start an EtherCalc instance (requires you to install EtherCalc first)}
\usage{
ec_start(host = "localhost", port = 8000, args = NULL)
}
\arguments{
\item{host, port}{interface and port for \code{ethercalc} to bind to. Defaults
to \code{localhost} and \code{8000}.}

\item{args}{optional arguments to pass in to the \code{ethercalc} executable}
}
\value{
a \code{processx} \code{process} object
}
\description{
If you have a working Node.js installation and have performed an "\code{npm i -g ethercalc}"
this function will look for the \code{ethercalc} executable and run start it in the background.
You should save the return value since that will allow you to stop the instance (the
instance will stop when the R session is termianted). You can
also add arguments to the call via the \code{args} parameter.
}
\details{
You \emph{really} should consider installing and running a local copy of \code{redis} to get
an efficient, persistent store for your spreadsheets.
}
\examples{
\dontrun{
ec_start()
}
}
