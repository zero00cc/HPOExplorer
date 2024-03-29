% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_omop.R
\name{add_omop}
\alias{add_omop}
\title{Add MONDO}
\usage{
add_omop(
  phenos,
  id_col = "hpo_id",
  all.x = TRUE,
  allow.cartesian = FALSE,
  force_new = FALSE,
  verbose = TRUE
)
}
\arguments{
\item{phenos}{dataframe of phenotypes and values / parameters.}

\item{id_col}{ID column to map to MONDO IDs.}

\item{all.x}{logical; if \code{TRUE}, then extra rows will be added to the
output, one for each row in \code{x} that has no matching row in \code{y}.
These rows will have 'NA's in those columns that are usually filled with values
from \code{y}.  The default is \code{FALSE}, so that only rows with data from both
\code{x} and \code{y} are included in the output.}

\item{allow.cartesian}{See \code{allow.cartesian} in \code{\link[data.table]{[.data.table}}.}

\item{force_new}{Force a new query to the OARD API instead of
using pre-downloaded data.}

\item{verbose}{Print messages.}
}
\description{
Add metadata from \href{https://mondo.monarchinitiative.org/}{MONDO},
including:
\itemize{
\item{MONDO_ID: }{MONDO term ID.}
\item{MONDO_name: }{MONDO term name.}
\item{MONDO_definition: }{MONDO term definition.}
}
}
\examples{
phenos <- example_phenos()
phenos2 <- add_omop(phenos = phenos)
}
