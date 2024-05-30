print("Hello, World!")

file_name <- paste0("report_",Sys.Date(),".html")
writeLines("Hello, World!", file_name)