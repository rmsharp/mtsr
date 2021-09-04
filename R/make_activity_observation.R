#' Make a sampled activity observation
#'
#' @returns an activity observation object
#' @param actor_type charcter vector defined as either "developer" or
#'                   "implementer"
#' @param prob a vector of probability weights for obtaining the elements
#'             of the vector being sampled.
#' @export
make_activity_observation <- function(actor_type, size = 1, prob) {
  activities <- get_defined_activities()
  activities <- activities$action[activities$actor_type == actor_type]
  sample(activities, size = size, replace = TRUE, prob = prob)
}
