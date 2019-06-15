#' Orchestrate and Exchange Data with 'EtherCalc' Instances
#'
#' The 'EtherCalc' (<https://ethercalc.net/>) web application is a multi-user,
#' collaborative spreadsheet that can be run locally on virtually any modern operating system.
#' Methods are provided to orchestrate and exchange data with 'EtherCalc' instances.
#'
# \if{html}{
# \figure{ethercalc-example.gif}{options: width="100\%" alt="Figure: EtherCalc in action"}
# }
#'
#' @md
#' @name ethercalc
#' @keywords internal
#' @author Bob Rudis (bob@@rud.is)
#' @import httr processx
#' @importFrom glue glue
#' @importFrom utils browseURL
#' @importFrom jsonlite fromJSON
#' @importFrom readr read_csv write_csv
#' @importFrom xml2 xml_find_first xml_text
"_PACKAGE"
