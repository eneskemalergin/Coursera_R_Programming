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
# We have 4 columns in 

# Let's look at how many row are there by looking at the length of one variable
length(andy$Age) # We have 30 rows

# Or we can look at the dimensions of the data.frame
dim(andy)
# [1] 30 4

str(andy) # shows the data frame values
# 'data.frame':  30 obs. of  4 variables:
# $ Patient.Name: Factor w/ 1 level "Andy": 1 1 1 1 1 1 1 1 1 1 ...
# $ Age         : int  30 30 30 30 30 30 30 30 30 30 ...
# $ Weight      : int  140 140 140 139 138 138 138 138 138 138 ...
# $ Day         : int  1 2 3 4 5 6 7 8 9 10 ...
summary(andy)
#  Patient.Name      Age         Weight           Day       
# Andy:30      Min.   :30   Min.   :135.0   Min.   : 1.00  
# 1st Qu.:30   1st Qu.:137.0   1st Qu.: 8.25  
# Median :30   Median :137.5   Median :15.50  
# Mean   :30   Mean   :137.3   Mean   :15.50  
# 3rd Qu.:30   3rd Qu.:138.0   3rd Qu.:22.75  
# Max.   :30   Max.   :140.0   Max.   :30.00
names(andy)
# [1] "Patient.Name" "Age"          "Weight"       "Day"         

# We can subset the data
andy[1,"Weight"] #Takes the first row of weight column / meaning that weight of the first day

andy[30, "Weight"] # Last day of the diet
# Alternatively
andy[which(andy$Day == 30), "Weight"]
andy[which(andy[,"Day"] == 30), "Weight"]
# or using subset() function
subset(andy$Weight, andy$Day==30)

# Let's assign Andy's starting and ending weight to vectors
andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]

# We can find how much weight he lost by substracting vectors:
andy_loss <- andy_start - andy_end
andy_loss


# But if we want to look at other subjects or maybe even everybody at once?
files <- list.files("diet_data")
files
# 'files' is now a list 
# We can call specific file using 
files[1]
files[2]
files[3:5]
head(read.csv(files[3]))
# It did not work what we can do about it?
# We should have the file path also full.names = TRUE will give us that.
files_full <- list.files("diet_data", full.names=TRUE)
files_full

head(read.csv(files_full[3]))
# Now it worked


# We can create one big data frame with everybody's data in it...
andy_david <- rbind(andy, read.csv(files_full[2]))
head(andy_david)
tail(andy_david)

"One thing to note, rbind needs 2 arguments. The first is an existing
data frame and the second is what you want to append to it.
This means that there are occassions when you might want to create
an empty data frame just so there's something to use as the existing
data frame in the rbind argument. "

# Let's create a subset of the data frame that shows us just the 25th day for Andy and David.
day_25 <- andy_david[which(andy_david$Day == 25), ]
day_25

dat <- data.frame()
for (i in 1:5) {
  dat <- rbind(dat, read.csv(files_full[i]))
}
str(dat)
# We have now a data frame called dat with all data combined. 
# 150 obs. and 4 variable


#So what if we wanted to know the median weight for all the data? Let's use the median() function.
median(dat$Weight)
# We got NA because we have some values NA in dat.
median(dat$Weight, na.rm = TRUE)
# 190 thats the result without NAs

# It filters the only 30th day of each data
dat_30 <- dat[which(dat[, "Day"] == 30),]
dat_30
median(dat_30$Weight)  # get the median of all

weightmedian <- function(directory, day)  {
  files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
  dat <- data.frame()                             #creates an empty data frame
  for (i in 1:5) {                                
      #loops through the files, rbinding them together 
      dat <- rbind(dat, read.csv(files_list[i]))
  }
  dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
  median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
  #while stripping out the NAs
}

# Test our function:
weightmedian(directory = "diet_data", day = 20)
weightmedian("diet_data", 4)
weightmedian("diet_data", 17)

