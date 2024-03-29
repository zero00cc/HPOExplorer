#' Make hoverboxes
#'
#' A hoverbox is a box of text that shows up when the cursor
#'  hovers over something.
#' These can be useful when making interactive network plots
#' of the HPO phenotypes because we can include a hoverbox that gives
#' information and data associated with each phenotype.
#'
#' This function expects a dataframe of with a "hpo_name" column that has the
#' name of each phenotype. It must then include columns
#'  for all of the parameters you wish to include in the hoverbox.
#' @inheritParams make_phenos_dataframe
#' @inheritParams make_network_object
#' @inheritParams base::round
#' @inheritParams stringr::str_wrap
#' @returns A nicely formatted string with newlines etc,
#' to be used as a hoverbox.
#'
#' @export
#' @importFrom stats setNames
#' @importFrom data.table :=
#' @importFrom stringr str_wrap
#' @examples
#' phenos <- make_phenos_dataframe(ancestor = "Neurodevelopmental delay",
#'                                 add_hoverboxes = FALSE)
#' phenos <- make_hoverboxes(phenos = phenos)
make_hoverboxes <- function(phenos,
                            columns = list_columns(),
                            interactive = TRUE,
                            width = 60,
                            digits = 3,
                            verbose = TRUE) {
  # templateR:::source_all()
  # devoptera::args2vars(make_hoverboxes)

  hover <- hpo_id <- hpo_name <- NULL;

  #### Select sep ####
  sep <- if(isTRUE(interactive)) "<br>" else "\n"
  columns <- columns[unname(columns) %in% names(phenos)]
  if(length(columns)==0){
    messager("No columns found. Making hoverboxes from hpo_id only.",v=verbose)
    phenos[hover:=paste("hpo_id:",hpo_id)]
  } else {
    messager("Making hoverboxes from:",
             paste(shQuote(columns),collapse = ", "),v=verbose)
    #### Iterate over phenotypes ####
    hoverBoxes <- lapply(stats::setNames(
      unique(phenos$hpo_name),
      unique(phenos$hpo_name)
    ), function(pheno_i){
      lapply(seq(length(columns)), function(i){
        val <- phenos[hpo_name == pheno_i, ][1,][[columns[[i]]]]
        val <- if(is.numeric(val)) round(val,digits = digits) else {
          paste(
            stringr::str_wrap(val, width = width),
          collapse = sep
          )
        }
        paste0("<b>",names(columns)[[i]],"</b>",
               ": ",val
               )
      }) |> paste(collapse = sep)
    })
    #### Assign to each row #####
    phenos$hover <- unlist(hoverBoxes[phenos$hpo_name])
  }
  return(phenos)
}
