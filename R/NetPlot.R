# https://matthewlincoln.net/2014/12/20/adjacency-matrix-plots-with-r-and-ggplot2.html

#' Plot network adjacency matrix
#'
#' @param graph an igraph object
#' @export
#' @importFrom ggplot2 aes_string ggplot scale_x_discrete scale_y_discrete
#' @importFrom ggplot2 element_blank theme_bw xlab ylab theme geom_raster
#' @importFrom igraph get.data.frame
#' @examples
#' graph <- netgen()
#' adj_plot(graph)
#'
adj_plot <- function(graph){

  edge_list <- igraph::get.data.frame(graph, what = "edges")

  ggplot(edge_list, aes_string(x = "from", y = "to")) +
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


