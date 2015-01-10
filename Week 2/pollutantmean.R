
list.files("specdata")
# I have 332 file in specdata folder.

setwd("c:/Users/Pc-41/Documents/ENES/Lessons/Online Classes/Data Science Track by John Hopkins University/2-R programming/Github Repo/week 2")

one <- read.csv("specdata/001.csv")
head(one)
#         Date sulfate nitrate ID
# 1 2003-01-01      NA      NA  1
# 2 2003-01-02      NA      NA  1
# 3 2003-01-03      NA      NA  1
# 4 2003-01-04      NA      NA  1
# 5 2003-01-05      NA      NA  1
# 6 2003-01-06      NA      NA  1

# I should put all ID together...
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  # set working directory
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  # initialize a vector to hold the pollutant data
  mean_data <- c()
  
  # find all files in the specdata folder
  
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  
  for(i in id) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    head(current_file)
    pollutant
    na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant]
    mean_data <- c(mean_data, na_removed)
  }
  result <- mean(mean_data)
  return(round(result, 3))
}

# Test 1
pollutantmean("specdata", "sulfate", 1:10) == 4.064
# Test 2
pollutantmean("specdata", "nitrate", 70:72) == 1.706
# Test 3
pollutantmean("specdata", "nitrate", 23) == 1.281