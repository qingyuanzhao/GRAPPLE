% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/QQplot.R
\name{qqDiagnosis}
\alias{qqDiagnosis}
\title{QQ-plot diagnosis and outlier detection from standardized residuals}
\usage{
qqDiagnosis(
  std.residuals,
  outlier.quantile = 0.1/length(std.residuals),
  plot.it = T
)
}
\arguments{
\item{std.residuals}{A vector of standardized residuals, can be the output element \code{std.resid} from function \code{grappleRobustEst}}

\item{outlier.quantile}{The quantile threshold for outliers.}

\item{plot.it}{Whether show the QQ-plot or not if diagnosis if performed. Default is TRUE.}
}
\value{
A list with two elements
\item{p}{The QQ plot}
\item{outliers}{The data frame for the detected outliers}
}
\description{
QQ-plot diagnosis and outlier detection from standardized residuals
}
