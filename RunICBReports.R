# run batch reports of data source comparisons for each cardiac centre
# and save (copy) to Z drive

# library(quarto)
# library(here)

# codes of provider organisations
# orgname <- c("UHNM", "UHCW", "RWH", "UHB", "UHL", "NUH")
## org <- c("RJE", "RKB", "RL4", "RRK", "RWE", "RX1")

#me
ICB <- unique(MPI$ICB_Code_Registration)

### make report for each selected org_code 

# function to apply correct org/org name to each report, save out with param in filename
# run_report <- function(org, orgname) {
#   rmarkdown::render(
#     #    input = "scripts/centre_report_markdown.Rmd", 
#     input = here("scripts", "centre_report_flexdash.Rmd"),
#     output_file = here("reports", glue::glue("Cardiac recovery data comparison - ", orgname, ".html")),
#     #    output_format = "html_document",
#params = list(
#  org = org#,
  #orgname = orgname
)
#   )
# }

# me
#for(ICB_Code_Registration in unique(MPI$ICB_Code_Registration)){

#run_report <- function(ICB_Code_Registration) 
# {
#   rmarkdown::render(
#     input = here("ICBReport.Rmd"),
#     output_file = here(paste0("Report", ICB_Code_Registration, ".doc")),
#     params = list(ICB_Code_Registration = ICB_Code_Registration))
# }

run_report <- function(ICB) {
  rmarkdown::render(
    input = here("ICBReport.Rmd"),
    output_file = here(paste0("Report", ICB, ".doc")),
    su_theme(use_numbered_headings = TRUE)
    params = list(ICB = ICB))
}

purrr::map(unique(ICB),safely(run_report))
