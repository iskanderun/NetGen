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
#' @importFrom igraph graph.data.frame
#' @return an `igraph` object
#' @useDynLib NetGen
#' @export
netgen <-
  function(name = "netgen",
           n_modav = c(50, 10),
           cutoffs = c(3, 0),
           net_type = 1,
           net_degree = 10,
           net_rewire = c(0.3,0.0),
           mod_probs = 0) {
    dir.create("output_gen", FALSE)
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
    #M <- scan("output_gen/adj_network.txt")
    #matrix(M, sqrt(length(M)))

    M <- read.table(
      "output_gen/network.txt",
      stringsAsFactors = FALSE,
      col.names = c("from", "to")
    )
    ## Return a basic igraph graph
    ## User can always toogle as.directed, as.undirected
    graph.data.frame(M, directed = FALSE)
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
