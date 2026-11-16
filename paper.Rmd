---
# Example from https://joss.readthedocs.io/en/latest/submitting.html
title: 'tsspiral: An R Package to Create Circular Version of Time Series Plots'
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

 `tsspiral` is an open-source R software for visualising time series on a polar coordinate. We introduce a circular representation of time series data, which we define as a spiral.  `tsspiral` provides a collection of `ggplot2` geometries for creating spiral representation of time series data. In our approach observations are aaranged around a circles to highlight periodicity, seasonality, and recurring temporal patterns. Furthermore, each year is represented using a circle with the anugular position corresponding to the day of the year and successive years represented by concentric rings. By bringing polar-coordinate-based visualisation into routine time series analysis, `tsspiral` offers a practical tool for exploring temporal patterns and communicating complex time-dependent structures.



# Statement of need

Time series visualization is an essential step in time series analysis, forecasting, imputation, anomaly dection etc. Time series data are commonly visualised using Cartesian coordinate plane, where time is represented along the horizontal axis ($x$) and observed values along the verticle axis ($y$). Although conventional time series plots are effective for identifying important temporal features, such as trends, seasonal patterns, sudden shifts and irregular fluctuations, identifying these features can become challenging when dealing with long time series, particularly daily observations spanning several years or decades. As the length of the series increases, the visual representation becomes increasingly dense, making it difficult to recognise recurring patterns, compare corresponding periods across years and identify changes in seasonal behaviour. 


Circular representation of time series provide an alternative visualisation in which time series is mapped to angular position and successive years are arranged as concentric rings. This representation facilitates the visual comparison of corresponding time periods across years, making recurrent patterns, unusual events, temporal changes, and data missing gaps easier to explore. Furthermore, with conventional time series plots it is very difficult to nested temporal structures, compare seasonal patterns across different levels of the temporal hierachcy.  Spiral version of time series plot are useful in addressing these limitations. In addition, visualizing categorical time series data can be challenging using traditional time series plots.

The spiral plots supports visualizing long time series  and better  identification of periodic structures in the data [@weber2001visualizing; @rakuschek2026guided].  As John W. Tukey emphasised, “Exploratory data analysis is an attitude, a state of flexibility, a willingness to look for those things that we believe are not there, as well as those we believe to be there.”[@tukey1977exploratory] Guided by this philosophy, exploring alternative visualisations of time series data encourages us to move beyond familiar representations and discover patterns that might otherwise remain hidden. Spiral layout has two major advantages for visualising time series data: i)  able to visualize data with long axes, which greatly improves the resolution of visualization and space; ii) efficient for time series data to reveal
periodic patterns [@spiralize].




 Since most statistical software packages readily support line plots, their convenience and widespread availability have made line plots the conventional choice for visualising time series. As a result, other forms of visualisation have received comparatively less attention, despite their potential to reveal recurring and circular patterns in time series data.  Furthermore, creating spiral time series plot often requires custom codes and careful handing of time series data. 
`tsspiral` fills this gaps.

# State of the field

@carlis1998interactive is one of the early contribution which introduce arrange data in a spiral. The authors mentioned spirals  provides
the user with easy visual cues to both serial and periodic
aspects of the data. @weber2001visualizing proposes spiral graphs for visualising large time-series datasets and identifying periodic structures. It also discusses visualising nominal and quantitative data. The R package `spiralize`[@spiralize] provides tools for visualising time series data using spiral layouts. Our package introduces a new set of geoms that integrate with ggplot2, extending the grammar of graphics to spiral-based visualisation. This integration allows users to construct spiral plots using a familiar and flexible syntax while retaining the layered approach to data visualisation that makes ggplot2 powerful. Rather than treating spiral plots as standalone graphics, our approach brings them into the grammar of graphics framework, enabling users to explore temporal patterns through a broader range of visual encodings. 





# Software design

The central idea of `tsspiral` is to transform a linear time series into a sequence of annual circular representations. Let \(t\) denote a date and \(y_t\) its associated observation. The number of days in year $X$ is


Each annual ring is divided into \(D_Y\) equal angular segments, where \(D_Y\) represents the number of days in calendar year \(Y\). Thus, a common year is divided into 365 segments, whereas a leap year is divided into 366 segments. Each segment corresponds to one calendar day.

Let \(d_t\) denote the day of the year corresponding to date \(t\), and let \(Y(t)\) denote its calendar year. The angular coordinate of observation \(t\) is defined as

$$
\theta_t =
\frac{\pi}{2}-
\frac{2\pi(d_t-1)}{D_{Y(t)}}.
$$

This definition places January 1 at the top of each annual ring, with subsequent days progressing clockwise. The angular width of each segment is therefore

$$
\Delta\theta_Y = \frac{2\pi}{D_Y}.
$$

Consequently, each annual ring completes exactly one full revolution, while preserving the calendar structure of common and leap years.


$$
D_X =
\begin{cases}
366, & \text{if }X\text{ is a leap year},\\
365, & \text{otherwise}.
\end{cases}
$$


We devided each ring corresponds to each year into $D_X$ number of splits. The angular coordinate is defined as
$$
\theta_t =
\frac{\pi}{2}-
\frac{2\pi(d_t-1)}{D_{Y(t)}}.
$$

This convention places January 1 at the top of the circle and advances clockwise throughout the year. Consequently, each annual ring completes exactly one revolution, with the angular resolution determined by the actual length of that calendar year.

The radial coordinate identifies the year and can be expressed as
\[
r_t = r_0 + k\Delta r,
\]
<!--Each circle is split in to 365. For a leap year circle is divided in to ,,segments. When visualising quarterly data all dates corresponds to that is colour. -->


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
