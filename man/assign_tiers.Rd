% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assign_tiers.R
\name{assign_tiers}
\alias{assign_tiers}
\title{Add severity Tiers (auto)}
\usage{
assign_tiers(
  hpo = get_hpo(),
  terms = hpo$id,
  keyword_sets = list(Tier1 = c("intellectual disability", "death"), Tier2 =
    c("impaired mobility", "malform"), Tier3 = c("sight", "vision", "immunodeficien",
    "cancer", "hearing", "touch", "pain ", " pain", "mental illness", "dysmorphic"),
    Tier4 = c("fertility")),
  check_names = TRUE,
  check_definitions = TRUE,
  check_diseases = FALSE,
  search_ancestors = TRUE,
  search_descendants = TRUE,
  as_datatable = FALSE,
  verbose = TRUE
)
}
\arguments{
\item{hpo}{Human Phenotype Ontology object, loaded from \pkg{ontologyIndex}.}

\item{terms}{A subset of HPO IDs to assign Tiers to.}

\item{keyword_sets}{A named list of regex queries to be used when searching
for phenotypes that have matching metadata.}

\item{check_names}{When regexsearching for matching terms,
check the phenotype names.}

\item{check_definitions}{When regex searching for matching terms,
check the phenotype definition.}

\item{check_diseases}{When regex searching for matching terms,
check the names of diseases associated with the phenotype.}

\item{search_ancestors}{Inherit Tiers of ancestors.}

\item{search_descendants}{Inherit Tiers of descendants.}

\item{as_datatable}{Return the results as a \link[data.table]{data.table}.}

\item{verbose}{Print messages.}
}
\value{
Tier assignments for each term in \code{terms}.
Will be returned as either a named vector or a \link[data.table]{data.table}.
}
\description{
Automatically add severity Tier for each HPO ID, in accordance with the
rating system provided by
\href{https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4262393/}{
Lazarin et al (2014)}.
In order of increasing severity:
\itemize{
\item{Tier 4 }{Reduced fertility}
\item{Tier 3 }{Sensory impairment: vision,
Immunodeficiency/cancer,
Sensory impairment: hearing,
Sensory impairment: touch, other (including pain),
Mental illness,
Dysmorphic features}
\item{Tier 2 }{Shortened life span: premature adulthood,
Impaired mobility,
Internal physical malformation}
\item{Tier 1 }{Shortened life span: infancy,
Shortened life span: childhood/adolescence,
Intellectual disability}
}
}
\examples{
terms <- get_hpo()$id[seq(10)]
tiers <- assign_tiers(terms = terms)
}
