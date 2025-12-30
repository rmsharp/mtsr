# use reticulate and pypdf to extract text from a PDF file in R
library(reticulate)
# Install pypdf if not already installed
if (!py_module_available("pypdf")) {
  py_install("pypdf")
}
# Import pypdf
pypdf <- import("pypdf")
# Function to extract text from a PDF file
PDF_to_text <- function(pdf_file) {
  # Create a PDF reader object
  pdf_reader <- pypdf$PdfReader(pdf_file)
  # Initialize an empty string to store the text
  text <- ""
  # Loop through each page and extract text
  for (i in seq_len(pdf_reader$numPages)) {
    page <- pdf_reader$getPage(i - 1)  # Pages are zero-indexed in pypdf
    text <- paste0(text, page$extract_text(), "\n")
  }
  return(text)
}
# Example usage
pdf_text <- PDF_to_text(file.path("Users", "rmsharp", "Documents", "Development", "R",
                                  "r_workspace", "mtsr", "inst", "papers",
                                  "jaba00022-0208.pdf"))

# cat(pdf_text)
# End of code
#
