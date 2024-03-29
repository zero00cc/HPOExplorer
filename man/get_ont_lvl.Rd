% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_ont_lvl.R
\name{get_ont_lvl}
\alias{get_ont_lvl}
\title{Get HPO term level}
\source{
\code{
lvl_absolute <- get_ont_lvl(term = "HP:0000001", absolute=TRUE)
lvl_relative <- get_ont_lvl(term = "HP:0000001", absolute=FALSE)
}
}
\usage{
get_ont_lvl(
  term,
  hpo = get_hpo(),
  adjacency = NULL,
  absolute = TRUE,
  verbose = FALSE
)
}
\arguments{
\item{hpo}{Human Phenotype Ontology object, loaded from \pkg{ontologyIndex}.}

\item{adjacency}{An adjacency matrix generated
by \link[HPOExplorer]{adjacency_matrix}.}

\item{verbose}{Print messages.}
}
\value{
Ontology level of HPO ID.
}
\description{
In this function, ontology level refers to the number of generations of
sub-phenotypes a term has below it in the HPO DAG. For example, the root of
the HPO is term "HP:0000001", the longest path to a term with no child terms
is 14. In other words there are 14 generations of "is-a" relationships below
HP:0000001 and it is therefore at ontology level 14. A term with no
sub-phenotypes below it (a leaf node), is at ontology level 0.
}
\keyword{internal}
