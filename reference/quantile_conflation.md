# quantile_conflation: Calculate the quantile for a given probabiliy under a conflated distribution

quantile_conflation: Calculate the quantile for a given probabiliy under
a conflated distribution

## Usage

``` r
quantile_conflation(p, data, output = c("quantile", "optim"))
```

## Arguments

- p:

  A float with the desired probability for which the quantile is to be
  calculated.

- data:

  A data frame which results from calling \`conflate\`.

- output:

  One of two values, either "quantile" or "optim". The former returns
  only the optimised quantile value, whereas the latter returns the
  complete output from \`optim\`. Useful for checking whether
  optimisation converged.

## Value

Either a vector of length one withe the quantile value, or a list as
returned by optim.

## Examples

``` r
# \donttest{
conflated = density(rnorm(1000000, 0, 1))[c("x", "y")]
quantile_conflation(0.5, conflated, output = "quantile")
#> [1] -3.993084e-05
quantile_conflation(0.5, conflated, output = "opt")
#> $par
#> [1] -3.993084e-05
#> 
#> $value
#> [1] 4.166721e-19
#> 
#> $counts
#> function gradient 
#>       NA       NA 
#> 
#> $convergence
#> [1] 0
#> 
#> $message
#> NULL
#> 
quantile_conflation(0.025, conflated, "quan")
#> [1] -1.962487
quantile_conflation(0.975, conflated, "q")
#> [1] 1.964132
# }
```
