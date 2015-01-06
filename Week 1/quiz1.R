## Quiz 1 - Scripts

x <- 1:4
y <-2
x+y 

# [1] 3 4 5 6

# to set all element of a vector that are less than 6 to be equal to zero
x <- c(3,5,1,10,12,6)
x[x < 6] <-0
x

# Reads the file in my folder and store all data in "data" variable
data <- read.csv("hw1_data.csv")
data ## shows the data

data[1:2,] ## Extracts the first 2 rows and prints them

data[152:153, ] ## Extracts the last 2 rows and prints them

# Ozone in the 47th row 
data[47,1] ## gets the 47th row and 1st column(Ozone column)

sum(is.na(data)) ## Finds all the NA values in the data
sum(is.na(data$Ozone)) ## Number of NA values in the Ozone column
sum(!is.na(data$Ozone)) ## Number of obs. excluded NAs

# na.rm=T tells R to remove missing values, if any
mean(data[,1], na.rm = T)

# Creates a subset with following condition
new_data <- subset(data, Ozone > 31 & Temp > 90) 
# Mean of second column for subset.
mean(new_data[,2])

Month_6 <- subset(data, Month == 6)
mean(Month_6[,4])
