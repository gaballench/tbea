# tnt2newick: Function for converting from TNT tree format to newick parenthetical format

tnt2newick: Function for converting from TNT tree format to newick
parenthetical format

## Usage

``` r
tnt2newick(
  file,
  output = NULL,
  string = NULL,
  return = FALSE,
  subsetting = FALSE,
  name.sep = NULL
)
```

## Arguments

- file:

  A vector of type 'character' with the path to the original TNT tree
  file.

- output:

  A vector of type 'character' with the path to output files to contain
  the tree in newick format.

- string:

  A vector of type 'character' which can be either an object in memory
  or a string for interactive transformation, in TNT format. Use file in
  case your tree(s) are stored in a file instead.

- return:

  A 'logical' expression indicating whether to write the newick tree(s)
  to a file in 'output' (if FALSE, the default), or whether to return to
  the screen (if TRUE), potentially to be stored in a vector via the
  '\<-' operator.

- subsetting:

  A vector of type 'logical' indicating whether subsetting (i.e.,
  chopping at once the first and last line of the TNT tree file) should
  be done. Otherwise, explicit text replacements removing such lines are
  used. The default is false because it does not play well with
  multi-tree TNT files. Only use subsetting = TRUE if you are sure that
  there is only one tree in the file with the commands, tread and proc
  as first and last lines.

- name.sep:

  A vector of length 2 and type 'character' for carrying out separator
  conversion in the names of terminals. For instance, if the terminals
  have names composed of two words separated by an underscore (\_) and
  you want them to be separated by space ( ) then use name.sep = c("\_",
  " "). This does not support regular expressions.

## Value

This function writes to the disk a text file containing the tree
converted to newick format. Alternatively, it returns the output to the
screen or writes it to an object in memory thanks to the argument
'string'.

## Details

This function has been tested for cases where only one tree is in the
original tnt tree file. Please be careful with files containing multiple
trees.

## Author

Gustavo A. Ballen

## Examples

``` r
if (FALSE) { # \dontrun{
tnt2newick(file = "someTrees.tre", return = TRUE)
} # }
```
