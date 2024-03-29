% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert_ontology.R
\name{convert_ontology}
\alias{convert_ontology}
\title{Convert ontology}
\usage{
convert_ontology(
  ont = get_hpo(),
  terms = unique(ont$id),
  remove_terms = grep(":", terms, invert = TRUE, value = TRUE),
  to = c("adjacency", "descendancy", "dist", "dist_hclust", "dist_hclust_dendrogram",
    "clusters", "igraph", "igraph_dist", "igraph_dist_hclust",
    "igraph_dist_hclust_dendrogram", "tidygraph", "data.frame", "data.table"),
  as_sparse = FALSE
)
}
\arguments{
\item{ont}{An \link[ontologyIndex]{ontology_index} object.}

\item{terms}{Character vector of term IDs to include.}

\item{remove_terms}{Character vector of term IDs to exclude.}

\item{to}{A character string specifying the format to convert to.}

\item{as_sparse}{If TRUE, return a sparse matrix where possible.}
}
\value{
An object of the specified format.
}
\description{
Convert an  \link[ontologyIndex]{ontology_index} to
a number of other useful formats.
}
\examples{
ont <- get_hpo()
terms <- head(ont$id,100)
obj <- convert_ontology(ont=ont, terms=terms, to="igraph_dist_hclust")
}
