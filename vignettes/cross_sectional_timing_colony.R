## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, fig.pos = 'H')
library("crosssectiontimer")
library(ggplot2)
library(kableExtra)
library(magrittr)
library(rmsutilityr)
library(stringi)


## ----customization------------------------------------------------------------
source("customization_files/colony_customization.R")
# activity_file <- 
#   system.file("vignettes",
#               "customization_files/colony_customization.R", 
#               package = "crosssectiontimer", lib.loc = NULL, 
#               mustWork = FALSE)


## ----activities, echo = FALSE-------------------------------------------------
activities <- activities[activities$actor_type == actor, ]
caption <- stri_c("List of possible activities for the ",
                  stri_replace_all_fixed(actor, pattern = "_",
                                         replacement = "\\_"),
" with assigned frequencies to be used in simulations.")
activities[ , c("activity", "freq")] %>%
  kbl(digits = 2, col.names = c("Activity", "Frequency"),
      caption = caption, row.names = FALSE) %>%
  kable_styling(latex_options = "HOLD_position") %>%
  kable_material(c("striped", "hover"))


## -----------------------------------------------------------------------------
three_samples <- get_and_or_list(make_activity_observation(activities,
                                                           size = 3,
                                                           activities$freq))


## ----small-sample-------------------------------------------------------------
small_sample <- make_activity_observation(
  activities, size = n_actors * times_per_month * n_months, activities$freq)
small_sample_counts <- table(small_sample)
sample_size <- sum(small_sample_counts)
small_sample_duration <- small_sample_counts / sample_size

small_sample_duration <-
  make_complete_sample_durations(small_sample_duration, activities)

activities <- activities[order(activities$activity), ]

caption <- stri_c("List of activities, the frequency in which they were ",
                  "observed, the simulated frequency of the activity ",
                  "(expected), and the absolute difference between the ",
                  "observed and expected frequencies.")

delta <- abs(small_sample_duration$duration - activities$freq)
small_sample_duration %>%
  cbind(data.frame(prob = activities$freq, delta = delta)) %>%
  kbl(digits = 3,
      col.names = c("Description", "Observed", "Expected", "Delta"),
      caption = caption) %>%
  kable_styling(latex_options = "HOLD_position") %>%
  add_header_above(c(" " = 1, "Duration" = 3)) %>%
  kable_material(c("striped", "hover"))


## ----small-sample-in-minutes--------------------------------------------------
minutes_per_activity <- small_sample_duration$duration * 560
minutes_per_activity <- data.frame(description = small_sample_duration$description,
                                    minutes = as.numeric(minutes_per_activity))
caption <- stri_c("List of activities and the estimated number of minutes ",
                  "spent on the activity if represented in a single day.")
minutes_per_activity %>%
  kbl(digits = 1, col.names = c("Description", "Minutes"),
      caption = caption) %>%
  kable_styling(latex_options = "HOLD_position") %>%
  kable_material(c("striped", "hover"))


## -----------------------------------------------------------------------------
this_n_actors <- n_actors
sim_delta_freq <- sim_sample_duration(
  activities,
  size = this_n_actors * times_per_month * n_months,
  iterations = iterations)
gt_1_percent <- sum(sim_delta_freq > 0.01) / length(sim_delta_freq)
gt_2_percent <- sum(sim_delta_freq > 0.02) / length(sim_delta_freq)
gt_3_percent <- sum(sim_delta_freq > 0.03) / length(sim_delta_freq)

hist_1X_cap <-
  stri_c("Simulation of ",
         format(iterations, digits = 0, decimal.mark = ".",
                big.mark = ","),
         " iterations with ",
         this_n_actors, " ",
         stri_replace_all_fixed(actor, pattern = "_", replacement = " "),
         "s sampled ",times_per_month,
         " times per month for one year found ",
         100 * gt_1_percent, "% of durations \nwere greater than ",
         "1 percent away from the ",
         "expected value and ",
         100 * gt_2_percent, "% of durations \nwere greater than ",
         "2 percent away from the ",
         "expected value and ", 100 * gt_3_percent,
         "% of \ndurations were greater than 3 ",
         "percent away from the expected value \nwith the largest ",
         "absolute delta value being ", round(max(sim_delta_freq), 3),
         ".")


## ----hist-1X, fig.cap=hist_1X_cap, fig.pos="H"--------------------------------
data.frame(freq = sim_delta_freq) %>%
  ggplot(aes(x = freq)) +
  geom_histogram(bins = 30) +
  ggtitle(stri_c(this_n_actors, " ",
         stri_replace_all_fixed(actor, pattern = "_", replacement = " "),
         "s sampled ", times_per_month,
                 " times per month for one year")) +
  xlab("Absolute Value of (Expected - Observed) Frequency") +
  ylab("Count")


## -----------------------------------------------------------------------------
this_n_actors <- 2 * n_actors
sim_delta_freq <-
  sim_sample_duration(activities,
                      size = this_n_actors * times_per_month * n_months,
                      iterations = iterations)
gt_1_percent <- sum(sim_delta_freq > 0.01) / length(sim_delta_freq)
gt_2_percent <- sum(sim_delta_freq > 0.02) / length(sim_delta_freq)
gt_3_percent <- sum(sim_delta_freq > 0.03) / length(sim_delta_freq)

hist_2X_cap <-
  stri_c("Simulation of ",
         format(iterations, digits = 0, decimal.mark = ".",
                big.mark = ","),
         " iterations with ",
         this_n_actors, " ",
         stri_replace_all_fixed(actor, pattern = "_", replacement = " "),
         "s sampled ",times_per_month,
         " times per month for one year found ",
         100 * gt_1_percent, "% of durations \nwere greater than ",
         "1 percent away from the ",
         "expected value and ",
         100 * gt_2_percent, "% of \ndurations were greater than ",
         "2 percent away from the ",
         "expected value and \n", 100 * gt_3_percent,
         "% of durations were greater than 3 ",
         "percent away from the expected \nvalue with the largest ",
         "absolute delta value being ", round(max(sim_delta_freq), 3),
         ".")


## ----hist-2X, fig.cap=hist_2X_cap, fig.pos="H"--------------------------------
data.frame(freq = sim_delta_freq) %>%
  ggplot(aes(x = freq)) +
  geom_histogram(bins = 30) +
  ggtitle(paste0(round(this_n_actors, 0), " ",
         stri_replace_all_fixed(actor, pattern = "_", replacement = " "),
         "s sampled ", times_per_month,
                 " times per month for one year.")) +
  xlab("Absolute Value of (Expected - Observed) Frequency") +
  ylab("Count")


## -----------------------------------------------------------------------------
this_n_actors <- 4 * n_actors
sim_delta_freq <-
  sim_sample_duration(activities,
                      size = this_n_actors * times_per_month * n_months,
                      iterations = iterations)
gt_1_percent <- sum(sim_delta_freq > 0.01) / length(sim_delta_freq)
gt_2_percent <- sum(sim_delta_freq > 0.02) / length(sim_delta_freq)
gt_3_percent <- sum(sim_delta_freq > 0.03) / length(sim_delta_freq)

hist_4X_cap <-
  stri_c("Simulation of ",
         format(iterations, digits = 0, decimal.mark = ".",
                big.mark = ","),
         " iterations with ",
         this_n_actors, " ",
         stri_replace_all_fixed(actor, pattern = "_", replacement = " "),
         "s sampled ",times_per_month,
         " times per month for one year found ",
         100 * gt_1_percent, "% of durations \nwere greater than ",
         "1 percent away from the ",
         "expected value and ",
         100 * gt_2_percent, "% of \ndurations were greater than ",
         "2 percent away from the ",
         "expected value and \n", 100 * gt_3_percent,
         "% of durations were greater than 3 ",
         "percent away from the expected \nvalue with the largest ",
         "absolute delta value being ", round(max(sim_delta_freq), 3),
         ".")


## ----hist-4X, fig.cap=hist_2X_cap, fig.pos="H"--------------------------------
data.frame(freq = sim_delta_freq) %>%
  ggplot(aes(x = freq)) +
  geom_histogram(bins = 30) +
  ggtitle(paste0(round(this_n_actors, 0), " ",
         stri_replace_all_fixed(actor, pattern = "_", replacement = " "),
         "s sampled ", times_per_month,
                 " times per month for one year.")) +
  xlab("Absolute Value of (Expected - Observed) Frequency") +
  ylab("Count")


## ----key-value-pairs, eval = FALSE, echo = TRUE-------------------------------
#  activity_file <-
#    system.file("extdata",
#                "colony_management_defined_activities.csv",
#                package = "crosssectiontimer", lib.loc = NULL,
#                mustWork = FALSE)
#  value_stream_descriptor <- stri_c("husbandry and veterinary care of ",
#                                    "colony animals")
#  actor <- "animal_caretaker" # can be any value in the actor column of the
#                              # activity file
#  
#  # The product of n_actors, times_per_month, and n_months is the size.
#  # The size should be about 250 for about 20 activities to get the precision
#  # illustrated herein
#  n_actors <- 20
#  times_per_month <- 5
#  n_months <- 12
#  
#  iterations <- 5000          # 5000 seems more than adequate for stable results
#  

