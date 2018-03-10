# https://matthewlincoln.net/2014/12/20/adjacency-matrix-plots-with-r-and-ggplot2.html

#' Plot network adjacency matrix
#'
#' @param graph an igraph object
#' @export
#' @import ggplot2
#' @importFrom igraph graph.data.frame get.data.frame
#' @examples
#' graph <- netgen()
#' adj_plot(graph)
#'
adj_plot <- function(graph){

  edge_list <- igraph::get.data.frame(graph, what = "edges")

  ggplot(edge_list, aes(x = from, y = to)) +
      geom_raster() + theme_bw() +
      scale_x_discrete(drop = FALSE) +
      scale_y_discrete(drop = FALSE) +
      xlab("") +
      ylab("") +
      theme(
        axis.text = element_blank(),
        aspect.ratio = 1,
        legend.position = "none",
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank())
}


