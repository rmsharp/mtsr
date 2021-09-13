#' Get valid activities
#'
#' @returns a data.frame with columns of \code{actor_type}, \code{activity},
#' \code{description}, and \code{freq}.
#' @param file the name of the file which the data are to be read from.
#' Each row of the table appears as one line of the file. If it does not
#' contain an absolute path, the file name is relative to the current working
#' directory, getwd(). Tilde-expansion is performed where supported. This can
#' be a compressed file (see file).
#'
#' Alternatively, file can be a readable text-mode connection (which will be
#' opened for reading if necessary, and if so closed (and hence destroyed) at
#' the end of the function call). (If stdin() is used, the prompts for lines
#' may be somewhat confusing. Terminate input with a blank line or an EOF
#' signal, Ctrl-D on Unix and Ctrl-Z on Windows. Any pushback on stdin() will
#' be cleared before return.)
#'
#' file can also be a complete URL. (For the supported URL schemes, see the
#' ‘URLs’ section of the help for url.)
#'
#' @importFrom utils read.csv
#' @export
get_defined_activities <- function(file) {
  read.csv(file = file)
}
