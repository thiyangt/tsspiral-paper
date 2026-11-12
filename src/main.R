#### --- pkgs ----
library(readr)
pak::pak("thiyangt/tsspiral")
library(tsspiral)
library(viridis)
library(ggplot2)
library(tsibble)
library(tidyverse)
library(patchwork)

#### ---- tour ---- 
data(tourism.srilanka)
ts <- tourism.srilanka |>
  mutate(Date = dmy(Date)) |>        
  as_tsibble(index = Date)
p1 <- ggplot(ts, aes(x=Date, y=Value)) + geom_line()

ped_hourly <- read_csv("data/ped_hourly.csv")
p2 <- ggplot(ped_hourly, aes(x=DateHour,
                             y=HourlyCount)) + geom_line()
library(patchwork)
p1/p2

#### ---- ####
s1 <- ggplot(
  ts,
  aes(
    x = Date,
    y = Value,
    fill = Value
  )
) +
  geom_tsspiral(
    ring_spacing = 2
  ) +
  scale_fill_viridis_c(
    option = "inferno",
    direction = -1,
    guide = guide_colorbar(reverse = FALSE)
  ) +
  theme_void()
