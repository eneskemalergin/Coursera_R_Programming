## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases

complete <- function(directory, id = 1:332){
  
  # set working directory
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  # I need the length of id vector
  length_id <- length(id)
  all_data <- rep(0, length_id)
  
  # find all files in the specdata folder
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  
  initial <- 1 
  for (i in id){
    current_file <- read.csv(file_paths[i], header = TRUE, sep = ",") # Comma seperated special
    all_data[initial] <- sum(complete.cases(current_file))
    initial <- initial + 1
  } 
  # Creates a data frame in the form as assignment asks.
  result <- data.frame(id = id, nobs = all_data)
  return(result)
}

# Test 1
complete("specdata", 1)
##  id nobs
## 1  1  117

# Test 2
complete("specdata", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96

# Test 3
complete("specdata", 30:25)
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463

# Test 4
complete("specdata", 3)
##   id nobs
## 1  3  243
