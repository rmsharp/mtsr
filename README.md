README
================
R. Mark Sharp
2021-11-26

[![Rdoc](http://www.rdocumentation.org/badges/version/roxygen2)](http://www.rdocumentation.org/packages/roxygen2)
[![Build
Status](https://travis-ci.org/rmsharp/rmsutilityr.svg?branch=master)](https://travis-ci.org/rmsharp/crosssectiontimer)
[![codecov](https://codecov.io/gh/rmsharp/rmsutilityr/branch/master/graph/badge.svg)](https://codecov.io/gh/rmsharp/crosssectiontimer)

<!-- README.md is generated from README.Rmd. Please edit that file -->

# Introduction

A cross-sectional time on task estimation method is presented, compared
to use of time logging, illustrated with an example, and its accuracy
and precision demonstrated with a simulation. Finally, a proposed
protocol for using this time on task estimation technique is presented
that discusses potential methods to ensure representative time estimates
are obtained.

This package contains the R functions used to create this document and
the simulation software. The specific example, which is the husbandry
and veterinary care of colony animals is provided by setup section of
the “.Rmd” source file and a comma separated value (CSV) file with the
actor, activity, and activity descriptions. Users of this package can
easily adapt the small customization script and the task activities file
to simulate the study they are considering to estimate the precision
they can expect for their specified task and sampling design.

### github.com Installation

The current development version can be intalled from GitHub.
[github.com/rmsharp/crosssectiontimer](https://github.com/rmsharp/crosssectiontimer)
as all of the dependencies are automatically installed.

You can install **crosssectiontimer** from github with:

``` r
install.packages("devtools")
devtools::install_github("rmsharp/crosssectiontimer")
```

All missing dependencies should be automatically installed except for
those found in rmsutilityr, which is available at my github account.

You can install **rmsutilityr** from github with:

``` r
install.packages("devtools")
devtools::install_github("rmsharp/rmsutilityr")
```

Find online documentation at
<https://rmsharp.github.io/crosssectiontimer/>.

See the setup code chunk of this vignette to see how to customize this
document to examine results you can expect from your own time on task
activity analysis. You will need to provide the CSV file[^1] with your
own actors[^2], activities, and activity descriptions in addition to
providing your definitions for the setup chunk definitions indicated
below.

``` r
activity_file <- 
  system.file("extdata",
              "colony_management_defined_activities.csv", 
              package = "crosssectiontimer", lib.loc = NULL, 
              mustWork = FALSE)
value_stream_descriptor <- stri_c("husbandry and veterinary care of ",
                                  "colony animals")
actor <- "animal_caretaker" # can be any value in the actor column of the 
                            # activity file

# The product of n_actors, times_per_month, and n_months is the size. 
# The size should be about 250 for about 20 activities to get the precision
# illustrated herein
n_actors <- 20
times_per_month <- 5
n_months <- 12

iterations <- 5000          # 5000 seems more than adequate for stable results
```

[^1]: Comparable to colony_management_defined_activities.csv

[^2]: Actors are used as variable names so must follow rules for naming
    variables in R. They must start with a letter, contain only letters,
    numerals, “.”, and “\_“.
