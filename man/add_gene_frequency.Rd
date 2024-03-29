% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_gene_frequency.R
\name{add_gene_frequency}
\alias{add_gene_frequency}
\title{Add gene frequency}
\usage{
add_gene_frequency(
  phenotype_to_genes = load_phenotype_to_genes(),
  gene_frequency_threshold = NULL,
  all.x = TRUE,
  verbose = TRUE
)
}
\arguments{
\item{phenotype_to_genes}{Output of
\link[HPOExplorer]{load_phenotype_to_genes} mapping phenotypes
to gene annotations.}

\item{gene_frequency_threshold}{Only keep genes with frequency
above the set threshold. Frequency ranges from 0-100 where 100 is
a gene that occurs 100\% of the time in a given phenotype.
Include \code{NA} if you wish to retain genes that
do not have any frequency data.
See \link[HPOExplorer]{add_gene_frequency} for details.}

\item{all.x}{logical; if \code{TRUE}, then extra rows will be added to the
output, one for each row in \code{x} that has no matching row in \code{y}.
These rows will have 'NA's in those columns that are usually filled with values
from \code{y}.  The default is \code{FALSE}, so that only rows with data from both
\code{x} and \code{y} are included in the output.}

\item{verbose}{Print messages.}
}
\value{
phenos data.table with extra column
}
\description{
Add gene-level frequency, i.e. how often mutations in a given gene
are associated with a given phenotype.
Numeric frequency columns are on a 0-100\% scale.
}
\examples{
phenotype_to_genes <- load_phenotype_to_genes()[seq(1000),]
phenos2 <- add_gene_frequency(phenotype_to_genes = phenotype_to_genes)
}
