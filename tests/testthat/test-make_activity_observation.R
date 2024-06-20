test_that("make_activity_observation works", {
  set.seed(123)
  activity_file <-
    system.file("extdata", "defined_activities",
               "colony_management_defined_activities.csv",
               package = "crosssectiontimer", lib.loc = NULL,
               mustWork = FALSE)
  activities_all <- get_defined_activities(activity_file)
  activities <- activities_all$activity[
    activities_all$actor_type == "animal_caretaker"]
  prob <- activities_all$probability[
    activities_all$actor_type == "animal_caretaker"]
  activity_observations <- make_activity_observation(activities_all, size = 10,
                                                     prob = prob)
  activity_observations

  expect_true(setequal(
    activity_observations,
    c(
      "vet tech meeting",
      "ordering of major equipment",
      "individual caged animal inventory and health check",
      "animal care meeting",
      "individual caged animal inventory and health check",
      "personal time",
      "physical exam",
      "research procedure",
      "animal care record use",
      "research procedure"
    )
  ))
})
