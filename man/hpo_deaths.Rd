% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{hpo_deaths}
\alias{hpo_deaths}
\title{Human Phenotype Ontology: Age of Death}
\format{
data.table
}
\source{
\code{
terms <- ontologyIndex::get_descendants(ontology = get_hpo(),
                                        roots = "HP:0011420",
                                        exclude_roots = TRUE)
aod <- lapply(stats::setNames(terms, terms),
              function(hpo_id){
                message("Extracting API data for",hpo_id)
                d <- hpo_api(hpo_id = hpo_id, type = "diseases")$diseases
              }) |> data.table::rbindlist(fill = TRUE,
                                          use.names = TRUE,
                                          idcol = "AgeOfDeath")
aod$AgeOfDeath_name <- harmonise_phenotypes(phenotypes = aod$AgeOfDeath,
                                            as_hpo_ids = FALSE)
#### Convert AoD to numeric scores ####
dict <- HPOExplorer:::hpo_dict(type="AgeOfDeath")
aod$AgeOfDeath_score <- dict[aod$AgeOfDeath_name]
data.table::setnames(aod,
                     c("diseaseId","diseaseName"),
                     c("disease_id","disease_name"))
hpo_deaths <- aod
usethis::use_data(hpo_deaths, overwrite = TRUE)
}
}
\usage{
data("hpo_deaths")
}
\description{
Age of Death associated with each disease, and by extension, each phenotype.
}
\keyword{datasets}
