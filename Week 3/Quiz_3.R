## Quiz 3 - Scripts

library(datasets)
data(iris)
?iris
iris

s <- split(iris, iris$Species)
lapply(s, function(x) colMeans(x[, c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")]))

apply(iris[, 1:4], 2, mean)

data(mtcars)
mtcars

with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$mpg, mtcars$cyl, mean)


with(mtcars, tapply(hp, cyl, mean))
tapply(mtcars$hp, mtcars$cyl, mean)

debug(ls)
ls()
