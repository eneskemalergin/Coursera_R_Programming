## Swirl Exercises Base Graphics

data(cars)
?cars
head(cars)

## R notes that the data frame you have given it has just two columns, so it assumes that you want to plot one column versus the other.
plot(cars)
## since we do not provide labels for either axis, R uses the names of the columns
## it creates axis tick marks at nice round numbers and labels them accordingly.
## it uses the other defaults supplied in plot()

## plot is short for scatterplot
?plot

plot(x = cars$speed, y = cars$dist)

plot(y = cars$speed, x = cars$dist)

plot(x = cars$speed, y = cars$dist, xlab = "Speed") # labelled

plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance")

plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance", xlab = "Speed")

plot(cars, main = "My Plot")

plot(cars, sub = "My Plot Subtitle")

plot(cars, col = 2)

plot(cars, xlim = c(10, 15))

plot(cars, pch = 2)

mtcars

data(mtcars)

?boxplot

boxplot(mpg~cyl, mtcars)

hist(mtcars$mpg)
