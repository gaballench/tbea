# Reduced chi-square test or mean square weighted deviation (mswd) test

Reduced chi-square test or mean square weighted deviation (mswd) test

## Usage

``` r
mswd.test(age, sd)
```

## Arguments

- age:

  A vector of age radiometric age estimates

- sd:

  A vector of the standard deviation corresponding to each element in
  `age`

## Value

A numeric vector of length one with the p-value corresponding to the
test.

## Details

From Ludwig (2003:646): "By convention, probabilities of fit greater
than 0.05 are generally considered as arguably satisfying the
mathematical assumptions of an isochron, while lower probabilities are
generally taken as indicating the presence of “geological” scatter, and
hence a significant possibility of bias in the isochron age.". The null
hypothesis is that the isochron conditions hold.

## Examples

``` r
data(laventa)
# Do the age estimates for the boundaries of the Honda Group (i.e., samples at meters 56.4
# and 675.0) conform to the isochron hypothesis?
hondaIndex <- which(laventa$elevation == 56.4 | laventa$elevation == 675.0) 
mswd.test(age = laventa$age[hondaIndex], sd = laventa$one_sigma[hondaIndex])
#> [1] 3.697832e-11
# The p-value is smaller than the nominal alpha of 0.05, so we can reject the null
# hypothesis of isochron conditions

# Do the age estimates for the samples JG-R 88-2 and JG-R 89-2 conform to the isochron hypothesis?
twoLevelsIndex <- which(laventa$sample == "JG-R 89-2" | laventa$sample == "JG-R 88-2")
dataset <- laventa[twoLevelsIndex, ]
# Remove the values 21 and 23 because of their abnormally large standard deviations
mswd.test(age = dataset$age[c(-21, -23)], sd = dataset$one_sigma[c(-21, -23)])
#> [1] 0.993701
# The p-value is larger than the nominal alpha of 0.05, so we can
# not reject the null hypothesis of isochron conditions
```
