#' IATA localization
#'
#' where_iata answers the question: "Where is located the airport with this IATA code?".
#'
#' @param IATA_code a string or vector of strings containing the three letters IATA code(s)
#'
#' @return
#' A dataframe containing IATA code, ICAO codes, Airport name, Location served, Time zone, and DST.
#'
#' Some of the fields may be `na`.
#'
#' @export
#'
#' @examples
#' where_iata("YVR")
#' where_iata(c("YVR","CHC"))
#'
where_iata <- function(IATA_code) {
  IATA_here <- dplyr::filter(Data_IATA, IATA %in% IATA_code)

  if(nrow(IATA_here) == 0) stop("IATA code(s) not found")

  return(IATA_here)
}

globalVariables(c("Data_IATA", "IATA"))
