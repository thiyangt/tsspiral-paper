# https://www.pedestrian.melbourne.vic.gov.au
library(readr)
pedestrian_Melbourne_Central_hourly <- read_csv("data/pedestrian-Melbourne_Central-hourly.csv")
View(pedestrian_Melbourne_Central_hourly)

library(dplyr)
library(lubridate)
library(tidyverse)
library(here)
ped_hourly <- pedestrian_Melbourne_Central_hourly %>%
  mutate(
    DateHour = as.POSIXct(SensingDate) + hours(HourofDay)
  )
write_csv(ped_hourly,
     file = here("data", "ped_hourly.csv"))
