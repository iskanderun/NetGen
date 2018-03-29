#' netgen
#'
#' netgen function
#'
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
#' - 0 = mixed
#' - 1 = random
#' - 2 = scalefree
#' - 3 = nested
#' - 41 = bi-partite nested
#' - 42 = bi-partite random
#' - 51 = tri-trophic bipartite nested-random
#' - 52 = tri-trophic bipartite nested-bipartite nested
#' @importFrom igraph graph.data.frame graph_from_adjacency_matrix
#' @importFrom utils read.table
#' @return an `igraph` object
#' @useDynLib NetGen, .registration = TRUE
#' @export
netgen <-
  function(
           n_modav = c(50, 10),
           cutoffs = c(3, 0),
           net_type = 1,
           net_degree = 10,
           net_rewire = c(0.3,0.0),
           mod_probs = 0) {
    res <- .Fortran(
      "subnetgen",
      output = integer(n_modav[1]^2),
      as.integer(n_modav),
      as.integer(cutoffs),
      as.integer(net_type),
      as.single(net_degree),
      as.single(net_rewire),
      as.single(mod_probs)
    )

    M <- res$output
    M <- matrix(M, sqrt(length(M)))
    igraph::graph_from_adjacency_matrix(M)

  }
