#' Generate network plot
#'
#' This creates a network plot which is compatible with plotly
#'  to make interactive plots.
#' It makes it possible to hover box that includes your results related to
#' each phenotype and/or a description of the phenotypes.
#'
#' @param phenoNet The network object created using create_network_object
#' @param colour_var Column  to be mapped to node colour.
#' @param colour_label A label for the colour figure legend \<string\>.
#' @param size_var Column name to be mapped  to node size.
#' @param interactive Make the plot interactive with \link[plotly]{ggplotly}.
#' @param verbose Print messages.
#' @inheritParams plotly::ggplotly
#' @inheritDotParams plotly::ggplotly
#' @returns A network plot (compatible with interactive plotly rendering).
#'
#' @export
#' @import ggplot2
#' @importFrom ggnetwork geom_edges
#' @importFrom plotly ggplotly layout
#' @examples
#' phenos <- make_phenos_dataframe(ancestor = "Neurodevelopmental delay")
#' phenoNet <- make_network_object(phenos = phenos,
#'                                 colour_var = "ontLvl_geneCount_ratio")
#' plt <- ggnetwork_plot(phenoNet = phenoNet,
#'                       colour_var = "ontLvl_geneCount_ratio",
#'                       colour_label = "ontLvl_genes")
ggnetwork_plot <- function(phenoNet,
                           colour_var = "fold_change",
                           colour_label = gsub("_"," ",colour_var),
                           size_var = "ontLvl",
                           interactive = TRUE,
                           tooltip = "hover",
                           verbose = TRUE,
                           ...) {
  # templateR:::source_all()
  # devoptera::args2vars(ggnetwork_plot)

  requireNamespace("ggplot2")
  x <- y <- xend <- yend <- hover <- hpo_name <- NULL;

  #### Check size_var ####
  if(!size_var %in% names(phenoNet)){
    messager(paste0("size_var=",shQuote(size_var)),"not found in phenoNet.",
             "Setting size_var=colour_var",v=verbose)
    size_var <- colour_var
  }
  #### Check
  if(!tooltip %in% names(phenoNet)){
    tooltip <- "all"
  }
  #### Create plot ####
  messager("Creating ggnetwork plot.",v=verbose)
  network_plot <- ggplot2::ggplot(phenoNet,
                                  ggplot2::aes(x = x,
                             y = y,
                             xend = xend,
                             yend = yend,
                             text = hover)) +
    ggplot2::geom_point(ggplot2::aes_string(colour = colour_var,
                            size = size_var)) +
    ggplot2::geom_text(ggplot2::aes(label = hpo_name), color = "black") +
    ggplot2::scale_colour_gradient2(low = "white",
                                    mid = "yellow",
                                    high = "red") +
    ggplot2::scale_size(trans = "exp") +
    ggplot2::guides(size = "none") +
    ggplot2::labs(colour = colour_label) +
    ggplot2::theme_void()
  #### Only add edges if any of the nodes are connected ####
  ## Otherwise, ggplotly gets confused and throws an error
  if(sum(phenoNet$n_edges)>0){
    network_plot <- network_plot +
      ggnetwork::geom_edges(color = "darkgray")

  }
  #### Make interactive ####
  if(isTRUE(interactive)){
    return(plotly::ggplotly(p = network_plot,
                            tooltip = tooltip,
                            ...) |>
           plotly::layout(hoverlabel = list(align = "left"))
           )
  } else {
    return(network_plot)
  }
}
