% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/make_hoverboxes.R
\name{make_hoverboxes}
\alias{make_hoverboxes}
\title{Make hoverboxes}
\usage{
make_hoverboxes(
  phenos,
  columns = list_columns(),
  interactive = TRUE,
  width = 60,
  digits = 3,
  verbose = TRUE
)
}
\arguments{
\item{phenos}{dataframe of phenotypes and values / parameters.}

\item{columns}{A named vector of columns in \code{phenos}
to add to the hoverdata via \link[HPOExplorer]{make_hoverboxes}.}

\item{interactive}{Make the plot interactive with \link[plotly]{ggplotly}.}

\item{width}{Positive integer giving target line width (in number of
characters). A width less than or equal to 1 will put each word on its
own line.}

\item{digits}{integer indicating the number of decimal places
    (\code{round}) or significant digits (\code{signif}) to be used.
    For \code{round}, negative values are allowed (see \sQuote{Details}).}

\item{verbose}{Print messages.}
}
\value{
A nicely formatted string with newlines etc,
to be used as a hoverbox.
}
\description{
A hoverbox is a box of text that shows up when the cursor
hovers over something.
These can be useful when making interactive network plots
of the HPO phenotypes because we can include a hoverbox that gives
information and data associated with each phenotype.
}
\details{
This function expects a dataframe of with a "hpo_name" column that has the
name of each phenotype. It must then include columns
for all of the parameters you wish to include in the hoverbox.
}
\examples{
phenos <- make_phenos_dataframe(ancestor = "Neurodevelopmental delay",
                                add_hoverboxes = FALSE)
phenos <- make_hoverboxes(phenos = phenos)
}
