## Swirl Exercises Matrices and Data Frames

# They both represent 'rectangular' data types, which means 
# that they store tabular data, with rows and columns

# Only difference is that matrices can only contain a single class of data
# data frames can consist of many different classes of data

my_vector <- 1:20 # Creates a vector contains numbers from 1 to 20
my_vector
# dim() function gives you the dimensions of an object.
dim(my_vector)
# NULL

# dim(my_vector) resulted NULL because vectors dow not have a dim attr.
length(my_vector)

dim(my_vector) <- c(4, 5)
# dim() function allows you to get OR set the `dim` attribute for an R object
#  we assigned the value c(4, 5) to the `dim` attribute of my_vector

dim(my_vector)
attributes(my_vector)

# we just gave my_vector 4 rows and 5 columns.
# But it does not a vector anymore
my_vector
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    5    9   13   17
# [2,]    2    6   10   14   18
# [3,]    3    7   11   15   19
# [4,]    4    8   12   16   20
class(my_vector)
# [1] "matrix"

my_matrix <- my_vector
# matrix is simply a atomic vector with dim attribute
?matrix
my_matrix2 <- matrix(1:20, 4, 5)

## checks if they are identical or not!
identical(my_matrix, my_matrix2)
# [1] TRUE

patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix)# Combines columns
#      patients                       
# [1,] "Bill"   "1" "5" "9"  "13" "17"
# [2,] "Gina"   "2" "6" "10" "14" "18"
# [3,] "Kelly"  "3" "7" "11" "15" "19"
# [4,] "Sean"   "4" "8" "12" "16" "20"

## This is the way to include the names of our patients in the table 
## without destroying the integrity of our numeric data.
my_data <- data.frame(patients, my_matrix)
my_data
# patients X1 X2 X3 X4 X5
# 1     Bill  1  5  9 13 17
# 2     Gina  2  6 10 14 18
# 3    Kelly  3  7 11 15 19
# 4     Sean  4  8 12 16 20
class(my_data)
# [1] "data.frame"

cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames
my_data
#   patient age weight bp rating test
# 1    Bill   1      5  9     13   17
# 2    Gina   2      6 10     14   18
# 3   Kelly   3      7 11     15   19
# 4    Sean   4      8 12     16   20
