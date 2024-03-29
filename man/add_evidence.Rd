% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_evidence.R
\name{add_evidence}
\alias{add_evidence}
\title{Add evidence}
\usage{
add_evidence(
  phenos,
  keep_evidence = NULL,
  all.x = TRUE,
  allow.cartesian = FALSE,
  agg_by = c("disease_id", "gene_symbol"),
  default_score = 1,
  verbose = TRUE
)
}
\arguments{
\item{phenos}{dataframe of phenotypes and values / parameters.}

\item{keep_evidence}{The evidence scores of each gene-disease
association to keep.}

\item{all.x}{logical; if \code{TRUE}, then extra rows will be added to the
output, one for each row in \code{x} that has no matching row in \code{y}.
These rows will have 'NA's in those columns that are usually filled with values
from \code{y}.  The default is \code{FALSE}, so that only rows with data from both
\code{x} and \code{y} are included in the output.}

\item{allow.cartesian}{See \code{allow.cartesian} in \code{\link[data.table]{[.data.table}}.}

\item{agg_by}{Column to aggregate metadata by.}

\item{default_score}{Default evidence score to
apply to gene-disease associations that are present in the HPO annotations
but don't have evidence scores in the GenCC annotations.}

\item{verbose}{Print messages.}
}
\value{
phenos data.table with extra columns:
\itemize{
\item{"evidence_score_min": }{Minimum evidence score.}
\item{"evidence_score_max": }{Maximum evidence score.}
\item{"evidence_score_mean": }{Mean evidence score.}
}
}
\description{
Add the strength of evidence supporting each gene-disease association.
\href{https://thegencc.org/faq.html#validity-termsdelphi-survey}{
Delphi survey} evidence classification IDs and
assigned "evidence_score" values:
\itemize{
\item{GENCC:100001 }{"Definitive" (evidence_score=6)}
\item{GENCC:100002 }{"Strong" (evidence_score=5)}
\item{GENCC:100003 }{"Moderate" (evidence_score=4)}
\item{GENCC:100009 }{"Supportive" (evidence_score=3)}
\item{GENCC:100004 }{"Limited" (evidence_score=2)}
\item{GENCC:100005 }{"Disputed Evidence" (evidence_score=1)}
\item{GENCC:100006 }{"Refuted Evidence" (evidence_score=0)}
\item{GENCC:100008 }{"No Known Disease Relationship" (evidence_score=0)}
}
}
\examples{
phenos <- load_phenotype_to_genes()
phenos2 <- add_evidence(phenos = phenos)
}
