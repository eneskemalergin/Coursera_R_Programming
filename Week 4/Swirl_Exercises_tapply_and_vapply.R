## Swirl Exercises vapply and tapply

# We continue our discussion on loop functions with vapply and tapply
# let's refresh our brains:
# lapply() always returns a lits and sapply() always simplfy the result always.

sapply(flags, unique)

sapply(flags, class)

vapply(flags, class, character(1))

?tapply

table(flags$landmass)

table(flags$animate)

tapply(flags$animate, flags$landmass, mean)

tapply(flags$population, flags$red, summary)

tapply(flags$population, flags$landmass, summary)


