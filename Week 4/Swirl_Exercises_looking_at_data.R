## Swirl Exercises Looking at Data

# Whenever we work with dataset we need to first look at the data.

## plants data: (http://plants.usda.gov/adv_search.html)

ls() # checks the variables in your workspace.

class(plants)
# [1] "data.frame"

## read.csv(), read.table() are R function 

## Since the dataset is stored in data frame, we know it is rectangular.
## It has dimensions

dim(plants) # to see exactly how many rows and columns 
# [1] 5166 10

## 5166 is the number of rows (observations)
## 10 is the number of columns (variables)

nrow(plants) # Also see the number of rows

ncol(plants) # Also see the number of columns

## If you are wondering how much space the dataset is occupying in memory

object.size(plants) # Show the size of the data.frame's size

names(plants) # Return a character vector of column names

head(plants) # function allows you to preview the top of the dataset.
## shows you the first six rows of the data. 

head(plants, 10) # If you would like to preview the first 10 rows of plants :

tail(plants, 15) # tail uses the same principle 

## if you noticed there are a lot of NAs in the data. (missing values)

summary(plants) # summary() provides different output for each variable. 

# Shows the structure of the data.frame
str(plants)

