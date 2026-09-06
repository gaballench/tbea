trs <- ape::rmtree(n=4, N=10001, rooted=FALSE)

# fabs = 2, 2, 1
tt1 <- list(ape::read.tree(text="((A,B),C,D);"),
        ape::read.tree(text="((A,C),B,D);"),
        ape::read.tree(text="((A,B),C,D);"),
        ape::read.tree(text="((A,C),B,D);"),
        ape::read.tree(text="((A,D),B,C);"))
class(tt1) <- "multiPhylo"

# fabs = 2, 2, 1
tt2 <- list(ape::read.tree(text="((B,A),C,D);"),
        ape::read.tree(text="((A,C),B,D);"),
        ape::read.tree(text="((A,B),C,D);"),
        ape::read.tree(text="((C,A),B,D);"),
        ape::read.tree(text="((A,D),B,C);"))
class(tt2) <- "multiPhylo"

# fabs = 2, 2, 1
tt3 <- list(ape::read.tree(text="((B:0.1,A:0.2):0.3,C:0.4,D:0.5);"),
        ape::read.tree(text="((A:0.1,C:0.2):0.3,B:0.4,D:0.5);"),
        ape::read.tree(text="((A:0.1,B:0.2):0.3,C:0.4,D:0.5);"),
        ape::read.tree(text="((C:0.1,A:0.2):0.3,B:0.4,D:0.5);"),
        ape::read.tree(text="((A:0.1,D:0.2):0.3,B:0.4,C:0.5);"))
class(tt3) <- "multiPhylo"

# objects for testing equal result using mphy and dist.matrix
userdist <- as.matrix(ape::dist.topo(trs[1:30]))
userdist_frel <- topoFreq(dist.matrix=userdist)$frel
mphy_frel <- topoFreq(mphy=trs[1:30])$frel

test_that("return a warning if maxtrees is larger than the number suggested", {
    expect_warning(topoFreq(mphy=trs))
})

test_that("return an error if both of the input arguments are NULL", {
    expect_error(topoFreq(), regexp="mphy and dist.matrix are NULL")
})

test_that("return an error if both of the input arguments are non-NULL", {
    expect_error(topoFreq(mphy=trs[1:30], dist.matrix=userdist), regexp="mphy and dist.matrix are non-NULL")
})

test_that("topo frequencies are the same using either topologies or a distance matrix", {
    expect_equal(mphy_frel, userdist_frel)
})

test_that("topo frequencies are 2, 2, 1 with the same newick representation", {
    expect_equal(topoFreq(mphy=tt1)$fabs, c(2, 2, 1))
})

test_that("topo frequencies are 2, 2, 1 with the different newick representation", {
    expect_equal(topoFreq(mphy=tt2)$fabs, c(2, 2, 1))
})

test_that("topo frequencies are 2, 2, 1 with the different newick representation and different brlens", {
    expect_equal(topoFreq(mphy=tt3)$fabs, c(2, 2, 1))
})
