# stratCI: Estimate the confidence intervals of endpoints in stratigraphic intervals

stratCI: Estimate the confidence intervals of endpoints in stratigraphic
intervals

## Usage

``` r
stratCI(times, method, nparams, C, endpoint, confidence, quantile)
```

## Arguments

- times:

  a vector of occurrences in time for which we want to estimate the
  endpoints of the stratigraphic interval

- method:

  a character describing which method to use, either 'Strauss-Sadler89'
  or 'Marshall94'.

- nparams:

  A character indicating whether to estimate one or two parameters,
  possible values are 'one.par' and 'two.par'.

- C:

  numeric indicating the confidence level, e.g. 0.95

- endpoint:

  used only for nparams = 'one.par'. Possible values are 'first' and
  'last'.

- confidence:

  the confidence interval level, usually 0.95.

- quantile:

  the desired confidence level for a quantile representing the brackets
  around the confidence interval.

## Value

A named vector when using the 'Strauss-Sadler89' method, or an unnamed
vector when using the 'Marshall94' method.

## Details

For method='Strauss-Sadler89' we need to provide \`nparams\`, \`C\`, and
\`endpoint\`. For method='Marshall94' we need to provide \`confidence\`
and \`quantile\`.

## Author

Gustavo A. Ballen.

## Examples

``` r
data(andes)
andes <- andes$ages
# remove missing data
andes <- andes[complete.cases(andes)]
# remove outliers
andes <- sort(andes[which(andes < 10)])
stratCI(andes, method="Strauss-Sadler89",
        nparams="one.par", C=0.95, endpoint="first")
#>     minObs     maxObs     maxEst          H     alphaR      alpha 
#>  0.2749000  6.9500000  7.4435055 43.0000000  0.4935055  0.0739323 
stratCI(andes, method="Strauss-Sadler89",
        nparams="one.par", C=0.95, endpoint="last")
#>     minEst     minObs     maxObs          H     alphaR      alpha 
#> -0.2186055  0.2749000  6.9500000 43.0000000  0.4935055  0.0739323 
stratCI(andes, method="Strauss-Sadler89",
        nparams="two.par", C=0.95)
#>     minEst     minObs     maxObs     maxEst          H     alphaR      alpha 
#> -0.3325341  0.2749000  6.9500000  7.5574341 43.0000000  0.6074341  0.0910000 
stratCI(andes, method="Marshall94", confidence = 0.95,
        quantile = 0.8)
#> [1] 7.0701 7.2147
stratCI(andes, method="Marshall94", confidence = 0.95,
        quantile = 0.95)
#> Warning: Impossible to calculate upper bound
#> [1] 7.14   NA
```
