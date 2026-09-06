# concatNexus: Function for concatenation of nexus matrices both morphological and molecular

concatNexus: Function for concatenation of nexus matrices both
morphological and molecular

## Usage

``` r
concatNexus(
  matrices = NULL,
  pattern,
  path,
  filename,
  morpho = FALSE,
  morphoFilename = NULL,
  sumFilename
)
```

## Arguments

- matrices:

  A vector of type 'character' with paths to the nexus alignments or
  their file names. If `morphoFilename` is non-null, either the path to
  the morphological partition or its file name must be included too. The
  default is NULL and it must be defined if none of `pattern` and `path`
  are included.

- pattern:

  A vector of type 'character' and length one containing the text
  pattern to identify the alignments of interest. It would be tipically
  be some suffix and/or file extension (see examples).

- path:

  A vector of type 'character' and length one pointing to the directory
  where the matrices are located. It is used in combination with
  `pattern` in order to build a path to each matrix file (see examples).

- filename:

  A vector of type 'character' and length one with the file name (or
  path and file name) for the concatenated output matrix.

- morpho:

  A vector of type 'logical' and length one indicating whether a
  morphological matrix is included in the concatenation.

- morphoFilename:

  A vector of type 'character' and length one with the file name or path
  to the morphological nexus matrix. Needed if `morpho = TRUE`.

- sumFilename:

  A vector of type 'character' and length one with the file name or path
  to the summary information of partition start and end positions.
  Useful for specifying concatenated analyses in MrBayes where each
  partition in the matrix might have its own substitution model.

## Value

This function writes to the disk two files, one with the concatenated
matrix and one with the summary information on partition positions in
the complete matrix.

## Details

This function will concatenate matrices in nexus format (mandatory) and
write to the disk the output and summary information on the partitions.
It requires that the input matrices all share the same taxa in the same
positions.

## Author

Gustavo A. Ballen

## Examples

``` r
# Concatenate all the matrices in a given path,
# ending with the pattern 'aligned.nex', including a morphological matrix
# also defined with a pattern
if (FALSE) { # \dontrun{
path <- "sequences"
pattern <- "aligned.nex$"

concatNexus(matrices = NULL, pattern = pattern,
            filename = paste(path, "concatenatedMolmorph.nexus", sep = "/"),
            path = path, 
            morpho = TRUE,
            morphoFilename = paste(path, grep(pattern = "morfologia",
                                              x = dir(path, pattern), value = TRUE),
                                   sep = "/"),
            sumFilename = "partitions.txt")
} # }
# Concatenate arbitrary matrices in the working directory,
# including a morphological matrix, return a concatenated file in the same dir
if (FALSE) { # \dontrun{
concatNexus(matrices = c("coi.nex", "rag1.nex", "cytb.nex", "morphology.nex"),
            filename = "concatenatedMolmorph.nexus", 
            morpho = TRUE,
            morphoFilename = "morphology.nex",
            sumFilename = "partitions.txt")
} # }
```
