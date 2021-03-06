% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mapcan.R
\name{mapcan}
\alias{mapcan}
\title{Canadian maps function}
\usage{
mapcan(boundaries, type, province = all, territories = TRUE)
}
\arguments{
\item{boundaries}{Unquoted expression specifying boundary divisions. Options are \code{province}, \code{census}, and \code{ridings}.}

\item{type}{Unquoted expression specifying type of map. Options are \code{standard} (for a standard geographic map),
\code{cartogram} (for a map that alters the geography of the map based on population size at the province or census
division level), and \code{bins} (for a binned map of federal electoral districts).}

\item{province}{An unquoted expression specifying province to plot. Acceptable input is French or English province
names, or two-letter provincial abbreviations. Default is to plot all provinces.}

\item{territories}{A logical value indicating whether or not to include territories in the the returned data frame,
default is \code{FALSE}}
}
\description{
A function that returns a data frame with map data, for use in ggplot.
}
\examples{
mapcan(boundaries = census, type = standard)

}
