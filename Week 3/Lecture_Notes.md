# R Programming Week 3

---

## Loop Functions
Loop functions are very powerful tool especially for interactive tools of R. The loops that we have learned; which are for and while are very good but they are not compact enough, Loop functions are...

### Looping on the command line
Writing for, while loops is useful when programming but not particularly easy when working with interactively on the command line. There are some functions which implement looping to make life easier.

* lapply: Loop over a list and evaluate a function on each element
* sapply: Same as lapply but try to simplify the result
* apply : Apply a function over the margins of an array
* tapply: Apply a function over subsets of a vector
* mapply: Multivariable version of lapply

An auxiliary function split is also useful, particularly in conjunction with lapply.

### lapply
Takes three arguments;
 - a list x
 - a function (or the name of the function)
 - other arguments via its ... argument 

If x is not a list, it will be coercced to a list using as.list
```R
lapply
# function (X, FUN, ...) 
# {
#     FUN <- match.fun(FUN)
#     if (!is.vector(X) || is.object(X)) 
#         X <- as.list(X)
#     .Internal(lapply(X, FUN))
# }
# <bytecode: 0x0000000007c7b6d8>
# <environment: namespace:base>
```
lapply always returns a list, regardless of the class of the input.
```R
# Make a list of 2
x <- list(a = 1:5, b = rnorm(10)) # a 1 to 5, b 10 random N.numbers
# Take the list and applying th mean function to each of these element
lapply(x, mean)
# $a
# [1] 3
# 
# $b
# [1] 0.06146822
```
Slightly more complicated list:
```R
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100, 5))
lapply(x, mean)
# $a
# [1] 2.5
# 
# $b
# [1] 0.01380397
# 
# $c
# [1] 1.110247
# 
# $d
# [1] 4.951427
```
another usage of lapply
```R
x <- 1:4
lapply(x, runif) # generates a random numbers
## For 1 it created 1 random
## For 2 it created 2 random, and so on...
# [[1]]
# [1] 0.5944612
# 
# [[2]]
# [1] 0.5267196 0.2669556
#
# [[3]]
# [1] 0.6998362 0.9077400 0.3378887
# 
# [[4]]
# [1] 0.3043625 0.6250324 0.2934308 0.9248927
```
If we want to generate uniform random between 1 and 10 :
```R
x <- 1:4
lapply(x, runif, min = 0, max = 10)
# [[1]]
# [1] 7.514721
#
# [[2]]
# [1] 3.055706 7.238181
#
# [[3]]
# [1] 7.552798 2.982917 2.788927
#
# [[4]]
# [1] 3.589660 6.592506 6.380586 9.538421
```
lapply and friends like lapply make heavy use of anonymous functions, which means functions without any names.
```R
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
# $a
#      [,1] [,2]
# [1,]    1    3
# [2,]    2    4
#
# $b
#      [,1] [,2]
# [1,]    1    4
# [2,]    2    5
# [3,]    3    6
```
If we want to extract the first column from each matrices.
An anonymous function for extracting the first comlumn of each matrix
```R
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
lapply(x, function(elt) elt[,1])
# $a
# [1] 1 2
#
# $b
# [1] 1 2 3
```
Function inside of the lapply is not exactly exists after lapply is done of it's work, function goes away. It is way we called them anonymous functions

### sapply
sapply will try to simplify the result of lapply if possible

* If the result is a list where every element is length 1, then a vector is returned
* If the result is a list where every element is a vector of the same length ( > 1), a matrix is returned
* If it can't figure things out, a list returned.

```R
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100, 5))
lapply(x, mean)
# $a
# [1] 2.5
# 
# $b
# [1] 0.01380397
# 
# $c
# [1] 1.110247
# 
# $d
# [1] 4.951427

## Or instead we could use sapply
sapply(x, mean)
#         a         b         c         d 
# 2.5000000 0.2428402 0.8357302 4.9501217
```
If we directly apply ``` mean(x) ```   it won't work because we cannot directly apply mean function into the lists.