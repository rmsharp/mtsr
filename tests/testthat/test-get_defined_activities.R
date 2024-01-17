activity_file <-
  system.file(
    "extdata",
    "defined_activities",
    "colony_management_defined_activities.csv",
    package = "crosssectiontimer",
    lib.loc = NULL,
    mustWork = FALSE
  )
actor_type <-
  "animal_caretaker" # can be any value in the actor_type column of the
activities_all <- get_defined_activities(activity_file)
activities_animal_caretaker <-
  activities_all[activities_all$actor_type == actor_type,]
test_that("get_defined_activities works", {
  expect_true(setequal(
    activities_animal_caretaker$activity,
    c(
      "administrative work",
      "animal care correspondence",
      "animal care meeting",
      "animal care record keeping",
      "animal care record use",
      "food preparation",
      "gang cage animal feeding",
      "gang caged animal inventory and health check",
      "group animal transfer",
      "individual animal feeding",
      "individual animal transfer",
      "individual cage cleaning",
      "individual cage sanitation",
      "individual caged animal inventory and health check",
      "ordering of major equipment",
      "ordering of supplies and minor equipment",
      "personal time",
      "other"
    )
  ))
  expect_true(setequal(
    activities_all$activity[activities_all$actor_type == "veterinary_tech"],
    c(
      "administrative work",
      "animal or veterinary care record keeping",
      "animal or veterinary care record use",
      "medicine and drug preparation",
      "ordering of major equipment",
      "ordering of supplies and minor equipment",
      "personal time",
      "physical exam",
      "research procedure",
      "surgery",
      "surgical prep of animal",
      "surgical prep; all but animal",
      "vet tech meeting",
      "veterinary procedure assisting veterinarian",
      "veterinary procedure under veterinary oversight",
      "other"
    )
  ))
})
