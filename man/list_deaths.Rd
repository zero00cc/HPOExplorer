% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/list_deaths.R
\name{list_deaths}
\alias{list_deaths}
\title{List age of death HPO terms}
\usage{
list_deaths(
  hpo = get_hpo(),
  exclude = FALSE,
  as_hpo_ids = FALSE,
  include_na = TRUE,
  verbose = TRUE
)
}
\arguments{
\item{hpo}{Human Phenotype Ontology object, loaded from \pkg{ontologyIndex}.}

\item{exclude}{HPO phenotype names to exclude.}

\item{as_hpo_ids}{Return as a character vector vector HPO IDs only.}

\item{include_na}{Include NA values for onset.}

\item{verbose}{Print messages.}
}
\value{
Named list of HPO IDs.
}
\description{
List age of death phenotypes in the HPO.
}
\examples{
deaths <- list_deaths()
}
