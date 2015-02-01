## Swirl Exercises Date and Times


d1 <- Sys.Date()
class(d1)
# [1] "Date"
unclass(d1) # shows how it looks internally
# [1] 16466

## That is the exact number of days since 1970-01-01

d1
# [1] "2015-01-31"

d2 <- as.Date("1969-01-01")
unclass(d2)
# [1] -365

t1 <- Sys.time() # Accessing the current time
t1
# [1] "2015-01-31 18:08:58 CST"

class(t1)
# [1] "POSIXct" "POSIXt" 

unclass(t1)
# [1] 1422749339

t2 <- as.POSIXlt(Sys.time())
class(t2)
t2
unclass(t2)

str(unclass(t2))
# List of 11
# $ sec   : num 3.18
# $ min   : int 10
# $ hour  : int 18
# $ mday  : int 31
# $ mon   : int 0
# $ year  : int 115
# $ wday  : int 6
# $ yday  : int 30
# $ isdst : int 0
# $ zone  : chr "CST"
# $ gmtoff: int -21600
# - attr(*, "tzone")= chr [1:3] "" "CST" "CDT"

t2$min
# [1] 10

weekdays(d1)
# [1] "Saturday"

months(t1)
# [1] "January"

quarters(t2)
# [1] "Q1"

t3 <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M") # Converts character vectors to POSIXlt
t4
class(t4)

Sys.time() > t1

Sys.time() - t1
# Time difference of 7.055226 mins

difftime(Sys.time(), t1, units = 'days')



