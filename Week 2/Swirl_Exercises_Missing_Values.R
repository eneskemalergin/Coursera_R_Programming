# Swirl Exercises Missing Values

library("swirl")
swirl()

# Missing values often must not be ignored and analyze carefully,

# In R NA, is used to represent any value not available or missing

# Any operation with NA generally yields to NA.

x <- c(44, NA, 5, NA)
x * 3
# [1] 132 NA 15 NA
# Elements with values NA will also cause NA's

# Create a vector containing 1000 draws from a standart normal dist. 
y <- rnorm(1000)

# Create a vector containing 1000 NAs with 
z <- rep(NA, 1000)

# selects 100 elements ad random from 2000 values(combined y and z)
my_data <- sample(c(y,z), 100)

# Shows where are the NA values in our data
my_na <- is.na(my_data)

my_na # when you see TRUE value means we have a NA value.

# another way to show the NA values
my_data == NA 
# It resulted all values NA

# Counts the number NAs in the data.
sum(my_na)

# Shows the data that I have
my_data

# Gives a NaN answer which means not a number
0/0

# Also gives an NaN answer...
Inf - Inf
