




Here are two motivation example. \@ref(fig:p1) shows the tie series plot of  daily tourist arrivals to Sri Lanka from 2023 January 1 to 2025 December 31. This time series plot helps us to understand the overall behaviour of the data across the full time span. We can see a clear upward trend and a seasonal behavior in the data. But through the time series plot, it is difficult to answer the following questions

1. When is Sri Lanka busiest?
  
  2. When is it quiet?
  
  3. Are there predictable peaks and troughs throughout the year?
  
  4. Which months or seasons attract more visitors?
  
  5. Do certain days or periods consistently rank among the busiest?
  
  6. Are there recurring days with lower arrivals that could be used for maintenance, conservation, or quiet operations?
  
  7. How do recurring seasonal patterns differ across years—for example, between January 2023, January 2024, and January 2025?
  
  ```{r p1, warning=FALSE, message=FALSE, eval=FALSE, echo=FALSE}


ped_hourly <- read_csv("data/ped_hourly.csv")
p2 <- ggplot(ped_hourly, aes(x=DateHour,
                             y=HourlyCount)) + geom_line()
library(patchwork)
p1/p2
```

![Figure 1: Examples of time-series data motivating the development of the package: (a) daily tourist arrivals to Sri Lanka from 2023–2025, illustrating long-term trends and recurring temporal patterns; and (b) hourly pedestrian counts at Melbourne Central during April 2026, illustrating complex within-day and within-week temporal patterns.](figures/image1.png){width=\linewidth}

To obtain a broader picture of the patterns in the two situations described above, we can make the plots interactive, allowing users to zoom in and explore specific regions of the data. However, interactive visualisations are not always appropriate. In particular, journal publications and printed reports often require static figures that communicate the main findings clearly without requiring user interaction. Therefore, we need to consider alternative visualisation techniques that can present the same data effectively in a static format while still allowing us to capture both the overall pattern and important local features of the data.

```{r, fig.height=3, fig.width=3, eval=FALSE, echo=FALSE}
library(patchwork)

p3 <- ggplot(
  ts,
  aes(
    x = Date,
    y = Value,
    fill = Value
  )
) +
  geom_tsspiralbar(
    ring_spacing = 2
  ) +
  scale_fill_viridis_c(
    option = "inferno",
    direction = -1,
    guide = guide_colorbar(reverse = FALSE)
  ) +
  theme_void()
(p2|p3)
```



```{r, eval=FALSE, echo=FALSE}
library(patchwork)
library(ggplot2)
library(scales)

common_limits <- range(ts$Value, na.rm = TRUE)
common_breaks <- common_limits

common_scale <- scale_fill_viridis_c(
  option = "C",
  limits = common_limits,
  breaks = common_breaks,
  labels = label_number(),
  na.value = "grey90",
  name = "Value"
)

p23 <- temporal_hierarchical(
  ts |> dplyr::filter(lubridate::year(Date) == 2023),
  date = Date,
  value = Value
) +
  common_scale +
  theme(legend.position = "bottom")

p24 <- temporal_hierarchical(
  ts |> dplyr::filter(lubridate::year(Date) == 2024),
  date = Date,
  value = Value
) +
  common_scale +
  theme(legend.position = "bottom")

p25 <- temporal_hierarchical(
  ts |> dplyr::filter(lubridate::year(Date) == 2025),
  date = Date,
  value = Value
) +
  common_scale +
  theme(legend.position = "bottom")

p23 <- p23 + ggtitle("2023")
p24 <- p24 + ggtitle("2024")
p25 <- p25 + ggtitle("2025")

(p23 | p24 | p25) +
  plot_layout(guides = "collect") &
  theme(
    legend.position = "bottom",
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 14
    )
  )
```



```{r, eval=FALSE}
library(tsspiral)
calendar_hourly_polar(
  ped_hourly,
  DateHour,
  HourlyCount,
  month = "2026-04-01"
)
```


#####

