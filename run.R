# this script is triggered by the GitHub workflow

#create a file name
file_name <- paste0("report_",Sys.Date(),".html")

# generate the report
print("Generating report")
rmarkdown::render("report_markdown.Rmd",
                  output_file = file_name,
                  output_dir = "reports")

#copy the file to index.html
file.copy(paste0("reports/",file_name),"index.html",overwrite=T)
