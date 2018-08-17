library("rmarkdown")
##library("shiny")

Rmd_template <- "method_verification_report.Rmd"
pdf_output <- "method_verification_report.pdf"

render_document <- function(analyte, file, recommendation) {
    rmarkdown::render(Rmd_template, params = list(analyte = analyte,
                                                  file = file,
                                                  recommendation = recommendation))
}

## render_query <- function() {
##     rmarkdown::render(Rmd_template, params = "ask")}

rename_document <- function(analyte){
    file.rename(from = pdf_output,
                to = paste0("../reports/", analyte, "_GSP_Method_Validation", ".pdf"))
}

create_report <- function(analyte, file, recommendation){
    render_document(analyte, file, recommendation)
    rename_document(analyte)
}

create_report(analyte = "TSH", file = "../data/TSH_GSP_validation.xls", recommendation = "acceptable")
create_report(analyte = "IRT", file = "../data/IRT_GSP_validation.xls", recommendation = "acceptable")
create_report(analyte = "N17P", file = "../data/N17P_GSP_validation.xls", recommendation = "acceptable")
