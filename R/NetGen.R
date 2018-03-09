#' netgen
#'
#' netgen function
#'
#' @param name a user-specified name for this network
#' @param n_modav network size and average module size (integer vector, length 2)
#' @param cutoffs module and submodule minimum sizes (integer vector, length 2).
#'  (submodules are used only for bipartite and tripartite networks)
#' @param net_type integer indicating type, see details
#' @param net_degree average degree of connection
#' @param net_rewire global and local  network rewiring probabilities
#' @param mod_probs module probabilities for types 1 to 51,
#'   used for constructing mixed networks, net_type = 0
#' @details
#' network type
#' 0 = mixed
#' 1 = random
#' 2 = scalefree
#' 3 = nested
#' 41 = bi-partite nested
#' 42 = bi-partite random
#' 51 = tri-trophic bipartite nested-random
#' 52 = tri-trophic bipartite nested-bipartite nested
#' @importFrom stats runif
#' @useDynLib NetGen
#' @export
netgen <- function(name,n_modav,cutoffs,net_type,net_degree,net_rewire,mod_probs){
  dir.create("input")
  x <- as.character(floor(stats::runif(12)*2e9))
  writeLines(x, "input/seed.in")
  dir.create("output_gen")
  writeLines("", "output_gen/log_gen.txt")
  .Fortran(
    "subnetgen",
    name,
    as.integer(n_modav),
    as.integer(cutoffs),
    as.integer(net_type),
    as.single(net_degree),
    as.single(net_rewire),
    as.single(mod_probs)
  )
}
#
#
#  -------- end network generation ---------




#  -------- plot network and adjacency matrix  -----------
#
#

#G=nx.Graph()
#array = np.loadtxt("./output_gen/"+name+"_net.txt")
#G.add_edges_from(array)

