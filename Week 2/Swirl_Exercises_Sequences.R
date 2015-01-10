# Swirl practice Sequences and Numbers

# Easiest way to create sequence of numbers is using ":"  operator.

1:20

pi:10 # pi is pre-defined constant in R 

15:1 # it is like counting backwards...

?':' # This is a way to show help for colon operator

seq(1,20) # It does the same thing as ":"

seq(0,10, 0.5) # It increment by 0.5

# sequence of 30 numbers between 5 and 10
my_seq <- seq(5,10, length = 30)

length(my_seq) # Returns the length of a variable

1:length(my_seq)
# [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
# [24] 24 25 26 27 28 29 30

# Will give the same result
seq(along.with = my_seq)

# But most common way is built-in function
seq_along(my_seq)

rep(0, times = 40) # It will create 0 40 times...

rep(c(0,1,2), times = 10)
#  [1] 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2
rep(c(0, 1, 2), each = 10)
