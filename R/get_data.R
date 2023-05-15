#' Get remote data
#'
#' Download remotely stored data via \link[piggyback]{pb_download}.
#' @param save_dir Directory to save data to.
#' @keywords internal
#' @inheritParams piggyback::pb_download
#' @importFrom tools R_user_dir
get_data <- function(fname,
                     tag = "latest",
                     repo = "neurogenomics/HPOExplorer",
                     save_dir = tools::R_user_dir(
                       package = "HPOExplorer",
                       which = "cache"
                     ),
                     overwrite = TRUE,
                     check = FALSE
                     ){
  requireNamespace("piggyback")
  Sys.setenv("piggyback_cache_duration" = 10)

  tmp <- file.path(save_dir, fname)
  dir.create(save_dir, showWarnings = FALSE, recursive = TRUE)
  piggyback::pb_download(
    file = fname,
    tag = tag,
    dest = save_dir,
    repo = repo,
    overwrite = overwrite
  )
  #### Read/return ####
  if(grepl("\\.rds$",tmp)){
    return(readRDS(tmp))
  } else{
    return(tmp)
  }
}

