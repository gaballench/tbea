
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![R-CMD-check](https://github.com/gaballench/tbea/workflows/R-CMD-check/badge.svg)](https://github.com/gaballench/tbea/actions)
[![](https://www.r-pkg.org/badges/version/tbea)](https://cran.r-project.org/package=tbea)
[![](https://cranlogs.r-pkg.org/badges/tbea)](https://cran.r-project.org/package=tbea)
<!-- badges: end -->

# tbea

## Overview

An R package for pre- and post-processing in phylogenetic and
divergence-times Bayesian inference. Functions are provided for prior
specification in divergence time estimation using fossils as well as
other kinds of data. It provides tools for interacting with the input
and output of Bayesian platforms in evolutionary biology such as
‘BEAST2’, ‘MrBayes’, ‘RevBayes’, or ‘MCMCTree’. It Implements a simple
measure similarity between probability density functions for comparing
prior and posterior Bayesian densities, as well as code for calculating
the combination of distributions using conflation of Hill (2008).
Functions for estimating the origination time in collections of
distributions using the x-intercept (e.g., Draper and Smith, 1998) and
stratigraphic intervals (Marshall 2010) are also available.

Hill, T. 2008. “Conflations of probability distributions”. Transactions
of the American Mathematical Society, 363:3351-3372.
<doi:10.48550/arXiv.0808.1808>

Draper, N. R. and Smith, H. 1998. “Applied Regression Analysis”. 1–706.
Wiley Interscience, New York. <DOI:10.1002/9781118625590>,

Marshall, C. R. 2010. “Using confidence intervals to quantify the
uncertainty in the end-points of stratigraphic ranges”. Quantitative
Methods in Paleobiology, 291–316. <DOI:10.1017/S1089332600001911>.

## Installation

You can now install the stable version from CRAN, and the development
one using `remotes`:

``` r
install.packages("tbea")
remotes::install_github("gaballench/tbea")
```

## Authorship

This package was created and maintained by Gustavo A. Ballen
(@gaballench) and Sandra Reinales (@spreinalesl).

## Problems?

If you find a bug or unexpected behavior, please [file an
issue](https://github.com/gaballench/tbea/issues).
