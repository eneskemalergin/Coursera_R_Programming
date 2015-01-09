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
