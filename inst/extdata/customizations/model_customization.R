activity_file <-
  system.file("extdata", "defined_activities",
              "model_defined_activities.csv",
              package = "crosssectiontimer", lib.loc = NULL,
              mustWork = FALSE)
value_stream_descriptor <- stri_c("selection and training of predictive ",
                                  "models")
actor <- "model_developer" # can be any value in the actor column of the
# activity file
# The product of n_actors, times_per_month, and n_months is the size.
# The size should be about 250 for about 20 activities to get the precision
# illustrated herein
n_actors <- 25
times_per_month <- 5
n_months <- 12
iterations <- 5000          # 5000 seems more than adequate for stable results
activities <- get_defined_activities(activity_file)
activities <- activities[activities$actor_type == actor, ]
