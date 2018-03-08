
#' netgen
#'
#' netgen function
#'
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
    net_degree,
    net_rewire,
    mod_probs
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

