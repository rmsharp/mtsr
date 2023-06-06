#' Simulation of actors activities to estimate duration on each activity
#'
#' The simulation repeats the estimation experiment to allow estimation of the
#' precision of the estimates expected from the estimation experiment.
#'
#' @param activities data.frame object with a single actor_type
#' @param size typically n_actors * n_months * times_per_month
#' @param iterations integer indicating the number of times the simulation
#' is to occur.
#'
#' @export
sim_sample_duration <- function(activities,
                                size = 100,
                                iterations = 1) {
  max_delta <- numeric(iterations)
  for (i in seq_len(iterations)) {
    small_sample <-
      make_activity_observation(activities, size = size,
                                activities$freq)
    small_sample_counts <- table(small_sample)
    sample_size <- sum(small_sample_counts)
    small_sample_duration <- small_sample_counts / sample_size
    small_sample_duration <-
      make_complete_sample_durations(small_sample_duration, activities)
    max_delta[i] <-
      max(abs(small_sample_duration$duration - activities$freq))
  }
  max_delta
}
