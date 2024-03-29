% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/make_ontology.R
\name{make_ontology}
\alias{make_ontology}
\title{Make an ontologyIndex object}
\usage{
make_ontology(
  file = "hp-base.obo",
  repo = "obophenotype/human-phenotype-ontology",
  tag = "latest",
  save_dir = tools::R_user_dir(package = "HPOExplorer", which = "cache"),
  extract_tags = "everything",
  fix_ascii = TRUE,
  overwrite = TRUE,
  upload_tag = NULL,
  ...
)
}
\arguments{
\item{file}{name or vector of names of files to be downloaded. If \code{NULL},
all assets attached to the release will be downloaded.}

\item{repo}{Repository name in format "owner/repo". Defaults to \code{guess_repo()}.}

\item{tag}{tag for the GitHub release to which this data should be attached.}

\item{save_dir}{Directory to save data to.}

\item{extract_tags}{Character value: either "minimal" or "everything", determining whether to extract only the properties of terms which are required to run functions in the package - i.e. \code{"id", "name", "parents", "children"} and \code{"ancestors"} - or extract all properties provided in the file. Term properties are named in the resulting \code{ontology_index} as their corresponding tags in the OBO file (except \code{"parents"}, \code{"children"} and \code{"ancestors"} which are appended with \code{"_OBO"} to avoid clashing with standard \code{ontology_index} properties. Defaults to \code{"minimal"}.}

\item{fix_ascii}{Fix non-ASCII characters in metadata.}

\item{overwrite}{Should any local files of the same name be overwritten?
default \code{TRUE}.}

\item{...}{
  Arguments passed on to \code{\link[ontologyIndex:get_ontology]{ontologyIndex::get_OBO}}
  \describe{
    \item{\code{propagate_relationships}}{Character vector of relations}
    \item{\code{merge_equivalent_terms}}{Logical value determining whether terms that are marked \code{"equivalent_to"} a target term should be merged, retaining properties of the target term when the property should have one value, e.g. the term ID and name. Defaults to \code{TRUE}.}
  }}
}
\value{
\link[ontologyIndex]{ontology_index} object
}
\description{
Make a \link[ontologyIndex]{ontology_index}
object from the Open Biomedical Ontologies (OBO) file.
By default, this function uses the Human Phenotype Ontology (HPO)
distributed via the official
\href{https://github.com/obophenotype/human-phenotype-ontology/releases}{
HPO GitHub Releases}.
}
\keyword{internal}
