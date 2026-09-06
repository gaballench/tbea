# Posterior samples for the family Cynodontidae

A data frame with posterior MCMC samples from a divergence time
estimation analysis of the family Cynodontidae using Beast2. From an
original sample of 20000, these include the last 1000 samples and only
preserve the columns with node ages.

## Usage

``` r
data(cynodontidae.posterior)
```

## Format

A data frame named cynodontidae.posterior with six columns:

- Sample:

  ID of the generation during sampling

- mrca.date.backward.Hydrolycus.:

  Node ages for the node Hydrolycus

- mrca.date.backward.Cynodontidae.:

  Node ages for the node Cynodontidae

- mrca.date.backward.Cynodon_Hydrolycus.:

  Node ages for the node Cynodon-Hydrolycus

- mrca.date.backward.H_scomberoides.:

  Node ages for the node H. scomberoides

- mrca.date.backward.Cynodon.:

  Node ages for the node Cynodon

## References

Ballen, G.A. and Reinales, S. 2025. tbea: tools for pre- and
post-processing in Bayesian evolutionary analyses. BioRxiv
https://www.biorxiv.org/content/10.1101/2024.06.18.599561.

Ballen, G.A., Moreno-Bernal, J.W. & Jaramillo, C. 2022. The fossil
record of Saber-Tooth Characins (Teleostei: Characiformes:
Cynodontinae), their phylogenetic relationships, and
paleobiogeographical implications. Journal of Systematic Palaeontology
19:24, 1679-1692, DOI: 10.1080/14772019.2022.2070717
