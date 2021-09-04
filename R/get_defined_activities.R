#' Get valid activities
#'
#' @returns a character vector of recognizable activity classes
#'
#' @export
get_defined_activities <- function() {
  data.frame(
    actor_type =
      c("developer", "developer", "developer", "developer", "developer",
        "developer", "developer", "developer", "developer", "developer",
        "developer", "developer", "developer", "developer", "developer",
        "developer", "developer", "developer", "developer", "developer",
        "developer","implementer", "implementer", "implementer", "implementer",
        "implementer", "implementer", "implementer", "implementer", "implementer",
        "implementer", "implementer", "implementer"),
    action =
      c("data discovery", # associated with finding data resources
        "data analysis", # exploratory data analysis and artifact creation
        "data marshalling", # development data set assembly
        "data transformation", # transformation and feature creation
        "model selection", # selection of model form including initail testing
        "model training", # training and creation of evidence
        "model testing", # sensitivity, scenario, boundary, back testing,
        # benchmarking, goodness of fit, etc.
        "output coding", # scoring, output creation,
        "metric coding", # coding to create and store ongoing monitoring metrics
        "ongoing monitoring coding", # coding ongoing monitoring scripts
        "literature research", # modeling techques study and analysis
        "communication with integrators", # meetings, emails, chats, etc.
        "communication with business partners", # meetings, emails, chats, etc.
        "peer review", # code reviews, peer discussions of problem space
        "narrative writing", # writing aspects only, does not include formatting
        "model description formatting",
        "ongoing monitoring report formatting", # model description
        "administrative tasks", # not directly related to modeling; including
        # general training, communications, etc.
        "training", # any educational training related to modeling
        "personal activities", # not work related
        "other", # not otherwise represented
        "algorithm recoding",
        "logging code",
        "adding defensive code",
        "integration",
        "integration testing",
        "component testing",
        "communication with developers", # meetings, emails, chats, etc.
        "communication with business partners", # meetings, emails, chats, etc.
        "peer review", # code reviews, peer discussions of problem space
        "narrative writing", # writing aspects only, does not include formatting
        "ongoing monitoring report formatting", # model description
        "other" # not otherwise represented
      ),
    description =
      c("dassociated with finding data resources",
        "exploratory data analysis and artifact creation",
        "development data set assembly",
        "transformation and feature creation",
        "selection of model form including initail testing",
        "training and creation of evidence",
        paste0("sensitivity, scenario, boundary, back testing, benchmarking, ",
               "goodness of fit, etc."),
        "scoring, output creation",
        "coding to create and store ongoing monitoring metrics",
        "coding ongoing monitoring scripts",
        "modeling techques study and analysis",
        "meetings, emails, chats, etc.",
        "meetings, emails, chats, etc.",
        "code reviews, peer discussions of problem space",
        "narrative writeing aspects only, does not include formatting",
        "model description formatting",
        "ongoing monitoring report formatting",
        paste0("administrative tasks not directly related to modeling; ",
              "including general training, communications, etc."),
        "educational training related to modeling",
        "personal activities not work related",
        "not otherwise represented",
        "algorithm recoding",
        "logging code",
        "adding defensive code",
        "integration",
        "integration testing",
        "component testing",
        "communication with developers", # meetings, emails, chats, etc.
        "communication with business partners", # meetings, emails, chats, etc.
        "peer review", # code reviews, peer discussions of problem space
        "narrative writing", # writing aspects only, does not include formatting
        "ongoing monitoring report formatting", # model description
        "other" # not otherwise represented
      )
  )
}
