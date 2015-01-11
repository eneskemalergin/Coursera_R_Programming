# Swirl exercises Vectors'

library("swirl") # To open swirl()
swirl() # to start

# Create a numeric vector called num_vect that contains 0.5, 55, -10, 6
num_vect <- c(0.5, 55, -10, 6)

# Create variable called tf that gets the result of num_vect < 1, 
tf <- num_vect < 1 # only takes the values smaller than 1

tf # It prints the boolean truth values.
# [1] TRUE FALSE TRUE FALSE

# Type num_vect >= 6 without assigning the result to an new variable
num_vect >= 6
# [1] FALSE TRUE FALSE TRUE

"""The `<` and `>=` symbols in these examples are called 'logical
operators'. Other logical operators include `>`, `<=`, `==` for exact
equality, and `!=` for inequality."""

(3 > 5) & (4 == 4)
# FAlSE

(TRUE == TRUE) | (TRUE == FALSE)
# TRUE

((111 >= 111) | !(TRUE)) & ((4 + 1) == 5)
# TRUE

my_char <- c("My", "name", "is")
my_char # Right now we have vector lenght of 3
# We want to join them together
# It will create one big string 
paste(my_char, collapse = " ") # there must be a space between them...

# collapse  argument to the paste() function tellse R that when we 
# join together the elements of the my_char character vector, we'd like
# to separate them with single spaces

# To add or concatenate your name at the end of my_char, use c()
my_name <- c(my_char, "Kemal")

paste(my_name, collapse = " ")

# Statment below is concatenate two char with seperation of " "
paste("Hello", "world!", sep = " ") 

paste(1:3, c("X","Y","Z"), sep = "")
# [1] "1X" "2Y" "3Z"

# LETTERS is predefined variable in R containing a character vector of all
# 26 letters in English alphabet
paste(LETTERS, 1:4, sep = "-") 
#  [1] "A-1" "B-2" "C-3" "D-4" "E-1" "F-2" "G-3" "H-4" "I-1" "J-2" "K-3"
# [12] "L-4" "M-1" "N-2" "O-3" "P-4" "Q-1" "R-2" "S-3" "T-4" "U-1" "V-2"
# [23] "W-3" "X-4" "Y-1" "Z-2"
# Since first vector is longer than the second one second one repeats

