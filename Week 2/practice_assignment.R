# Practice Assignment by Derek Franks

# We need to download a data_set from following link:
# http://s3.amazonaws.com/practice_assignment/diet_data.zip

# We can do this manually or we can 
# Changes the working directory...
setwd("c:/Users/Pc-41/Documents/ENES/Lessons/Online Classes/Data Science Track by John Hopkins University/2-R programming/Github Repo/week 2")

getwd() # Checks where your current working directory.
# assigning url to variable making things easier.
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
# downloading a file using two parameters:
# url and  full name of the file.
download.file(dataset_url, "diet_data.zip")
# Unzipping the zip file. creates a file called and unzip in it.
unzip("diet_data.zip", exdir = "diet_data")

# Now we have a file called "diet_data"
list.files("diet_data")
# [1] "Andy.csv"  "David.csv" "John.csv"  "Mike.csv"  "Steve.csv"
# We have 5 files 
# Reads the file called Andy.csv and store it into the andy variable
andy <- read.csv("diet_data/Andy.csv")
head(andy)
#We have 4 columns in 
