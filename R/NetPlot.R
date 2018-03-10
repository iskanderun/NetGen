# https://matthewlincoln.net/2014/12/20/adjacency-matrix-plots-with-r-and-ggplot2.html

#' @export
#' @import ggplot2
#' @importFrom dplyr mutate
#' @importFrom igraph graph.data.frame get.data.frame
#' @examples
#' M <- netgen()
#' netplot(M)
#'
#' netplot(netgen(net_type=3))
netplot <- function(M){
  graph <- graph.data.frame(M)

  # Re-generate dataframes for both nodes and edges, now containing
  # calculated network attributes
  node_list <- get.data.frame(graph, what = "vertices")
  edge_list <- get.data.frame(graph, what = "edges")
  # Create a character vector containing every node name
  all_nodes <- sort(node_list$name)

# Adjust the 'to' and 'from' factor levels so they are equal
# to this complete list of node names
  plot_data <- mutate(edge_list,
                    to = factor(to, levels = all_nodes),
                    from = factor(from, levels = all_nodes))

  ggplot(plot_data, aes(x = from, y = to)) +
      geom_raster() + theme_bw() +
      scale_x_discrete(drop = FALSE) +
      scale_y_discrete(drop = FALSE) +
      xlab("") +
      ylab("") +
      theme(
        axis.text = element_blank(),
        aspect.ratio = 1,
        legend.position = "none")
}


