# Assignment 1 Part 3 - corr.R

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations

corr <- function(directory, threshold = 0){
  
  # Set working directory
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  
  all_table <- complete("specdata", 1:332) # Uses a function we created earlier
  nobs <- all_table$nobs
  
  # Only returns the valid IDs
  ids <- all_table$id[nobs > threshold]
  
  length_id <-length(ids)
  corr_vector <- rep(0, length_id)
  
  # find all files in the specdata folder
  all_files <- as.character(list.files(directory))
  file_paths <- paste(directory, all_files, sep = "")

  initial <- 1
  for(i in ids){
    current_file <- read.csv(file_paths[i], header = TRUE, sep = ",")
    corr_vector[initial] <- cor(current_file$sulfate, current_file$nitrate, use = "complete.obs")
    
    initial <- initial + 1
  }
  
  result <- corr_vector
  return(result)
}
