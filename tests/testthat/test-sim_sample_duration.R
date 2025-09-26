test_that("sim_sample_duration works", {
  set.seed(123)
  activity_file <-
    system.file("extdata", "defined_activities",
                "colony_management_defined_activities.csv",
                package = "mtsr", lib.loc = NULL,
                mustWork = FALSE)
  activities <- get_defined_activities(activity_file)
  activities <- activities[activities$actor_type == "animal_caretaker", ]
  n_actors <- 25
  times_per_month <- 5
  n_months <- 12
  iterations <- 50          # 5000 seems more than adequate for stable results
  sim_delta_freq <- sim_sample_duration(
    activities,
    size = n_actors * times_per_month * n_months,
    iterations = iterations)

  expect_equal(length(sim_delta_freq), iterations)
  expect_true(all(sim_delta_freq < 0.05))
  expect_true(all(sim_delta_freq > 0.01))
  expect_equal(sim_delta_freq[1], 0.0407, tolerance = 1e-3)
})
