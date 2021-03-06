% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mr_fun_general.R
\name{grappleRobustEst}
\alias{grappleRobustEst}
\title{Robust multivariate MR estimation}
\usage{
grappleRobustEst(
  data,
  p.thres = NULL,
  cor.mat = NULL,
  tau2 = NULL,
  loss.function = c("tukey", "huber", "l2"),
  k = switch(loss.function[1], l2 = NA, huber = 1.345, tukey = 4.685),
  niter = 20,
  tol = .Machine$double.eps^0.5,
  opt.method = "L-BFGS-B",
  diagnosis = T,
  plot.it = T
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

\item{p.thres}{The p-value threshold for SNP selection. The SNPs whose \code{selection_pvals} are less than \code{p.thres} are selected.
The default value is NULL, which is to include all SNPs in \code{data}. If it is not NULL, then \code{data} should have a column \code{selection_pvals}
that stores the selection p-value of each SNP.}

\item{cor.mat}{Either NULL or a \code{k + 1} by \code{k + 1} symmetric matrix. The shared correlation matrix for \code{(b_exp[j], b_out[j])} across SNP j. Used only when \code{input.list} is NULL and the default value is NULL, for the identity matrix.}

\item{tau2}{The dispersion parameter. The default value is NULL, which is to be estimated by the function}

\item{loss.function}{Loss function used, one of "tukey", "huber" or "l2". Default is "tukey", which is robust to outlier SNPs with large pleiotropic effects}

\item{k}{Tuning parameters of the loss function, for loss "l2", it is NA, for loss "huber", default is 1.345 and for loss "tukey", default is 4.685}

\item{niter}{Number of maximum iterations allowed for optimization. Default is 20}

\item{tol}{Tolerance for convergence, default is the square root of the smallest positive floating number depending on the machine R is running on}

\item{opt.method}{the optimization used, which is one of choices the R function \code{optim} accepts. Default value is "L-BFGS-B".}

\item{diagnosis}{Run diagnosis analysis based on the residuals or not, default is FALSE}

\item{plot.it}{Whether show the QQ-plot or not if diagnosis if performed. Default is TRUE.}
}
\value{
A list with elements
\item{beta.hat}{Point estimates of \code{beta}}
\item{tau2.hat}{Point estimates of the pleiotropic effect variance \code{tau2} if the argument \code{tau2} is set to NULL}
\item{beta.variance}{Estimated covariance matrix of \code{beta.hat}}
\item{tau2.se}{Estimated standard deviation of \code{tau2.hat}}
\item{beta.p.vaue}{A vector of p-values where the kth element is the p-value for whether \code{beta_k = 0}}
\item{std.resid}{Returned if \code{diagnosis} is TRUE. A vector of standardized residuals of each SNP}
}
\description{
The main function of GRAPPLE to estimate causal effects of risk factors \code{beta} under a random effect model of the pleiotropic effects.
}
