#' Make a sampled activity observation
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
