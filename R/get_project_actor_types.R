#' get_project_actor_types
#'
#' @param project_file character vector of length one with the path to the
#' project file.
#'
#' @return A character vector with the actor types.
#' @export
#'
#' @examples
#' project_file <- system.file("extdata", "project_yaml_files",
#'                             "example_colony_project.yml",
#'                             package = "crosssectiontimer", lib.loc = NULL,
#'                             mustWork = FALSE)
#' actor_types <- get_project_actor_types(project_file)
get_project_actor_types <- function(project_file) {
  project <- yaml::yaml.load_file(project_file)
  names(project$project$actor_type)
}
