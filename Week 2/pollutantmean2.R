# New try"

pollutantmean <- function(directory, pollutant, id = 1:332){
  data = numeric()
  for (i in id){
    newRead = read.csv(paste(directory, "/",formatC(i,width = 3, flag ="0"), ".csv",sep = ""))
    data = c(data, newRead[[pollutant]])
  }
  rounded <- round(mean(data, na.rm = T), 3)
  return(rounded)
}