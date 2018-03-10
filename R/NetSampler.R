#' Network Sampling Routine
#'
#' @param net_name a name for the network
#' @param out_name a name for the output file
#' @param crit sampling criteria for key nodes and neighbors, see details
#' @param key_nodes number of key nodes to sample, from mi to mf at steps of delta-m
#' and number of realizations nr mi, mf, delta-m, nr
#' @param anfn  number of first neighbors or fraction of first neighbors to include, see details
#' @param numb_hidden number of modules to exclude
#' @param hidden_modules list of modules to exclude (max 10 modules; only the first numb_hidden are used)
#' @details afn argument can be written in numerous ways:
#' - if 0 < anfn <= 1 it is interpreted as a fraction of the total number of neighbors
#' - otherwise as the number of neighbors
#' - to add all neighbors use 1.0
#' - to add 1 neighbor per node use 1.1
#' - to add 2 neighbours use 2, etc
#'
#' sampling criteria for key nodes and neighbors
#'
#' criterion for key nodes
#'
#' - 0 for random
#' - 1 for lognormal
#' - 2 for Fisher log series
#' - 3 for exponential
#' - 4 for degree
#' - 5 for module
#'
#' criterion for neighbors
#'
#' - 0 = random
#' - 1 = weighted according to exponential distribution
#'
#' @return  output files are:
#' - out_name -- main output file with info on the sunetwork
#' - abund.txt / degree.txt / module.txt
#' - subnet.txt  -- sampled network
#' - netnodes.txt -- nodes in red or blue if belong subnet or not
#' - netlinks.txt --  links in red or blue if connect subnet or not
#' @export
NetSampler <-
  function(net_name,
           out_name,
           crit,
           key_nodes = c(10, 50, 10, 1000),
           anfn = 0.5,
           numb_hidden = 0,
           hidden_modules = c(1,5,6,0,0,0,0,0,0,0)) {
    .Fortran(
      "subsampling",
      net_name = "samplenetwork.txt",
      out_name ="sampleout.txt",
      as.integer(crit),
      as.integer(key_nodes),
      as.single(anfn),
      as.integer(numb_hidden),
      as.integer(hidden_modules)
    )
  }


# the output file has eleven columns with the following results:
# m  ssn  slc  rslc  hn  ncomp  V-ssn  V-slc   V-rslc  V-hn  V-ncomp
#
#where
#
# m = number of key nodes
# ssn = average size of sampled network
# slc = average size of largest connected component
# rslc = average size of largest connected component / ssn
# hn = average number of hidden nodes found
# ncomp = average number of components of sampled networks
# V-ssn = variance of size of sampled network
# V-slc = variance of size of largest connected component
# V-rslc = variance of size of largest connected component / ssn
# V-hn = variance of number of hidden nodes found
# V-ncomp = variance of number of components of sampled networks

