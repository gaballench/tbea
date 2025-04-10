% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/conflate.R
\name{quantile_conflation}
\alias{quantile_conflation}
\title{quantile_conflation: Calculate the quantile for a given probabiliy under a conflated distribution}
\usage{
quantile_conflation(p, data, output = c("quantile", "optim"))
}
\arguments{
\item{p}{A float with the desired probability for which the quantile is to be calculated.}

\item{data}{A data frame which results from calling `conflate`.}

\item{output}{One of two values, either "quantile" or "optim". The former returns only the optimised quantile value, whereas
the latter returns the complete output from `optim`. Useful for checking whether optimisation converged.}
}
\value{
Either a vector of length one withe the quantile value, or a list as returned by optim.
}
\description{
quantile_conflation: Calculate the quantile for a given probabiliy under a conflated distribution
}
\examples{
\donttest{
conflated = density(rnorm(1000000, 0, 1))[c("x", "y")]
quantile_conflation(0.5, conflated, output = "quantile")
quantile_conflation(0.5, conflated, output = "opt")
quantile_conflation(0.025, conflated, "quan")
quantile_conflation(0.975, conflated, "q")
}

}
