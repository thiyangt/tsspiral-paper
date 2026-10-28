---
# Example from https://joss.readthedocs.io/en/latest/submitting.html
title: 'tsspiral: An R Package to Create Spiral Version of Time Series Plots'
tags:
  - missing values
  - forecasting
  - daily series
  - visulisation
  - Seasonal patterns
authors:
  - name: Thiyanga S. Talagala
    orcid: 0000-0002-0656-9789
    affiliation: "1" 
affiliations:
 - name: Department of Statistics, Faulty of Applied Sciences, University of Sri Jayewardenepura, Sri Lanka 
   index: 1
citation_author: Talagala, Thiyanga. S. (2026).
date: 19 October 2026
year: 2026
bibliography: paper.bib
output: rticles::joss_article
csl: apa.csl

---

# Summary

Time series data commonly display seasonal over time. Circular visualisation provides a natural way to represent these recurring patterns. Since most statistical software packages readily support line plots, their convenience and widespread availability have made line plots the conventional choice for visualising time series. As a result, other forms of visualisation have received comparatively less attention, despite their potential to reveal recurring and circular patterns in time series data. tsspiral is an open-source R software for visualising time series on a polar coordinate.  

By bringing polar-coordinate-based visualisation into routine time series analysis, tsspiral offers a practical tool for exploring temporal patterns and communicating complex time-dependent structures.

# Statement of need

tsspiral beridges these gaps. It aims to overcomes previous limitations, while adding support for

With conventional time series plots it is very difficult to nested temporal structures, compare seasonal patterns across different time scales, identify missing values,particularly in long time series specially when you have daily data.
Spiral vrsion of time series plot are useful in addressing these limitations. The spiral plots supports visualizing long time series  and better  identification of periodic structures in the data [@weber2001visualizing; @rakuschek2026guided].  As John W. Tukey emphasised, “Exploratory data analysis is an attitude, a state of flexibility, a willingness to look for those things that we believe are not there, as well as those we believe to be there.”[@@tukey1977exploratory] Guided by this philosophy, exploring alternative visualisations of time series data encourages us to move beyond familiar representations and discover patterns that might otherwise remain hidden. 
Creating spiral time series plot often reqires custom codes and careful handing of time series data. Furthermore, when data comes as categorical variables we can not use traditional time series plots to visualise data.

Here is an motivation example. The following graph shows the tie series plot of  daily tourist arrivals to Sri Lanka. 


``` r
library(tsspiral)
library(viridis)
library(ggplot2)
library(tsibble)
library(tidyverse)
data(tourism.srilanka)
ts <- tourism.srilanka |>
  mutate(Date = dmy(Date)) |>        
  as_tsibble(index = Date)
ggplot(ts, aes(x=Date, y=Value)) + geom_line()
```


``` r
library(patchwork)
p1 <- ggplot(
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
```


``` r
git_colours <- rev(c(
  "#d73027",
  "#f46d43",
  "#fdae61",
  "#ffffbf",
  "#74add1",
  "#4575b4"
))

p2 <- ts |>
  dplyr::mutate(
    Value_group = cut(
      Value,
      breaks = c(-Inf, 999, 2500, 5000, 7500, 10000, Inf),
      labels = c(
        "<1000",
        "1000–2500",
        "2501–5000",
        "5001–7500",
        "7501–10000",
        ">10000"
      ),
      right = TRUE
    )
  ) |>
  ggplot(
    aes(
      x = Date,
      y = Value,
      fill = Value_group
    )
  ) +
  geom_tsspiral(
    ring_spacing = 2
  ) +
  scale_fill_manual(
    values = git_colours,
    drop = FALSE
  ) +
  theme_void()

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
(p1|p2)
```


``` r
p3
```


``` r
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


# State of the field

"Spiral layout has two major advantages for data visualization. First, it is able to visualize data with long
axes, which greatly improves the resolution of visualization. Second, it is efficient for time series data to reveal
periodic patterns"

The R package `spiralize`[@spiralize] provides tools for visualising time series data using spiral layouts. Building on this idea, our package introduces a new set of geoms that integrate with ggplot2, extending the grammar of graphics to spiral-based visualisation. This integration allows users to construct spiral plots using a familiar and flexible syntax while retaining the layered approach to data visualisation that makes ggplot2 powerful. Rather than treating spiral plots as standalone graphics, our approach brings them into the grammar of graphics framework, enabling users to explore temporal patterns through a broader range of visual encodings. The R package `spiralize` provides tools for visualising data using spiral layouts. In our approach, we introduce a circular representation of time series data, which we define as a spiral: our approach represents time series data using circular layouts, arranging observations around circles to highlight periodicity, seasonality, and recurring temporal patterns. 

What has been missing is a reusable tool for creating spiral visualisations of time series data that supports the exploration of temporal patterns across multiple time scales. Compared with conventional time series plotting tools, `tsspiral` adds:

- Spiral visualisations of time series using polar coordinates.
- Alternative representations of temporal patterns, making recurring cycles and seasonal variations easier to explore.
- A framework for visualising temporal hierarchies, from annual and quarterly patterns to monthly, weekly, and daily observations.
- New 
- An open-source implementation in R that supports reproducible visualisation workflows.
- A flexible approach that can be incorporated into statistical analysis, research communication, and teaching.

@rakuschek2026guided pointed out circular version of time series plots has both advantage and disadvantages. Hence @rakuschek2026guided suggested to use both line and circular version of the plots to get a better idea of the data rather than using circular plots as a replacement to line plots. 


# Software design

Each circle is split in to 365. For a leap year circle is divided in to ,,segments. When visualising quarterly data all dates corresponds to that is colour. 

`tsspiral` introduces a new set of `ggplot2` geoms that integrate seamlessly with the `ggplot2` grammar of graphics to create spiral time series plots. This design allows users to generate spiral visualisations within familiar R plotting workflows while retaining the flexibility and composability of `ggplot2`.



# Research impact statement

tsspiral expands the ways researchers can explore time series through a circular shape. By representing time series on a 
polar coordinates, the package provides alternative way to explore temporal patterns, recurring cycles and changes over time. furthermore,
this allows to visualise temporal-hierarchcical time series. By aggregating time series under different temporal scales from years to quarters, months, weeks, and days, spiral visualisations can 
reveal recurring seasonal patterns and relationships between different temporal scales. This allows researchers to explore patterns in the time series
within and across years, quarters, months, or other time intervals. 

# AI usage disclosure

ChatGPt
was used to assist with code development and documentation roxygen files writing.

# References
