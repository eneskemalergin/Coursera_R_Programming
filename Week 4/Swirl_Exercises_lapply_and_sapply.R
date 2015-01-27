## Swirl Exercises lapply and sapply

## lapply and sapply are two most important members of R, loop functions.
"""
Each of the *apply functions will SPLIT up some data into smaller pieces,
APPLY a function to each piece, then COMBINE the results. 
"""
## The data has been stored in flags.
head(flags)

## Checks out the dimensions
dim(flags)
# [1] 194 30
## There are 194 rows or observations and 30 columns or variables

## We would like to know in what format the variables have been stored.
## What is the class of each variable?
class(flags) ## Only tells that entire dataset is stored as a data.frame
# [1] "data.frame"

## We want to call class() function for each column and row, sound like we need loop

"""
The lapply() function takes a list as input, applies a function to each
 element of the list, then returns a list of the same length as the original
 one. Since a data frame is really just a list of vectors (you can see this
 with as.list(flags)), we can use lapply() to apply the class() function to
 each column of the flags dataset. Let's see it in action!
"""

## apply the class() function to each column of the flags dataset and store the result in variable
cls_list <- lapply(flags, class)
cls_list

## l in lapply stands for list.

## showst which type is our variable now. 
class(cls_list)
# [1] "list"

as.character(cls_list)
#  [1] "factor"  "integer" "integer" "integer" "integer" "integer" "integer"
# [8] "integer" "integer" "integer" "integer" "integer" "integer" "integer"
# [15] "integer" "integer" "integer" "factor"  "integer" "integer" "integer"
# [22] "integer" "integer" "integer" "integer" "integer" "integer" "integer"
# [29] "factor"  "factor" 

## sapply allows you to automate this process by calling lapply() behind the scenes

cls_vect <-  sapply(flags, class)
class(cls_vect)
# [1] "character"

sum(flags$orange)
# [1] 26

flag_colors <- flags[, 11:17]
head(flag_colors)

lapply(flag_colors, sum)
# $red
# [1] 153
# 
# $green
# [1] 91
#
# $blue
# [1] 99
#
# $gold
# [1] 91
#
# $white
# [1] 146
#
# $black
# [1] 52
#
# $orange
# [1] 26

sapply(flag_colors, sum)
# red  green   blue   gold  white  black orange 
# 153     91     99     91    146     52     26 

sapply(flag_colors, mean)
#       red     green      blue      gold     white     black    orange 
# 0.7886598 0.4690722 0.5103093 0.4690722 0.7525773 0.2680412 0.1340206 

flag_shapes <- flags[, 19:23]
lapply(flag_shapes, range)
# $circles
# [1] 0 4
#
# $crosses
# [1] 0 2
#
# $saltires
# [1] 0 1
#
# $quarters
# [1] 0 4
# 
# $sunstars
# [1]  0 50

shape_mat <- sapply(flag_shapes, range)
shape_mat
#      circles crosses saltires quarters sunstars
# [1,]       0       0        0        0        0
# [2,]       4       2        1        4       50

class(shape_mat)
# [1] "matrix"


unique_vals <- lapply(flags,unique)
unique_vals

sapply(unique_vals, length)

sapply(flags, unique)

## return a list containing  the second item from each element of the unique_vals list
lapply(unique_vals, function(elem) elem[2])

