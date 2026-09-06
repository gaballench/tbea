#' Frequency of topologies in a tree sample
#' 
#' @param mphy An object of class multiPhylo
#' @param output A character indicating whether the tree indices or the actual trees should be returned. Defaults to "index"
#' @param maxtrees A numeric indicating whether to warn about having more trees than the arbitrary threshold
#' @param dist.matrix A numeric matrix with the pairwise distances between topologies. 
#' 
#' @return A list with an element containing the the different tree clusters (as multiPhylo)
#' and the absolute, cumulative, and relative frequencies of each topology in the tree sample.
#'
#' @details This function can be used e.w. with a posterior sample of trees from a Bayesian analysis where we
#' want to explore the distribution of topologies in the posterior of trees. This way we can assess topological
#' uncertainty in a more meaningful way than using a majority-rule consensus.
#'
#' The use of `maxtrees` is actually a convenience for keeping in mind that large amounts of trees can cause memory
#' issues. This can end up in situations which are difficult to debug but that from personal experience have come from
#' exactly that: More trees than memory can fit or which can be processed for calculating similarity. This number will _not_
#' break the function call but will return a warning. Try to avoid modifying its default value unless you are sure it will not
#' cause any issues under your computing conditions (e.g. when lots of trees are being processed but also large RAM is available).
#'
#' The argument `dist.matrix` allows the user to precalculate any desired topological distance and therefore frees one from the
#' restriction to use only the Robinson-Fould distance. This means that topological pairwise distances between either phylogenetic
#' trees _or_ networks can be used as input.
#' 
#' @examples
#' # tests
#' set.seed(1)
#' library(ape)
#' trl <- ape::rmtree(10, 4)
#' tpf <- topoFreq(ape::unroot(trl), output="trees")
#'
#' @export
#' @importFrom ape dist.topo
#' @importFrom stats cutree hclust as.dist
#

topoFreq <- function(mphy=NULL, output="index", maxtrees=1e4, dist.matrix=NULL) {
    # both input options are NULL
    if (is.null(mphy) & is.null(dist.matrix)) {
        stop("Both mphy and dist.matrix are NULL, you need one or the other\nfor execution.")
    }
    # both input options are non-NULL
    if (!is.null(mphy) & !is.null(dist.matrix)) {
        stop("Both mphy and dist.matrix are non-NULL, you need just one or the other\nfor execution.\nPlease choose one and set the other to NULL.")
    }
    # input is a multiPhylo object
    if (!is.null(mphy)) {
        if (length(mphy) > maxtrees) {
            warning("The amount of trees to process in mphy is larger than 10.000.\n  This can cause memory issues depending on your RAM available.\n  Having more trees than your RAM can fit will probably cause problems which are difficult to debug.\n")
        }
        # calculate RF pairwise distance
        rfdist <- dist.topo(mphy)
        # calculate a hierarchical cluster using the distance matrix above
        hc <- hclust(rfdist)
        # use a threshold for determining clusters of topologies
        clusters <- cutree(hc, h=0.0001)
        # iterate over the cluster codes (1..max(clusters)) and populate the positions in the list
        clelements <- list()
        trclusters <- list()    
        for (i in 1:max(clusters)) {
            cl <- which(clusters == i)
            clelements <- c(clelements, list(cl))
            trclusters <- c(trclusters, list(mphy[cl]))
        }
        freqs_abs <- sapply(X = clelements, FUN = length)
        freqs_rel <- freqs_abs/length(mphy)
        if (output == "index") {
            return(list(index = clelements, fabs = freqs_abs, frel = freqs_rel))
        } else {
            return(list(trees = trclusters, fabs = freqs_abs, frel = freqs_rel))
        }
    }
    # input is a distance matrix
    if (!(is.null(dist.matrix))) {
        # coerce from matrix to dist object
        userdist <- as.dist(dist.matrix)
        # calculate a hierarchical cluster using the distance matrix above
        hc <- hclust(userdist)
        # use a threshold for determining clusters of topologies
        clusters <- cutree(hc, h=0.0001)
        # iterate over the cluster codes (1..max(clusters)) and populate the positions in the list
        clelements <- list()
        trclusters <- list()    
        for (i in 1:max(clusters)) {
            cl <- which(clusters == i)
            clelements <- c(clelements, list(cl))
        }
        freqs_abs <- sapply(X = clelements, FUN = length)
        freqs_rel <- freqs_abs/nrow(dist.matrix)
        if (output == "index") {
            return(list(index = clelements, fabs = freqs_abs, frel = freqs_rel))
        } else {
            stop("When using `dist.matrix` only the argument `output = \'index\'` can be used.")
        }        
    }
}

