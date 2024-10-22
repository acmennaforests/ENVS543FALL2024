# function that takes data from Rice Rivers Center data from January 2014-end of March 2014
# this function converts Imperial units into Standard units
# also adds Date, month and weekday according to the DateTime string in column 1
# returns the whole table

get_rice_data <- function() {
  library(tidyverse)
  library(lubridate)
  library(dplyr)

  url <- "https://docs.google.com/spreadsheets/d/1Mk1YGH9LqjF7drJE-td1G_JkdADOU0eMlrP01WFBT8s/pub?gid=0&single=true&output=csv"

  rice <- read_csv(url)

  rice |>
  
      mutate(AirTempC = ((AirTempF-32)* 5/9),
          Depth_m = Depth_ft*0.3048,
          Rain_cm = Rain_in*2.54,
          WindSpeed_mps = WindSpeed_mph*0.447,
          Date = mdy_hms(DateTime, tz = "EST"), 
          Month = month(Date, 
                       label = TRUE,
                       abbr = FALSE), 
          Weekday = wday(Date,
                        label = TRUE, 
                        abbr = FALSE )) ->rice
  
  rice |>
      select(-DateTime, -WindSpeed_mph, -AirTempF, -Rain_in, -Depth_ft) 
  rice |>
    
      select(Date, Month, Weekday, AirTempC, Depth_m, Rain_cm, WindSpeed_mps, everything())
    
  return(rice)}

get_rice_data()











