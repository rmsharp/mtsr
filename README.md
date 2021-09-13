README
================
R. Mark Sharp
2021-09-12

[![Rdoc](http://www.rdocumentation.org/badges/version/roxygen2)](http://www.rdocumentation.org/packages/roxygen2)
[![Build
Status](https://travis-ci.org/rmsharp/rmsutilityr.svg?branch=master)](https://travis-ci.org/rmsharp/crosssectiontimer)
[![codecov](https://codecov.io/gh/rmsharp/rmsutilityr/branch/master/graph/badge.svg)](https://codecov.io/gh/rmsharp/crosssectiontimer)

<!-- README.md is generated from README.Rmd. Please edit that file -->

# Purpose

A cross-sectional time on task estimation method is presented, compaired
to use of time logging, illustrated with an example, and its accuracy
and precision demonstrated with a simulation. Embedded within this
package are the R functions used to create this document including the
simulation software. The specific example, which is the the husbandry
and veterinary care of colony animals is provided by setup section of
the “.Rmd” source file and a comma separated value (CSV) file with the
actor, activity, and activity descriptions.

Management of a value stream requires adequate estimate of the resources
used to create that value with time on task being a direct measure of
the primary resource for many value streams. The need to obtain quality
estimates of these times on the various tasks in a value stream
motivated me to provide and advocating the use of this time on task
method

In this example, we want to gain insight into how much time is spent on
specific activities by various actors[1] responsible for the success of
the husbandry and veterinary care of colony animals. It is anticipated
that having time on task data will provide insight in those areas where
where improvement opportunities exist.

Detailed planning regarding questions to be addressed is required to
design which activities[2] should be measured.

A benefit of time on task studies is that they provide hard data
regarding how time is spent and how much of it directly contributes to
our primary goals. A second benefit is that these data allow each class
of actor to advocate for modifying the way their time is being used to
improve their work environment and productivity.

Time on task estimation methods that call for representative actors
within each group or type of actors to log time on tasks during their
work day have the problems listed below.

-   Failure rate in logging activities can be high.
-   Recall of the amount of time spent is often wrong this will
    artificially inflate the variance.
-   Preconceptions of how time should be spent biases recalled
    durations.
-   Keeping, collecting, and analyzing logs requires significant
    administrative overhead.
-   The biases introduced from earlier points makes interpretation of
    results difficult.
-   The longitudinal collection of data requires a long data collection
    phase before any analysis can begin.
-   Variance among different projects is anticipated to be high, which
    further complicates analysis.

The cross-sectional design assumes that we have the ability to send a
question to selected individuals at selected times and collect that
response.

The cross-sectional design presented and tested below has the following
advantages.

-   The failure to respond rate has far less impact since failure to
    respond simply initiates another response request.
-   Participants do not need to recall time spent.
-   Administrative overhead is greatly reduced.
-   Bias is minimized.
-   Data can be analyzed at any time.
-   Variance among projects could be assessed and more accurately
    measured if desired. However, I recommend that project differences
    be ignored during initial timeing studies.

# Simulation

## Design

The remainder of this document presents an example data collection, a
simple simulation study using a realistic design that provides
sufficient detail to assess expected data quality.

The example has a set of representative activities for
animal_caretakers.[3]. It simulates asking a set of animal_caretakers to
indicate which of the activities listed on the questionnaire they were
doing at the time the question popped up on their screen. Once the
animal_caretaker makes a selection, that selection is returned as a
result to the collection software, which cumulates the responses for
later analysis.

In the simulation model, these queries and responses can all be
processed in less than a second but, as described below, this simulation
is constructed so that each simulated animal_caretaker responds five
times during the entire duration of the experiments illustrated below.

The manner in which the questions are presented and the timing of when
the questions are presented are critical aspects of the study design but
are not discusses further.

## Simulation Activity Frequencies

The animal_caretakers’ activities are programmed to occur with the
following frequencies.

<table class="table lightable-material lightable-striped lightable-hover" style="margin-left: auto; margin-right: auto; font-family: &quot;Source Sans Pro&quot;, helvetica, sans-serif; margin-left: auto; margin-right: auto;">
<caption>
List of possible activities for the animal_caretaker with assigned
frequencies to be used in simulations.
</caption>
<thead>
<tr>
<th style="text-align:left;">
Activity
</th>
<th style="text-align:right;">
Frequency
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
administrative work
</td>
<td style="text-align:right;">
0.10
</td>
</tr>
<tr>
<td style="text-align:left;">
animal care correspondence
</td>
<td style="text-align:right;">
0.01
</td>
</tr>
<tr>
<td style="text-align:left;">
animal care meeting
</td>
<td style="text-align:right;">
0.05
</td>
</tr>
<tr>
<td style="text-align:left;">
animal care record keeping
</td>
<td style="text-align:right;">
0.05
</td>
</tr>
<tr>
<td style="text-align:left;">
animal care record use
</td>
<td style="text-align:right;">
0.05
</td>
</tr>
<tr>
<td style="text-align:left;">
food preparation
</td>
<td style="text-align:right;">
0.15
</td>
</tr>
<tr>
<td style="text-align:left;">
gang cage animal feeding
</td>
<td style="text-align:right;">
0.20
</td>
</tr>
<tr>
<td style="text-align:left;">
gang caged animal inventory and health check
</td>
<td style="text-align:right;">
0.05
</td>
</tr>
<tr>
<td style="text-align:left;">
group animal transfer
</td>
<td style="text-align:right;">
0.05
</td>
</tr>
<tr>
<td style="text-align:left;">
individual animal feeding
</td>
<td style="text-align:right;">
0.05
</td>
</tr>
<tr>
<td style="text-align:left;">
individual animal transfer
</td>
<td style="text-align:right;">
0.01
</td>
</tr>
<tr>
<td style="text-align:left;">
individual cage cleaning
</td>
<td style="text-align:right;">
0.05
</td>
</tr>
<tr>
<td style="text-align:left;">
individual cage sanitation
</td>
<td style="text-align:right;">
0.05
</td>
</tr>
<tr>
<td style="text-align:left;">
individual caged animal inventory and health check
</td>
<td style="text-align:right;">
0.05
</td>
</tr>
<tr>
<td style="text-align:left;">
ordering of major equipment
</td>
<td style="text-align:right;">
0.01
</td>
</tr>
<tr>
<td style="text-align:left;">
ordering of supplies and minor equipment
</td>
<td style="text-align:right;">
0.01
</td>
</tr>
<tr>
<td style="text-align:left;">
personal time
</td>
<td style="text-align:right;">
0.05
</td>
</tr>
<tr>
<td style="text-align:left;">
other
</td>
<td style="text-align:right;">
0.01
</td>
</tr>
</tbody>
</table>

For clarity, we demonstrate one and three samples.

## Data Collection Example

A single sample: animal care meeting  
Three samples: food preparation, individual caged animal inventory and
health check, and animal care record use.

Lets see how precise our estimates would be if we included 20
animal_caretakers sampled just 5 times a month for each of 12 months.

Since the algorithm is not actually modeling individual
animal_caretakers, the order of sampling has no impact on results, which
means we simply take 1200 (20 \* 5 \* 12) samples per result set and
compare each to the expected values.

<table class="table lightable-material lightable-striped lightable-hover" style="margin-left: auto; margin-right: auto; font-family: &quot;Source Sans Pro&quot;, helvetica, sans-serif; margin-left: auto; margin-right: auto;">
<caption>
List of activities, the frequency in which they were observed, the
simulated frequency of the activity (expected), and the absolute
difference between the observed and expected frequencies.
</caption>
<thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1">
</th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3">

<div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">

Duration

</div>

</th>
</tr>
<tr>
<th style="text-align:left;">
Description
</th>
<th style="text-align:right;">
Observed
</th>
<th style="text-align:right;">
Expected
</th>
<th style="text-align:right;">
Delta
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
administrative work
</td>
<td style="text-align:right;">
0.098
</td>
<td style="text-align:right;">
0.10
</td>
<td style="text-align:right;">
0.002
</td>
</tr>
<tr>
<td style="text-align:left;">
animal care correspondence
</td>
<td style="text-align:right;">
0.012
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.002
</td>
</tr>
<tr>
<td style="text-align:left;">
animal care meeting
</td>
<td style="text-align:right;">
0.049
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.001
</td>
</tr>
<tr>
<td style="text-align:left;">
animal care record keeping
</td>
<td style="text-align:right;">
0.038
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.013
</td>
</tr>
<tr>
<td style="text-align:left;">
animal care record use
</td>
<td style="text-align:right;">
0.046
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.004
</td>
</tr>
<tr>
<td style="text-align:left;">
food preparation
</td>
<td style="text-align:right;">
0.140
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:right;">
0.010
</td>
</tr>
<tr>
<td style="text-align:left;">
gang cage animal feeding
</td>
<td style="text-align:right;">
0.216
</td>
<td style="text-align:right;">
0.20
</td>
<td style="text-align:right;">
0.016
</td>
</tr>
<tr>
<td style="text-align:left;">
gang caged animal inventory and health check
</td>
<td style="text-align:right;">
0.053
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.003
</td>
</tr>
<tr>
<td style="text-align:left;">
group animal transfer
</td>
<td style="text-align:right;">
0.049
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.001
</td>
</tr>
<tr>
<td style="text-align:left;">
individual animal feeding
</td>
<td style="text-align:right;">
0.045
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.005
</td>
</tr>
<tr>
<td style="text-align:left;">
individual animal transfer
</td>
<td style="text-align:right;">
0.013
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.003
</td>
</tr>
<tr>
<td style="text-align:left;">
individual cage cleaning
</td>
<td style="text-align:right;">
0.054
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.004
</td>
</tr>
<tr>
<td style="text-align:left;">
individual cage sanitation
</td>
<td style="text-align:right;">
0.048
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.003
</td>
</tr>
<tr>
<td style="text-align:left;">
individual caged animal inventory and health check
</td>
<td style="text-align:right;">
0.053
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.003
</td>
</tr>
<tr>
<td style="text-align:left;">
ordering of major equipment
</td>
<td style="text-align:right;">
0.009
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.001
</td>
</tr>
<tr>
<td style="text-align:left;">
ordering of supplies and minor equipment
</td>
<td style="text-align:right;">
0.007
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.003
</td>
</tr>
<tr>
<td style="text-align:left;">
other
</td>
<td style="text-align:right;">
0.013
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.003
</td>
</tr>
<tr>
<td style="text-align:left;">
personal time
</td>
<td style="text-align:right;">
0.056
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.006
</td>
</tr>
</tbody>
</table>

We can estimate the duration in minutes on each activity if we allocate
the 1200 observations into one 8 hour day which has 560 minutes.

<table class="table lightable-material lightable-striped lightable-hover" style="margin-left: auto; margin-right: auto; font-family: &quot;Source Sans Pro&quot;, helvetica, sans-serif; margin-left: auto; margin-right: auto;">
<caption>
List of activities and the estimated number of minutes spent on the
activity if represented in a single day.
</caption>
<thead>
<tr>
<th style="text-align:left;">
Description
</th>
<th style="text-align:right;">
Minutes
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
administrative work
</td>
<td style="text-align:right;">
55.1
</td>
</tr>
<tr>
<td style="text-align:left;">
animal care correspondence
</td>
<td style="text-align:right;">
6.5
</td>
</tr>
<tr>
<td style="text-align:left;">
animal care meeting
</td>
<td style="text-align:right;">
27.5
</td>
</tr>
<tr>
<td style="text-align:left;">
animal care record keeping
</td>
<td style="text-align:right;">
21.0
</td>
</tr>
<tr>
<td style="text-align:left;">
animal care record use
</td>
<td style="text-align:right;">
25.7
</td>
</tr>
<tr>
<td style="text-align:left;">
food preparation
</td>
<td style="text-align:right;">
78.4
</td>
</tr>
<tr>
<td style="text-align:left;">
gang cage animal feeding
</td>
<td style="text-align:right;">
120.9
</td>
</tr>
<tr>
<td style="text-align:left;">
gang caged animal inventory and health check
</td>
<td style="text-align:right;">
29.9
</td>
</tr>
<tr>
<td style="text-align:left;">
group animal transfer
</td>
<td style="text-align:right;">
27.5
</td>
</tr>
<tr>
<td style="text-align:left;">
individual animal feeding
</td>
<td style="text-align:right;">
25.2
</td>
</tr>
<tr>
<td style="text-align:left;">
individual animal transfer
</td>
<td style="text-align:right;">
7.5
</td>
</tr>
<tr>
<td style="text-align:left;">
individual cage cleaning
</td>
<td style="text-align:right;">
30.3
</td>
</tr>
<tr>
<td style="text-align:left;">
individual cage sanitation
</td>
<td style="text-align:right;">
26.6
</td>
</tr>
<tr>
<td style="text-align:left;">
individual caged animal inventory and health check
</td>
<td style="text-align:right;">
29.9
</td>
</tr>
<tr>
<td style="text-align:left;">
ordering of major equipment
</td>
<td style="text-align:right;">
5.1
</td>
</tr>
<tr>
<td style="text-align:left;">
ordering of supplies and minor equipment
</td>
<td style="text-align:right;">
4.2
</td>
</tr>
<tr>
<td style="text-align:left;">
other
</td>
<td style="text-align:right;">
7.5
</td>
</tr>
<tr>
<td style="text-align:left;">
personal time
</td>
<td style="text-align:right;">
31.3
</td>
</tr>
</tbody>
</table>

I have run this experiment several times and usually the estimates are
shown to be very close as in seen in the *Delta* column (within about 1
percent). However, it is more instructive to simulation this experiment
many times to learn what precision we can expect.

<!-- We will start by putting the simulation into a function. 
-->

## Results

Figure @ref(fig:hist-1X) shows a histogram plot of the results of
repeating the simulation of 20 animal caretakers providing 5 responses
in each of the 12 months of a year 5000 times. Similarly, Figure
@ref(fig:hist-2X) shows a histogram plot of the similar simulation with
40 animal caretakers instead of 20.

![Simulation of 5,000 iterations with 20 animal caretakers found 16% of
durations were greater than 2 percent away from the expected value and
1.12% of durations were greater than 3 percent away from the expected
value with the largest absolute delta value being
0.045.](README-hist-1X-1.png)

![Simulation of 5,000 iterations with 40 animal caretakers found 2.02%
of durations were greater than 2 percent away from the expected value
and 0% of durations were greater than 3 percent away from the expected
value with the largest absolute delta value being
0.028.](README-hist-2X-1.png)

## Conclusions

Prior experiments with this cross-sectional activity time estimation
have shown that about 250 samples will provide time estimates for up to
20 activities that are all accurate and precise within  ± 2 percent,
which should be precise enough for most management activities. I do not
think any amount of sampling using actor logs can be that accurate
because of inherent cognative bias introduced by the actors’ own
expectations.

## Appendix

### github.com Installation

The current development version can be intalled from GitHub.
[github.com/rmsharp/crosssectiontimer](https://github.com/rmsharp/crosssectiontimer)
as all of the dependencies are automatically installed.

You can install **crosssectiontimer** from github with:

All missing dependencies should be automatically installed except for
those found in rmsutilityr, which is available at my github account.

You can install **rmsutilityr** from github with:

Find online documentation at
[https://rmsharp.github.io/rmsutilityr/](https://rmsharp.github.io/crosssectiontimer/).

See the setup code chunk of this vignette to see how to customize this
document to examine results you can expect from your own time on task
activity analysis. You will need to provide the CSV file[4] with your
own actors[5], activities, and activity descriptions in addition to
providing your definitions for the setup chunk definitions indicated
below.

``` r
activity_file <- 
  system.file("extdata",
              "colony_management_defined_activities.csv", 
              package = "crosssectiontimer", lib.loc = NULL, 
              mustWork = FALSE)
value_stream_descriptor <- stri_c("the husbandry and veterinary care of ",
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

[1] animal_caretaker and veterinary_tech

[2] We expect that some actors will work on more than one value stream
and all will have additional responsibilities. Thus, some activities
recorded are intentionally defined as various unrelated activities.
Planning how much detail to collect and how the data will be analyzed
should occur prior to any data being collected.

[3]  The software is has the ability to examine multiple job types, job
specific activity lists, and corresponding expected frequencies.

[4] Comparable to colony_management_defined_activities.csv

[5] Actors are used as variable names so must follow rules for naming
variables in R. They must start with a letter, contain only letters,
numerals, “.”, and “\_“.
