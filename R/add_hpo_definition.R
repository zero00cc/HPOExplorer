#' Get term definition
#'
#' This function accesses the HPO API to get a description/definition of an
#' HPO term. If a \code{line_length} \> 0 is passed to the function, it will add
#' newlines every nth word. This can be useful when displaying the description
#' in plots with limited space.
#' @param line_length The number of desired words per line \<int\>
#' @param use_api Get definitions from the HPO API,
#' as opposed to a static local dataset.
#' @inheritParams make_phenos_dataframe
#' @inheritParams make_network_object
#' @returns A named vector of HPO term descriptions.
#'
#' @export
#' @importFrom stats setNames
#' @importFrom data.table :=
#' @examples
#' phenos <- data.table::data.table(HPO_ID=get_hpo()$id[seq_len(10)])
#' phenos2 <- add_hpo_definition(phenos = phenos)
add_hpo_definition <- function(phenos,
                               line_length = FALSE,
                               use_api = FALSE,
                               verbose = TRUE) {
  definition <- HPO_ID <- NULL;

  messager("Adding term definitions.",v=verbose)
  if(isTRUE(use_api)){
    definitions <- get_term_definition_api(term = phenos$HPO_ID,
                                           line_length = line_length)
  } else {
    definitions <- get_term_definition_data(term = phenos$HPO_ID,
                                            line_length = line_length)
  }
  phenos[,definition:=definitions[HPO_ID]]
  return(phenos)
}