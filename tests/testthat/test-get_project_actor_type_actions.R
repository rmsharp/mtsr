test_that("get_project_actor_type_actions works", {
  project_file <-
    system.file("extdata", "project_yaml_files", "example_colony_project.yml",
                package = "crosssectiontimer", lib.loc = NULL,
                mustWork = FALSE)

  actor_type_actions <-
    get_project_actor_type_actions(project_file,
                                   actor_types = "animal_caretaker")
  animal_caretaker_actions <-
    list(animal_caretaker = c(
      "meetings",
      "animal_care_correspondence",
      "record_keeping",
      "record_use",
      "food_preparation",
      "feeding_individual_animals",
      "gang_cage_feeding",
      "gang_cage_animal_inventory_and_health_check",
      "individual_animal_inventory_and_health_check",
      "group_animal_transfer",
      "individual_animal_transfer",
      "individual_cage_cleaning",
      "individual_cage_sanitation",
      "ordering_of_major_equipment",
      "ordering_of_supplies_and_minor_equipment",
      "personal_time",
      "training"
    ))
  expect_true(setequal(actor_type_actions[[1]],
                       animal_caretaker_actions[["animal_caretaker"]]))
  actor_type_actions <-
    get_project_actor_type_actions(project_file)
  expected_actor_type_actions <-
    list(
      animal_caretaker = c(
        "meetings",
        "animal_care_correspondence",
        "record_keeping",
        "record_use",
        "food_preparation",
        "feeding_individual_animals",
        "gang_cage_feeding",
        "gang_cage_animal_inventory_and_health_check",
        "individual_animal_inventory_and_health_check",
        "group_animal_transfer",
        "individual_animal_transfer",
        "individual_cage_cleaning",
        "individual_cage_sanitation",
        "ordering_of_major_equipment",
        "ordering_of_supplies_and_minor_equipment",
        "personal_time",
        "training"
      ),
      veterinary_tech = c(
        "meetings",
        "veterinary_correspondence",
        "record_keeping",
        "record_use",
        "food_preparation",
        "feeding_individual_animals",
        "gang_cage_feeding",
        "gang_cage_animal_inventory_and_health_check",
        "medicine_and_drug_preparation",
        "physical_examination",
        "experimental_procedures",
        "veterinary_procedures",
        "experimental_veterinary_assistance"
      )
    )
  expect_true(setequal(expected_actor_type_actions[[1]],
                       actor_type_actions[["animal_caretaker"]]))
  expect_true(setequal(expected_actor_type_actions[[2]],
                       actor_type_actions[["veterinary_tech"]]))

  actor_type_actions <-
    get_project_actor_type_actions(project_file,
                                   actor_types = c("animal_caretaker",
                                                   "veterinary_tech"))
  expect_true(setequal(expected_actor_type_actions[[1]],
                       actor_type_actions[["animal_caretaker"]]))
  expect_true(setequal(expected_actor_type_actions[[2]],
                       actor_type_actions[["veterinary_tech"]]))
  actor_type_actions <-
    get_project_actor_type_actions(project_file,
                                   actor_types = c("veterinary_tech",
                                                   "animal_caretaker"))
  expect_true(setequal(expected_actor_type_actions[[2]],
                       actor_type_actions[[1]]))
  expect_true(setequal(expected_actor_type_actions[[1]],
                       actor_type_actions[[2]]))


})
