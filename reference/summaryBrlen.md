# summaryBrlen: Summarise branch lengths on trees with identical topology

summaryBrlen: Summarise branch lengths on trees with identical topology

## Usage

``` r
summaryBrlen(mphy, method)
```

## Arguments

- mphy:

  An list of objects of class multiPhylo. If a single object in this
  argument is of class multiPhylo, it is first enclosed in a list.

- method:

  A character with the function name for the summary to be applied

## Value

A tree of class phylo with summary branch lengths in tree\$edge.length.

## Details

This function can be used on the output of topofreq from the \$trees
element in order to summarise the branch length on each topology set so
that we have a single tree summarising both topology and branch lengths.
Useful for depicting posterior tree density. Alternatively, it can be
used with a single element provided that it is first enclosed in a list

## Examples

``` r
# \donttest{
set.seed(1)
library(ape)
trl <- ape::rmtree(10, 4)
tpf <- topoFreq(unroot(trl), output="trees")
sumtrees <- summaryBrlen(tpf$trees, method = "median")
oldpar <- par(no.readonly = TRUE)
par(mfrow=c(1,3))
plot(sumtrees[[1]], type="unrooted", show.node.label=FALSE, cex=1.5)
plot(sumtrees[[2]], type="unrooted", show.node.label=FALSE, cex=1.5)
plot(sumtrees[[3]], type="unrooted", show.node.label=FALSE, cex=1.5)

par(oldpar)
# }
```
