# c_truncauchy: Estimate the c parameter for the truncated cauchy L distribution to be used in MCMCTree

c_truncauchy: Estimate the c parameter for the truncated cauchy L
distribution to be used in MCMCTree

## Usage

``` r
c_truncauchy(tl, tr, p = 0.1, pr = 0.975, al = 0.025, output = "par")
```

## Arguments

- tl:

  minimum age.

- tr:

  maximum age

- p:

  constant p involved in Cauchy parameters location and scale. Set to
  0.1 by default. It determines how close the mode of the distribution
  is to the tl min age.

- pr:

  percentile to the right of the distribution (0.975 by default)

- al:

  alpha to the right of the minimum on x. Set it to zero if a hard
  minimum is desired, otherwise the random variable can take values
  below t_L with probability al. Set to 0.025 by default.

- output:

  Whether to return just the parameters or all of the optimisation
  output. Defaults to "par". Leave it blank "" or with different text in
  order to return all of the optimisation output.

## Value

Either the parameter optimisation value as a numeric vector of length
one (when output="par") or the complete optimisation output as a list
(otherwise)

## Details

We solve for c while fixing p=0.1 so that the mode of the distribution
is closer to the t_L and then we calculate c so that t_R is at the
desired max age. note that ar and al are NOT complements, thus both can
be 0.025. Optimisation proceeds by fixing p in t_L(1-p) and then using
numerical optimisation to find c in c\*t_L.

## Author

Gustavo A. Ballen

## Examples

``` r
testValues.tr <- c(4.93, 12.12, 24.43, 49.20)
# the values below should be approx. c = 0.2, 0.5, 1, 2
# according to the paml documentation
for (i in testValues.tr) {
    print(c_truncauchy(tl=1, tr=i, p=0.1, pr=0.975, al=0.025))
}
#> [1] 0.1999785
#> [1] 0.4999731
#> [1] 0.9998983
#> [1] 2.00008
```
