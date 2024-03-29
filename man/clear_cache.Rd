% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clear_cache.R
\name{clear_cache}
\alias{clear_cache}
\title{Clear cache}
\usage{
clear_cache(
  save_dir = tools::R_user_dir(package = "HPOExplorer", which = "cache"),
  recursive = TRUE,
  verbose = TRUE,
  ...
)
}
\arguments{
\item{save_dir}{Path to cache directory.}

\item{recursive}{logical.  Should directories be deleted recursively?}

\item{verbose}{Print messages.}

\item{...}{
  Arguments passed on to \code{\link[base:unlink]{base::unlink}}
  \describe{
    \item{\code{x}}{a character vector with the names of the file(s) or
    directories to be deleted.}
    \item{\code{force}}{logical.  Should permissions be changed (if possible) to
    allow the file or directory to be removed?}
    \item{\code{expand}}{logical. Should wildcards (see \sQuote{Details} below) and
    tilde (see \code{\link[base]{path.expand}}) be expanded?}
  }}
}
\value{
Null.
}
\description{
Remove all data cached by \pkg{HPOExplorer}.
}
\examples{
\dontrun{
clear_cache()
}
}
