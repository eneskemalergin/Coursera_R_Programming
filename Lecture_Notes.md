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
: colon operator is used for creating a sequence
=============================================================
## R data Types
### Objects and Attributes
