# density_fun: A way to represent distributions to be conflated

density_fun: A way to represent distributions to be conflated

## Usage

``` r
density_fun(x, dist, ...)
```

## Arguments

- x:

  a symbol which needs to be present in order to allow passing values
  towards the distruibution generator. It should be just x, without
  quotation marks (see examples).

- dist:

  A character (using single quotes!) with the name of the distribution
  to use.

- ...:

  Parameters to be passed on to dist. See examples

## Value

A call from the elements of the distribution to be used.

## Details

Produces a definition of each individual distribution to be conflated
and provides the symbol for non-standard evaluation (x). Single quotes
in dist are mandatory in order to avoid issues when calling expressions
under the hood. See the documentation for each individual distribution
to call their parameters adequately. Argument names and values should be
used.

## Examples

``` r
# \donttest{
c("density_fun(x, 'dnorm', mean=0, sd=1)",
  "density_fun(x, 'dnorm', mean=-1, sd=1)",
  "density_fun(x, 'dnorm', mean=1, sd=1)")
#> [1] "density_fun(x, 'dnorm', mean=0, sd=1)" 
#> [2] "density_fun(x, 'dnorm', mean=-1, sd=1)"
#> [3] "density_fun(x, 'dnorm', mean=1, sd=1)" 
# }
```
