# Getting the raw data from https://en.wikipedia.org/wiki/List_of_airports_by_IATA_and_ICAO_code

library(dplyr)
library(purrr)
library(rvest)
library(ggmap)

start_url <- "https://en.wikipedia.org/wiki/List_of_airports_by_IATA_and_ICAO_code"

get_tables <- function(link){
  link %>%
    read_html() %>%
    html_nodes(".wikitable") %>%
    html_table() %>%
    `[[`(1) %>%
    return()
}

Data_IATA <- start_url %>%
  read_html() %>%
  html_nodes(css = ".navbox-odd") %>%
  `[[`(1) %>%
  html_nodes(css = "a") %>%
  html_attr("href") %>%
  paste0("https://en.wikipedia.org",.) %>%
  map_dfr(., get_tables) %>%
  filter(!grepl("-",IATA))

names(Data_IATA) <- c("IATA", "ICAO", "Airport_name", "Location_served", "Time", "DST")
