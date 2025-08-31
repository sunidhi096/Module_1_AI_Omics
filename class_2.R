
classify_gene <- function(logFC, padj) {
  if (logFC > 1 & padj < 0.05) {
    return("Upregulated")
  } else if (logFC < -1 & padj < 0.05) {
    return("Downregulated")
  } else {
    return("Not_Significant")
  }
}

input_dir <- "Raw_Data"
output_dir <- "Results"


if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}


deg_files <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv")


deg_results <- list()


for (file_name in deg_files) {
  cat("\nProcessing:", file_name, "\n")
  
 
  input_file_path <- file.path(input_dir, file_name)
  data <- read.csv(input_file_path, header = TRUE)
  
  
  data$padj[is.na(data$padj)] <- 1
  
  
  data$status <- mapply(classify_gene, data$logFC, data$padj)
  

  output_file_path <- file.path(output_dir, paste0("Processed_", file_name))
  write.csv(data, output_file_path, row.names = FALSE)
  

  cat("Summary for", file_name, ":\n")
  print(table(data$status))
  

  deg_results[[file_name]] <- data
}

deg1_results <- deg_results[[1]]
deg2_results <- deg_results[[2]]

