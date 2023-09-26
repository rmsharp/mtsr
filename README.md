README
================
R. Mark Sharp
2023-09-25

[![Rdoc](http://www.rdocumentation.org/badges/version/roxygen2)](http://www.rdocumentation.org/packages/roxygen2)
[![Build
Status](https://travis-ci.org/rmsharp/rmsutilityr.svg?branch=master)](https://travis-ci.org/rmsharp/crosssectiontimer)
[![codecov](https://codecov.io/gh/rmsharp/rmsutilityr/branch/master/graph/badge.svg)](https://codecov.io/gh/rmsharp/crosssectiontimer)

# crosssectiontimer

## Package Contents

Momentary time sampling (MTS) is a time-on-task estimation method that
samples defined behaviours in the exact instant that you’re taking data.
This package presents MTS[^1] in two parallel vignettes that use
different value streams for illustration. Each vignette describes the
strengths of MTS over two common longitudinal time collection methods:
(1) time duration between milestones and (2) time logging.

The two vignettes contain topic specific simulations that illustrate the
structure, simplicity, accuracy, and precision of the cross-sectional
time-on-task estimation method. Three levels of sampling demonstrate the
ease and relatively low impact that any need for increased precision
would impose on the sampled population. A discussion of appropriately
identifying what activities to time and how the data could be collected
is included.

This package contains all R functions used to create this document
including the simulation software. The two vignettes share almost all
code and text. Their individual attributes are provided by their
separate parent documents, the value stream’s defined activities, and an
R script that contains the directives of how the simulation is to be run
and what value stream to examine. The parent documents differ by three
lines: the first is the title, the second is the name of the file, and
the third is the name of the customization R code script which is 18
lines long.

### github.com Installation

The current development version can be installed from GitHub.
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

[^1]: Identified as Instantaneous, Pinpoint, Momentary, and Scan
    Sampling in animal and human behavior research. Momentary Time
    Sampling dominates in the human literature.
