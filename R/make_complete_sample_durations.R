#' Make a complete sample duration data.frame object
#'
#' Adds back missing activities that were dropped by the \code{table} function
#' because they do not appear in the sample. They are added into the object
#' and given a count of zero.
#'
#' @returns an sample duration data.frame object
#' @param sample_duration named numeric vector that may be missing actions if
#' those actions did not occur during the sampling phase.
#' @param actor_activities data.frame of all possible actor actions.
#' @export
make_complete_sample_durations <- function(sample_duration, actor_activities) {
  description <- names(sample_duration)
  missing_names <- actor_activities$activity[
    !is.element(actor_activities$activity, description)]
  missing_names_len <- length(missing_names)
  description <- c(description, missing_names)
  duration <- as.numeric(sample_duration)
  duration <- c(duration, rep(0, missing_names_len))
  data.frame(description = description, duration = duration)
}
