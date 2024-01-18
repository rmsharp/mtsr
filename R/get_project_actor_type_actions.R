#' get_project_actor_type_actions
#'
#' @param project_file character vector of length one with the path to the
#' project file.
#' @param actor_types character vector of one or more actor types. If NULL,
#' all actor types are used.
#' @return A list of actor_types where each has a character vector with their
#' respective actions.
#' @export
#'
#' @examples
#' project_file <- system.file("extdata", "project_yaml_files",
#'                             "example_colony_project.yml",
#'                             package = "crosssectiontimer", lib.loc = NULL,
#'                             mustWork = FALSE)
#' actor_types <- get_project_actor_types(project_file)
get_project_actor_type_actions <- function(project_file, actor_types = NULL) {
  prj <- yaml::yaml.load_file(project_file)
  if (is.null(actor_types))
    actor_types <- names(prj$project$actor_type)
  actor_type_actions <- list()
  for (actor_type in actor_types) {
    action_list <-
      prj$project$actor_type[names(prj$project$actor_type) == actor_type]
    actions <- names(action_list[[1]]$actions)
    actor_type_actions[[actor_type]] <- actions
  }
  actor_type_actions
}
