## Quiz 3 - Scripts

library(datasets)
data(iris)
?iris
iris
mean(iris$Sepal.Length)
# OR

apply(iris[, 1:4], 1, mean)

data(mtcars)
mtcars

sapply(split(mtcars$mpg, mtcars$cyl), mean)


debug(ls)
ls()
