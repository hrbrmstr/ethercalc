to_csv_text <- function(xdf, ...) {

  r <- rawConnection(raw(0), "r+")
  on.exit(close(r), add=TRUE)

  readr::write_csv(
    x = xdf,
    path = r,
    ...
  ) -> res

  invisible(rawConnectionValue(r))

}