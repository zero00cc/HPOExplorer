% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_disease_definition.R
\name{add_disease_definition}
\alias{add_disease_definition}
\title{Add disease definition}
\usage{
add_disease_definition(
  phenos,
  cols = c("Definitions", "Preferred.Label"),
  id_col = "disease_id",
  save_dir = file.path(tools::R_user_dir("HPOExplorer", which = "cache")),
  include_mondo = TRUE,
  all.x = TRUE,
  verbose = TRUE
)
}
\arguments{
\item{phenos}{dataframe of phenotypes and values / parameters.}

\item{cols}{Metadata columns to include.}

\item{id_col}{Name of the disease ID column.}

\item{save_dir}{Directory to save metadata files to.}

\item{include_mondo}{Add IDs/names/definitions from MONDO via
\link[HPOExplorer]{add_mondo}.}

\item{all.x}{logical; if \code{TRUE}, then extra rows will be added to the
output, one for each row in \code{x} that has no matching row in \code{y}.
These rows will have 'NA's in those columns that are usually filled with values
from \code{y}.  The default is \code{FALSE}, so that only rows with data from both
\code{x} and \code{y} are included in the output.}

\item{verbose}{Print messages.}
}
\value{
phenos data.table with extra columns.
}
\description{
Add metadata for diseases using files from their respective databases:
OMIM, DECIPHER, Orphanet.
}
\examples{
phenos <- load_phenotype_to_genes(3)[seq(1000)]
phenos2 <- add_disease_definition(phenos = phenos)
}
