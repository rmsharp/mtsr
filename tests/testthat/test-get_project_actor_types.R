test_that("get_project_actor_types works", {
  project_file <-
    system.file("extdata", "project_yaml_files", "example_colony_project.yml",
                package = "crosssectiontimer", lib.loc = NULL,
                mustWork = FALSE)
  actor_types <- get_project_actor_types(project_file)
  expect_true(setequal(actor_types, c("animal_caretaker", "veterinary_tech")))
})
