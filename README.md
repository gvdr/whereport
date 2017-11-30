[![Travis build status](https://travis-ci.org/gvdr/whereport.svg?branch=master)](https://travis-ci.org/gvdr/whereport)
[![Coverage status](https://codecov.io/gh/gvdr/whereport/branch/master/graph/badge.svg)](https://codecov.io/github/gvdr/whereport?branch=master)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://img.shields.io/badge/lifecycle-experimental-orange.svg)

# whereport

> Where is that airport?  

The goal of whereport is to provide a very light function to retrieve geographical information from airport's IATA codes.

whereport? thereport! An official candidate to be the package with the worst pun-in-title.

## Installation

You can install whereport from github with:


``` r
# install.packages("devtools")
devtools::install_github("gvdr/whereport")
```

## Example

`whereport` goes well with `ggmap`. You can do something like:

``` r
library(dplyr)
library(whereport)
library(ggmap)

where_iata(c("YVR","CHC")) %>%
  mutate_geocode(Location_served) %>%
  select(Airport_name, lon, lat)
```
and get a nice logitude langitude thingy ready for some spatial graphviz.

```r
#> Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=Christchurch,%20New%20Zealand&sensor=false
#> Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=Vancouver,%20British%20Columbia,%20Canada&sensor=false
#>                         Airport_name       lon       lat
#> 1 Christchurch International Airport  172.6362 -43.53205
#> 2    Vancouver International Airport -123.1207  49.28273
```

