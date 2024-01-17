#' Make a sampled activity observation
#'
#' @examples
#' activity_file <-
#'   system.file("extdata", "defined_activities",
#'               "colony_management_defined_activities.csv",
#'               package = "crosssectiontimer", lib.loc = NULL,
#'               mustWork = FALSE)
#' activities_all <- get_defined_activities(activity_file)
#' activities <- activities_all$activity[
#'   activities_all$actor_type == "animal_caretaker"]
#' prob <- activities_all$probability[
#'   activities_all$actor_type == "animal_caretaker"]
#' activity_observations <- make_activity_observation(activities_all, size = 10,
#'                                                    prob = prob)
#' activity_observations
#'
#' @returns an activity observation object
#' @param activities data.frame object with a single actor_type
#' @param size the number of actors * n_months * time_per_month
#' @param prob a vector of probability weights for obtaining the elements
#'             of the vector being sampled.
#' @export
make_activity_observation <- function(activities, size = 1, prob) {
  sample(activities$activity, size = size, replace = TRUE, prob = prob)
}
