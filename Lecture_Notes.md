# R Programming Week 1
======================

## Overview and History of R
* R is a dialiect of the S language

***
### What is S?
* S is a language that was developed by John Chambers and others at Bell Labs
* S originally implemented as Fortran libraries.
* Until version 3 language did not have functions for statistical modelling
* In 1988 the system was rewritten in C and becoming to be todays system.
* In 1998 version 4 is released which what we use today 

***
- R is an inmplementation of the S language

***
### Historical Notes
* In 1993 Bell labs gave StatSci license to develop and sell the R(now Insightful Corp.)
* In 2004 Insightful purchased the S $2 million
* In 2008 Insightful is acquired by TIBCO for $25 million
* The fundamentals of S has not changed since 1998
* In 1998, S won the ACM's Software System Award

***

### R History 
* 1991: Created in New Zealand by Ross Ihaka and Robert Gentleman. Their experience developing R is documented in 1996 JCGS paper
* 1993: First Announced public
* 1995: Martin Machler convinces the founder to make it GNU(General Public License)
* 1996: Public mailing list is created (R-help, R-devel)
* 1997: The RCore Group is formed 
* 2000: R version 1.0.0 
* 2013: R version 3.0.2 released on December 2013

***

### Features of R
* Syntax is very similar to S
* Semantics are superficially similar to S, in reality not quite
* Run almost any standart computing platform/OS(even on PlayStation3)
* Frequent releases; active development
* Quite lean, functionality is dividen into modular packages
* Graphics capabilities very sophisticated and better than most stat packages.
* Useful for interactive work, but contains a powerful programming language for developing new tools
* Very active and vibrant user commuity
* It's free!!!

***

### Drawbacks of R
* Essentially based on 40 year old tech
* Little built-in support for dynamic or 3-D graphics
* Functionality is based on consumer demand and user contribution
* Objects must generally be stored in pysical memory, but there have been advencements to deal with this too
* Not ideal for all possible situation (for all software packages, though)

***

### Design of the R System
The R System is divided in to 2 conceptual parts:
1. The "base" R system comes with the R automatically
2. Everything else

R functionality is divided into a number of packages:
* The "base" R system contains the fundamental functions
* The other packages in the "base" system include: utils, datasets, graphics, grDecvices, grid, methods, tools, parallel, compiler, splines, tcltk, stats4
* There are also "Recommended" packages: boot, class, cluster, codetools, foreign, KernSmooth, lattice, mgcv, nlme, rpart, survival, MASS, spatial, nnet, Matrix

There are more:
* There are about 4000 packages on CRAN 
* There are also many packages associated with the [Bioconductor](http://bioconductor.org) project
* People often make packages available on their personal website as well.

***

### Some Resources
In [CRAN](http://cran.r-project.org)
* An introduction to R
* Writing R Extensions
* R Data import/export
* R installation and administration
* R internals

***

### Some Useful Books on S/R
Standart Texts:
* Chambers (2008). Software for Data Analysis, Springer. (your textbook)
* Chambers (1998). Programming with Data, Springer.
* Venables & Ripley (2002). Modern Applied Statistics with S, Springer.
* Venables & Ripley (2000). S Programming, Springer.
* Pinheiro & Bates (2000). Mixed-Effects Models in S and S-PLUS, Springer.
* Murrell (2005). R Graphics, Chapman & Hall/CRC Press.

Other Resources:
* Springer has a series of books called Use R!.
* A longer list of books is at http://www.r-project.org/doc/bib/R-books.html

==================================================================
## R Console Input and Evaluation
### Entering Input

<- Symbol is the assignment operator
```R
x <- 1
print(x)
# or 
x
# will print the same result in the console 
msg <- "hello"
msg
# Comments are ignored...
```
x <- ## Incomplete expression
"hello" is character vector, we call it character not string...

### Evaluation 
? What is the difference between >x , >print(x) 

```R
x <- 1 # Nothing printed
x # auto-printing occurs
print(x) # explicit printing
```
[1] indicates that x is a vector and 5 is the first element

```R
x <- 1:20 # colon operator is used for creating a sequence
x
```
':' colon operator is used for creating a sequence

=============================================================
## R data Types
### Objects and Attributes
#### Objects
R has five basic or "atomic" classes of objects:
* Character
* Numeric(real numbers)
* Integer
* Complex
* Logical(True/False)

The most basic object is a vector
* A vector can only _contain_ __objects of the same class__
* But: The one exception is a list, which is represented as a vector but can contain obkects of different classes

Empty vectors can be created with the vector() function 

#### Numbers
* Numbers in R a generally treated as numeric objects
* If you explictly want an integer, you need to specify the L, suffix
* There is also a special number Inf which represent infinity 
* The value NaN represents an Undefined value, NaN can also be thought of as a missing value

#### Attributes 
R objeccts can have attributes
* names, dimnames(dimension names)
* dimensions
* class
* length
* Other user-defined attributes/metadata

Attributes of an object can be accessed using the attributes() function

***

### Vectors and Lists

c() function is another function for creating vectors <personally I use c() (EKE)>
```R
x <- c(0.5, 0.6)      ## Numeric
x <- c(TRUE, FALSE)   ## Logical
x <- c(T, F)          ## Logical
x <- c("a", "b", "c") ## Character
x <- 9:29             ## Integer
x <- c(1+0i, 2+4i)    ## Complex

# But if we want to use vector()

x <- vector("numeric", length = 10)
x
# as you can see from the result it initiate the default values
```

#### Mixing Objects 

What if we have mix the objects and concatenate them?

```R
y <- c(1.7, "a")  ## Character
y <- c(TRUE, 2)   ## Numeric
y <- c("a", TRUE) ## Character

```
R create a least common denominator vector if we mixed the objects
then the other objects are converting to that least common object type...

When different objects are mixed in a vector, coercion occurs so that every element in the vector is of the same class

#### Explicit Coercion
Objects can be explicitly coerced from one class to another usign the as.* functions, if available

Here is a little example of explicit coercion...
```R
x <- 0:6
class(x)
# [1] "integer"
as.numeric(x)
# [1] 0 1 2 3 4 5 6
as.logical(x)
# [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
as.character(x)
# [1] "0" "1" "2" "3" "4" "5" "6"

```
But sometimes the coercion does not make that much sense as in the example above.

```R
x <- c("a", "b", "c")
as.numeric(x)
# [1] NA NA NA
# Warning message:
# NAs introduced by coercion
as.logical(x)
# [1] NA NA NA
```

#### Lists
Lists are a special type of vector that can containn elements of different classes. Lists are very important data type in R and you should get to know them well.

```R
x <- list(1, "a", TRUE, 1+4i)
x
# [[1]]
# [1] 1
#
# [[2]]
# [1] "a"
#
# [[3]]
# [1] TRUE
#
# [[4]]
# [1] 1+4i"
```
#### Matrices
Matrices are vectors with a dimension attribute. The dimension attribute is itself an integer vector of lenght 2(nrow, ncol)
First attribute is for rows, second one is for column

```R
m <- matrix(nrow = 2, ncol = 3)
m
#      [,1] [,2] [,3]
# [1,]   NA   NA   NA
# [2,]   NA   NA   NA
dim(m)
# [1] 2 3 
attributes(m)
# $dim
# [1] 2 3
```
First we create an empty matrix of 2 rows and 3 columns
They labeled with their number of rows, and columns
dim() functions shows us the how many rows and columns in the matrix
attributes() shows the attributes that have used in the function in result first line $dim then the result from dim() function

- Matrices are constructed comun-wise, so entries can be thought of starting in the "upper left" corner and running down the columns.

```R 
m <- matrix(1:6, nrow = 2, ncol = 3)
m
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

```
We can also create a matrix by creating the dimension attribute, for instance:

```R
m <- 1:10
m
# [1]  1  2  3  4  5  6  7  8  9 10
dim(m) <- c(2,5)
m
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    3    5    7    9
# [2,]    2    4    6    8   10

```

Another and more common way of creating a matrix is binding columns and binding rows using cbind(), rbind()
for instance:
```R
x <- 1:3
y <- 10:12
cbind(x,y)
#      x  y
# [1,] 1 10
# [2,] 2 11
# [3,] 3 12
rbind(x,y)
#   [,1] [,2] [,3]
# x    1    2    3
# y   10   11   12

```
