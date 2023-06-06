README
================
R. Mark Sharp
2023-09-13

[![Rdoc](http://www.rdocumentation.org/badges/version/roxygen2)](http://www.rdocumentation.org/packages/roxygen2)
[![Build
Status](https://travis-ci.org/rmsharp/rmsutilityr.svg?branch=master)](https://travis-ci.org/rmsharp/crosssectiontimer)
[![codecov](https://codecov.io/gh/rmsharp/rmsutilityr/branch/master/graph/badge.svg)](https://codecov.io/gh/rmsharp/crosssectiontimer)

# crosssectiontimer

## Package Contents

A cross-sectional[^1] time-on-task estimation method is presented in two
parallel vignettes that use different value streams for illustration.
The vignettes each point out advantages of using a cross-sectional
timing method in a comparison with two established longitudinal time
collection methods: (1) time duration between milestones and (2) time
logging.

The two vignettes contain simulations that illustrate the structure,
simplicity, accuracy, and precision of the cross-sectional time-on-task
estimation method. Three levels of sampling demonstrate the ease and
relatively low impact that any need for increased precision would impose
on the sampled population. A discussion of appropriately identifying
what activities to time and how the data could be collected is included.

This package contains all R functions used to create this document
including the simulation software.

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

[^1]: Identified as Instantaneous, Pinpoint, Momentary, and Scan
    Sampling in animal behavior research is used to record behavior at
    predetermined points in time
