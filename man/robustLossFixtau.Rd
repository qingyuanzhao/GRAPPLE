% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/showModes.R
\name{robustLossFixtau}
\alias{robustLossFixtau}
\title{Calculate the robustified profile likelihood function}
\usage{
robustLossFixtau(
  data = NULL,
  b_exp = NULL,
  b_out = NULL,
  se_exp = NULL,
  se_out = NULL,
  cor.mat = NULL,
  loss.function = c("tukey", "huber", "l2"),
  k.findmodes = switch(loss.function[1], l2 = NA, huber = 1.345, tukey = 3)
)
}
\arguments{
\item{data}{A data frame containing the information of the selected genetic instruments.
One can simply take the \code{data} element from the output of function \code{getInput}, or provide their own data frame.
The required columns include \code{SNP} for the SNP rsID, the columns \code{gamma_exp1} to \code{gamma_expk} for the
estimated effect sizes of the SNPs on risk factors \code{1} to \code{k}, the columns \code{se_exp1} to \code{se_expk} for their
standard deviations, the columns \code{gamma_out1} to \code{gamma_outm} for the
estimated effect sizes of the SNPs on diseases \code{1} to \code{m},the columns \code{se_out1} to \code{se_outm} for their
standard deviations.}

\item{cor.mat}{Either NULL or a \code{k + 1} by \code{k + 1} symmetric matrix. The shared correlation matrix for \code{(b_exp[j], b_out[j])} across SNP j. Used only when \code{input.list} is NULL and the default value is NULL, for the identity matrix.}

\item{loss.function}{Loss function used, one of "tukey", "huber" or "l2". Default is "tukey", which is robust to outlier SNPs with large pleiotropic effects}

\item{k.findmodes}{Tuning parameters of the loss function, for loss "l2", it is NA, for loss "huber", default is 1.345 and for loss "tukey", default is 3.}
}
\value{
The robustified profile likelihood function
}
\description{
Calculate the robustified profile likelihood function
}
