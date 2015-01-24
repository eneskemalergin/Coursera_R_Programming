## Swirl Exercises Logic

## In this very short lesson we will learn intro to logical operations in R.

## Logical Values, they resulted when a logical expressions are evaluated 
TRUE 
FALSE

## They are logical operators
"+, -, *, /, =="

TRUE == TRUE
# [1] TRUE

(FALSE == TRUE) == FALSE
# [1] TRUE

## == operator can also be used to compare numbers

6 == 7
# [1] FALSE

6 < 7
# [1] TRUE

10 <= 10

## NExt Operator is != (not equal)

5 != 7
# [1] TRUE

!5 == 7
# [1] TRUE

FALSE & FALSE
# [1] FALSE

TRUE & c(TRUE, FALSE, FALSE)
# [1]  TRUE FALSE FALSE

TRUE && c(TRUE, FALSE, FALSE)
# [1] TRUE

## In the case above only the left element of a vector evaluated.

TRUE | c(TRUE, FALSE, FALSE)
# [1] TRUE TRUE TRUE

TRUE || c(TRUE, FALSE, FALSE)

5 > 8 || 6 != 8 && 4 > 3.9
# [1] TRUE

## isTRUE() Takes one argument 
isTRUE(6 > 4)
# [1] TRUE

## identical() will return TRUE if the two R objects in te parameter
identical('twins', 'twins')
# [1] TRUE

## xor() function represents the exclusive OR
xor(5 == 6, !FALSE)
# [1] TRUE

ints <- sample(10)
ints
#  [1] 10  9  3  5  2  1  7  4  6  8
ints > 5
#  [1]  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE

which(ints > 7)
# [1]  1  2 10

any(ints < 0)
# [1] FALSE

all(ints > 0)
# [1] TRUE
