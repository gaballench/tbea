# Frequency of topologies in a tree sample

Frequency of topologies in a tree sample

## Usage

``` r
topoFreq(mphy = NULL, output = "index", maxtrees = 10000, dist.matrix = NULL)
```

## Arguments

- mphy:

  An object of class multiPhylo

- output:

  A character indicating whether the tree indices or the actual trees
  should be returned. Defaults to "index"

- maxtrees:

  A numeric indicating whether to warn about having more trees than the
  arbitrary threshold

- dist.matrix:

  A numeric matrix with the pairwise distances between topologies.

## Value

A list with an element containing the the different tree clusters (as
multiPhylo) and the absolute, cumulative, and relative frequencies of
each topology in the tree sample.

## Details

This function can be used e.w. with a posterior sample of trees from a
Bayesian analysis where we want to explore the distribution of
topologies in the posterior of trees. This way we can assess topological
uncertainty in a more meaningful way than using a majority-rule
consensus.

The use of \`maxtrees\` is actually a convenience for keeping in mind
that large amounts of trees can cause memory issues. This can end up in
situations which are difficult to debug but that from personal
experience have come from exactly that: More trees than memory can fit
or which can be processed for calculating similarity. This number will
\_not\_ break the function call but will return a warning. Try to avoid
modifying its default value unless you are sure it will not cause any
issues under your computing conditions (e.g. when lots of trees are
being processed but also large RAM is available).

The argument \`dist.matrix\` allows the user to precalculate any desired
topological distance and therefore frees one from the restriction to use
only the Robinson-Fould distance. This means that topological pairwise
distances between either phylogenetic trees \_or\_ networks can be used
as input.

## Examples

``` r
# tests
set.seed(1)
library(ape)
trl <- ape::rmtree(10, 4)
tpf <- topoFreq(ape::unroot(trl), output="trees")
```
