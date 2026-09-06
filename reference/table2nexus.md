# table2nexus: Read a data matrix in delimited format and convert into a data matrix in nexus format

table2nexus: Read a data matrix in delimited format and convert into a
data matrix in nexus format

## Usage

``` r
table2nexus(
  path,
  datatype = c("standard", "dna", "rna", "protein"),
  header = FALSE,
  sep = ",",
  con = stdout()
)
```

## Arguments

- path:

  a character vector of length 1 with the path to the table file.

- datatype:

  a character vector of length 1 with the desired datatype. Possible
  values are STANDARD, DNA, RNA, or PROTEIN. Multicharacter types such
  as continuous or nucleotide are not supported.

- header:

  a logical vector of length 1 indicating whether the table file has a
  header. Defaults to FALSE.

- sep:

  a character vector of length 1 telling the kind of separator in the
  table file. Defaults to comma ",".

- con:

  the connection to which the matrix should be returned. Defaults to
  stdout(), that is, return the text to the console. If writing to a
  file, then this should be the path to the output file.

## Value

This function writes to the connected required a matrix in nexus format
for a morphological dataset (that is, datatype=standard).

## Details

This function will concatenate matrices in nexus format (mandatory) and
write to the disk the output and summary information on the partitions.
It requires that the input matrices all share the same taxa in the same
positions.

## Author

Gustavo A. Ballen

## Examples

``` r
if (FALSE) { # \dontrun{
# this will return the matrix to the console rather than to a file
table2nexus(path="morpho.csv", datatype="standard", header=FALSE, sep=",")
} # }
```
