
# This function takes a matrix and print mean of each column

column_mean <-function(x){
    nc <- ncol(x) # Stores the number of columns
    means <- numeric(nc)
    for(i in 1:nc){
      means[i] <- mean(x[, i])
    }    
    means
}

# column_mean(airquality) could be used.
# but if we want to remove NAs

column_mean <-function(x, removeNA = T){
    nc <- ncol(x) # Stores the number of columns
    means <- numeric(nc)
    for(i in 1:nc){
          means[i] <- mean(x[, i], na.rm = removeNA)
    }    
    means
}

#column_mean(airquality, FALSE) NA values will be come back...