# R Programming Week 2

## Control Strunctures
### Starting
Control structures allow you to control the R functionality
Basic COntrol Strunctures:
* if, else: Testing a condition
* for: execute a loop a fixed number of times
* while: execute a loop while a condition is true
* repeat: execute an infinite loop
* break: break the execution loop
* next: skip an interation of a loop
* return exit a function

Most Control structures are not used in interactive sessions, these are typically the things when you program an R program or new packages.
### If-else
```R
# Basic Syntax
if(condition){
  ## Do something
} else{
  ## Do something else
}
if(condition1){
  ## Do something
}else if (condition2){
  ## Do something different
}else{
  ## Do something different
}
```
Else part is optional, you can just have if to contol a condition, but if you would like to put two conditon you use if and else.

This is valid condition
```R
if(x > 3){
  y <- 10
}else{
  y <- 0
}
```
so is this one. 
```R
y <- if(x > 3){
    10
}else{
    0
}
```

### For loop
For loop take an interator variable and assign it successive values from a sequence or vector. For loops are the most common type of iteration

```R 
for(i in 1:10){
  print(i)
}
```
Example above takes the i variable and in each iteration of the loop gives it values 1,2,3,4,5....,10 then exits.
When the loop exits/finishes, it goes to next line/block of code.

3 different type of for loop evaluates the same result
```R 
x <- c("a", "b", "c", "d")
# Type 1
for(i in 1:4){
    print(x[i])
}
# Type 2
for(i in seq_along(x)){
    print(x[i])
}
# Type 3
for(letter in x){
    print(letter)
}
# Its just another way to write type 1 loop 
for(i in 1:4) print(x[i])
```
#### Nested for loops
For loops can be nested
```R
x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))){ # seq_len returns length
    for(j in seq_len(ncol(x))){
        print(x[i,j])
    }
}
```
Nesting could be pretty complicated, Careful beyond 2-3 levels. They often pretty difficult to read/understand

### While loops
While loops begin by testing a conditio. If it is true, then they execute the loop body. Once the loop body is executed, the condition is tested again, and so forth.

```R
count <- 0
while(count < 10){
    print(count)
    count <- count + 1
}
```
We have to be more careful on while loops because they can potentially result in infinite loops if not written properly. Use with care!

You can test multiple conditions in while loop like;
```R
z <- 5 
while(z >= 3 && z <= 10){
    print(z)
    coin <- rbinom(1,1,0.5)
    
    if(coin == 1){  ## Randomizing
        z <- z + 1 
    }else{
      z < z - 1
    }
}
# Z values go up-down until it evaluates the less than 3 or bigger than 10...
```
Executions are always evaluated from left to right

### Repeat
Repeat initiates an infinite loop; these are not commonly used in statistical applications but they do have their uses. The only way to exit a repeat loop is to call break.

It is not commonly use is but there are some ways that could be useful sometime 
```R
x0 <- 1
tol <- 1e-8
repeat{
    x1 <-computeEstimate() # is not a real function
    if(abs(x1-x0) < tol){
        break
    }else{
        x0 <- x1
    }
}
```
This is very oftenly algorithm template used in estimation and optimization algorithms.

The example above is bit dangerous because there's no guarantee it will stop. Better to set a hard limit on the number of iterations and then report whether converge was archived or not.

 ### next, return
 next is used to skip an iteration of a loop
```R
for(i in 1:100){
    if(i <= 20){
      ## Skip the first 20 iterations
      next
    }
    ## Do something here
} 
```
return signals that a function should exit and return a given value.

### Summary
* COntrol structures like if, while, and for allow you to control the flow of an R program
* Infinite loops should generally be avoided, even if they are theoretically correct.
* Control structures mentioned here are primarily useful for writing  programs; for command-line interactive work, the *apply functions are more useful.

## Functions
Functions are  created sing the function() directiove and are stored as R objects just like anything else. In particular, they are R objects of class "function".

Here is a function syntax:
```R
f <- function(<arguments>){
    ## Do something
}
```
Functions in R are "First class objects", which means that they can be treated much like any other R object. Importantly,
* Functions can be passed as argument to other functions
* Functions can be nested, so that you can define a function inside of another function. The return value of a function is the last expression in the function body to be evaluated.

### Function Arguments
Functions have named arguments which potentially have default values.
* The formal arguments are the arguments included in the function definition
* The formals functions returns a list of all the formal arguments of a function
* Not every function call in R makes use of all the formal arguments
* Function arguments can be missing or might have default values

### Argument Matching 
R functions arguments can be matched positionally or by name. So the following calls to sd are all equivalent

```R
mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata)
```
Even though it's legal, I don'r recommend messing around with the order of the arguments too much, since it can lead some confusion.


You can mix positional matching by name. When an argument is matched by name, it is "taken out" of the argument list and the remaining unnamed arguments are matched in the order that they are listed in the function definition.

### Defining a Function

```R
f <- function(a, b = 1, c = 2, d = NULL){

}
```
In addition to not specifying a default value, you can  also set an argument value to NULL.

### Lazy Evaluation
Arguments to function are evaluated lazily, so they are evaluated only as needed.
```R
f <- function(a,b){
    a^2
}
f(2)
# 4
```
This function never actually uses the argument b, so calling f(2) will not produce an error because the 2 get positionally matched to a.

```R 
f <- function(a,b){
    print (a)
    print (b)
}
f(45)
# [1] 45
# Error: argument "b" is missing, with no default.
```
45 got printed, when the we go to print(b) error occured.

### The "..." Argument
The ... argument indicate a variable number of arguments that are usually passed on to other functions.
* ... is often used when extending another function an you don't want to copy the entire argument list of the original function.

```R
myplot <- function(x,y, type = "l", ...){
      plot(x,y, type = type, ...)
}
```
* Generic functions use ... so that extra arguments can be passed to methods


The ... argument is also necessary when the number of arguments passes to the function cannot be known in advance

```R
args(paste)
# function(..., sep = " ", collapse = NULL)

args(cat)
# function(..., file = " ", sep = " ", fill = FALSE)
      labels = NULL, append = FALSE
```


## Scoping Rules
### A Diversion on Binding Values to Symbol
How does R know which value to assign to which symbol? When I type
```R
lm <- function(x) {x * x}
lm
# function(x) {x * x}
```
how does R know what value to assign to the symbol lm? Why doesn't it give it the value of lm that is in the stats package?
  
When R tries to bind a value to a symbol,it searches through a series of environments to find the appropriate value. When you are working on the command line and need to retrieve the value of an R object, the order is roughly 
1.  Search the glbal environment for a symbol name matching the one requested.
2.  Search the namespaces of each of the packages on the __search__ list
```R
search()
#  [1] ".GlobalEnv"        "tools:rstudio"     "package:stats"    
#  [4] "package:graphics"  "package:grDevices" "package:utils"    
#  [7] "package:datasets"  "package:methods"   "Autoloads"        
# [10] "package:base"    
```
They are all packages that are now available in R.

### Binding Values to Symbol
* The global environment or the user's workspace is always the first element of the search list and the base package is always the last.
* The order of the packages on the search lost matters!
* User's can configure which packages gegt loaded on startup so you cannont assume that there will be a set list of packages available.
* When a user loads a package with library the namespace of that package gets put in position 2 of the search list(by default) and everything else get shifted down the list.
* Note that R has separate namespaces for functions and non-functions so it's possible to have an object named c and a function named c.

### Scoping Rules
The scoping rules R are the main feature that make is different from the original S language.
* The scoping rule determine how a value is associated with a free variable in a function
* R uses lexical scoping or static scoping. A common alterantive is dynamic scoping
* Related to the scoping rules is how R uses the search list to bind a value to a symbol
* Lexical scoping turns out to be particularly useful for simplifying statistical computations
### Lexical Scoping

```R
f <- function(x,y){
    x^2 + y / z
}
```
This function has 2 formal arguments x and y. In the body of the function there is another symbol z. In this case z is called a free variable. The scoping rule of a language determine how values are assigned to free variables. Free variables are not formal arguments and are not local variables

> (Not yet finished)