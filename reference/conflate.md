# conflate: Calculate the conflation of multiple distributions pdfs, plot = TRUE, from, to, n, add = FALSE

conflate: Calculate the conflation of multiple distributions pdfs, plot
= TRUE, from, to, n, add = FALSE

## Usage

``` r
conflate(pdfs, plot = TRUE, from, to, n, add = FALSE)
```

## Arguments

- pdfs:

  A vector of calls to density_fun for defininf each individual
  distribution.

- plot:

  Whether to plot using curve

- from, to, n:

  The appropriate values from and to which to calculate the conflation,
  and a number of points n. These are the same used by the function
  curve but are still necessary even if no plot is required.

- add:

  Whether to add the curve to an existing plot.

## Value

A data frame with coordinates x-y for the conflated curve.

## Details

Produces either a plot or a data frame with the x and y values for the
conflated PDF. It uses as input a vector of densities constructed with
density_fun, and further parameters to be pased to curve if no plot is
desired these are still used for returning a data frame with the x and y
values from evaluation the conflated PDF on the sequence of x values
determined by a number n of equidistant points between from and to.

## Examples

``` r
# \donttest{
conflated_normals <- conflate(c("density_fun(x, 'dnorm', mean=0, sd=1)",
                                "density_fun(x, 'dnorm', mean=3, sd=1)"),
                              from=-4, to=4, n=101, plot=FALSE)
plot(conflated_normals)

# }
```
