# Function for estimation of probability density function parameters through quadratic optimization

Function for estimation of probability density function parameters
through quadratic optimization

## Usage

``` r
findParams(q, p, output = "complete", pdfunction, params, initVals = NULL)
```

## Arguments

- q:

  A numeric vector of observed quantiles, might come from a HPD from a
  previous study (along with a median), or from other sources of prior
  information. See Details.

- p:

  A numeric vector of percentiles.

- output:

  One of two possible values: `"complete"` and `"parameters"`. For the
  latter the complete output of the `optim` function is returned with
  information on convergence and squared errors (that might be useless
  for simple cases) or just the parameters.

- pdfunction:

  A character vector (of length one) with the name of the PDF function
  of interest. Technically this argument supports any PDF function of
  the form pDIST (e.g., `pnorm`, `ppois`, `pexp`).

- params:

  A character vector with the name of the parameter(s) to optimize in
  the probability density function. These should match the parameter
  names of the respective PDF function, e.g., `"lambda"` in the function
  `ppois`

- initVals:

  A numeric vector with default value `NULL`. It allows the user to
  provide initial values, althought this is discouraged in most cases.

## Value

Either a list with the complete output of convergence, squared errors
and parameter values, or just a vector of parameter values. Depends on
the value of `output`. Warnings may be triggered by the function `optim`
since the optimization is a heuristic process, whenever a given
iteration results in an invalid value for a given combination of
parameters, the `optim` function tries another combination of values but
inform the user about the problem through a warning. In general these
can be safely disregarded.

## Details

This function comes handy whenever we have some values of uncertainty,
(e.g., confidence intervals, HPDs, biostratigraphic age constrains) and
want to express it in the form of a probability density function of the
form \\P(x;\theta)\\. As we have some values (the quantiles) already and
their corresponding percentiles, all we need is a way to approximate the
parameters \\\theta\\ that produce the same combination of quantiles for
the given percentiles under a given PDF. This is carried out through
optimization of a quadratic error function. This is accomplished through
the function `optim`. For instance, if the estimated age of a fossil is
Lutetian, in the Eocene (41.2 to 47.8 Ma), and we want to model such
uncertainty through a normal distribution, we could assume that these
age boundaries are the quantiles for percentiles 0.025 and 0.975
respectively, and add a thir pair with the midpoint corresponding to the
percentile 0.5. This is all the information needed in order to estimate
the parameters `mean` and `sd` in the functiono `pnorm`.

## Author

Main code by Gustavo A. Ballen with important contributions in
expression call structure and vectorized design by Klaus Schliep
(<Klaus.Schliep@umb.edu>).

## Examples

``` r
# Find the best parameters for a standard normal density that fit the observed quantiles
# -1.644854, 0, and 1.644854, providing full output for the calculations in the form of
# a list
findParams(q = c(-1.959964, 0.000000, 1.959964),
           p = c(0.025, 0.50, 0.975),
           output = "complete",
           pdfunction = "pnorm",
           params = c("mean", "sd"))
#> Warning: initVals not provided, will use the mean of quantiles in q for _each_ of the parameters. Parameter estimates might not be reliable even though convergence is reported.
#> $par
#> [1] 0.0 0.1
#> 
#> $value
#> [1] 0.00125
#> 
#> $counts
#> function gradient 
#>       33       NA 
#> 
#> $convergence
#> [1] 0
#> 
#> $message
#> NULL
#> 

# Given that we have prior on the age of a fossil to be 1 - 10 Ma and that we want to
# model it with a lognormal distribution, fin the parameters of the PDF that best reflect
# the uncertainty in question (i.e., the parameters  for which the observed quantiles are
# 1, 5.5, and 10, assuming that we want the midpoint to reflect the mean of the PDF.
findParams(q = c(1, 5.5, 10),
           p = c(0.025,  0.50, 0.975),
           output = "complete",
           pdfunction = "plnorm",
           params = c("meanlog", "sdlog"))
#> Warning: initVals not provided, will use the mean of quantiles in q for _each_ of the parameters. Parameter estimates might not be reliable even though convergence is reported.
#> Warning: NaNs produced
#> Warning: NaNs produced
#> Warning: NaNs produced
#> Warning: NaNs produced
#> Warning: NaNs produced
#> Warning: NaNs produced
#> Warning: NaNs produced
#> Warning: NaNs produced
#> $par
#> [1] 1.704744 0.305104
#> 
#> $value
#> [1] 0.0006250003
#> 
#> $counts
#> function gradient 
#>      101       NA 
#> 
#> $convergence
#> [1] 0
#> 
#> $message
#> NULL
#> 
```
