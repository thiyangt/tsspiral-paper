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
journal: JOSS
---

# Summary

Time series data commonly display seasonal over time. Circular visualisation provides a natural way to represent these recurring patterns. Since most statistical software packages readily support line plots, their convenience and widespread availability have made line plots the conventional choice for visualising time series. As a result, other forms of visualisation have received comparatively less attention, despite their potential to reveal recurring and circular patterns in time series data. tsspiral is an open-source R software for visualising time series on a polar coordinate.  

By bringing polar-coordinate-based visualisation into routine time series analysis, tsspiral offers a practical tool for exploring temporal patterns and communicating complex time-dependent structures.

# Statement of need

tsspiral beridges these gaps. 
With conventional time series plots it is very difficult to nested temporal structures, compare seasonal patterns across different time scales, identify missing values,particularly in long time series specially when you have daily data. Furthermore, when data comes as categorical variables we can not use traditional time series plots to visualise data. missing values, this is very difficult with the traditional time series plot.
In addition, identifying missing values and representing the dates associated with them can be challenging using traditional time series plots.
Spiral version of time series plot are useful in addressing these limitations. The spiral plots supports visualizing long time series  and better  identification of periodic structures in the data [@weber2001visualizing; @rakuschek2026guided].  As John W. Tukey emphasised, “Exploratory data analysis is an attitude, a state of flexibility, a willingness to look for those things that we believe are not there, as well as those we believe to be there.”[@tukey1977exploratory] Guided by this philosophy, exploring alternative visualisations of time series data encourages us to move beyond familiar representations and discover patterns that might otherwise remain hidden. 
Creating spiral time series plot often requires custom codes and careful handing of time series data. 

Here are two motivation example. \@ref(fig:p1) shows the tie series plot of  daily tourist arrivals to Sri Lanka from 2023 January 1 to 2025 December 31. This time series plot helps us to understand the overall behaviour of the data across the full time span. We can see a clear upward trend and a seasonal behavior in the data. But through the time series plot, it is difficult to answer the following questions

1. When is Sri Lanka busiest?

2. When is it quiet?

3. Are there predictable peaks and troughs throughout the year?

4. Which months or seasons attract more visitors?

5. Do certain days or periods consistently rank among the busiest?

6. Are there recurring days with lower arrivals that could be used for maintenance, conservation, or quiet operations?

7. How do recurring seasonal patterns differ across years—for example, between January 2023, January 2024, and January 2025?












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
