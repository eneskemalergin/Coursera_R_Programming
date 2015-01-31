## Swirl Exercises Simulation

?sample

## takes 4 numbers from 1 to 6 with replacement
sample(1:6, 4, replace = TRUE)
# [1] 5 1 2 5

## We showed that randomly select four numbers
sample(1:6, 4, replace = TRUE) 
# [1] 6 4 2 3 

## Sample 10 numbers between 1 and 20, WITHOUT replacement.
sample(1:20, 10)
# [1] 15 16  9  4 14 17 12  7  2 20

LETTERS
#  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R"
# [19] "S" "T" "U" "V" "W" "X" "Y" "Z"

sample(LETTERS)
#  [1] "V" "T" "K" "N" "W" "U" "J" "P" "D" "Z" "M" "Q" "X" "S" "Y" "C" "B" "H"
# [19] "A" "F" "G" "R" "O" "I" "E" "L"

## Let the value 0 represet tails and the value 1 represent heads.
sample(c(0,1), 100, replace = TRUE)

flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))
flips
#   [1] 0 0 1 1 1 1 1 0 1 1 0 1 1 1 1 1 0 1 0 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0
# [38] 1 1 0 0 0 1 0 0 1 0 0 1 1 1 1 0 1 1 1 1 1 1 1 1 0 1 1 1 1 1 0 1 1 0 1 0 1
# [75] 1 0 1 1 0 1 1 1 1 0 1 1 1 0 0 1 1 0 1 1 1 0 0 1 0 1

sum(flips)
?rbinom
## we can generate a single random variable that 
## represents the number of heads in 100 flips of our unfair coin using
rbinom(1, size = 100, prob = 0.7)

flips2 <- rbinom(100, size = 1, prob = 0.7)
flips2
sum(flips2)

?rnorm
rnorm(10)

rnorm(10, mean = 100, sd = 25)

?rpois
rpois(5, 10)
my_pois <- replicate(100, rpois(5, 10))
my_pois
cm <- colMeans(my_pois)
hist(cm) 