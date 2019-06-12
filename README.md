
[![Travis-CI Build
Status](https://travis-ci.org/hrbrmstr/ethercalc.svg?branch=master)](https://travis-ci.org/hrbrmstr/ethercalc)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/ethercalc/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/ethercalc)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/ethercalc)](https://cran.r-project.org/package=ethercalc)

# ethercalc

Orchestrate and Exchange Data with ‘EtherCalc’ Instances

## Description

The ‘EtherCalc’ (<https://ethercalc.net/>) web application is a
multi-user, collaborative spreadsheet that can be run locally on
virtually any modern operating system. Methods are provided to
orchestrate and exchange data with ‘EtherCalc’ instances.

![](man/figures/ethercalc-example.gif)

## What’s Inside The Tin

The following functions are implemented:

  - `ec_start`: Start an EtherCalc instance (requires you to install
    EtherCalc first)
  - `ec_new`: Create a new, empty EtherCalc “room”
  - `ec_view`: Open a browser window/tab to an EtherCalc “room”
  - `ec_list`: List all of the available EtherCalc documents
  - `ec_edit`: Edit a data frame in a new or existing EtherCalc “room”
  - `ec_append`: Append a data frame to a “room”, optionally starting at
    a given row
  - `ec_delete`: Delete a “room” from an EtherCalc instance
  - `ec_export`: Export an EtherCalc “room” to a local data frame
  - `ec_exists`: Does an EtherCalc “room” name exist?
  - `ec_cmd`: Issue EtherCalc “commands” to a room
  - `ethercalc_host`: Get or set ETHERCALC\_HOST value

## Installation

``` r
devtools::install_git("https://git.sr.ht/~hrbrmstr/ethercalc.git")
# or
devtools::install_git("https://git.rud.is/hrbrmstr/ethercalc.git")
# or
devtools::install_gitlab("hrbrmstr/ethercalc")
# or
devtools::install_bitbucket("hrbrmstr/ethercalc")
# or
devtools::install_github("hrbrmstr/ethercalc")
```

## Usage

``` r
library(ethercalc)

# current version
packageVersion("ethercalc")
## [1] '0.1.0'
```

## ethercalc Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |       13 | 0.93 | 162 | 0.94 |          86 | 0.82 |      125 | 0.73 |
| Rmd  |        1 | 0.07 |  10 | 0.06 |          19 | 0.18 |       46 | 0.27 |

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
