## Swirl Exercises Submitting Vectors

library("swirl")
swirl()

# swirl created a vector which contains  20 numbers and 20 NAs.
x

# If you want to reach a specific element in a vector (Which calls
# subsetting) you need to place a index vector

x[1:10] # Subsetting elements from beginning to index 10
# Realized! that in R index starts from 1

x[is.na(x)] # Gives all the NAs in the vector

y <- x[!is.na(x)] # Gives all except the NAs and store them in y

y # Now we got the usable data

y > 0 # Will give you a vector of logical values the same length as y,
# With TRUEs and FALSEs for negatives.

# But using following will give us the create a subset of positive 
y[y > 0]

# What if we try this expression at the beginning...
x[x > 0]
# Since NA is not a value we got them also...

# But we can simply combine the functions.
x[!is.na(x) & x > 0] # We combined our two requests.

x[c(3,5,7)] # If we want to select multiple different indexes we can 
# We can use c()  function
x[0]
# numeric(0)
x[3000]
# NA

# R does not prevent us from asking it. 
x[c(2, 10 )] # Gives us only 2nd and 10th element 
x[c(-2, -10)] # Gives all elements excepts 2nd and 10th
# OR
x[-c(2, 10)] # Also gives all elements excepts 2nd and 10th

vect <- c(foo = 11, bar = 2, norf = NA) # Creates a named vector
vect
names(vect) # Get the names
vect2 <- c(11, 2, NA) # Creates an unnamed vector.
names(vect2) <- c("foo", "bar", "norf") # then we can assign names on it
identical(vect, vect2) # Checks if those parameters are identical
vect["bar"]# works as an index
vect[c("foo", "bar")]
