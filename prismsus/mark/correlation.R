## This function calculates the correlation between nitrate and sulfate, and it
## is used for the assignment 1 in the Coursera course.
corr <- function(directory, threshold = 0)
{
  fileslist <- list.files(directory, full.names = TRUE)
  corvec <- vector()
  for(i in 1:332)
  {
    dat <- read.csv(fileslist[i])
    good <- sum(complete.cases(dat))
    if(good > threshold)
    {
      nitrate <- c(dat[,3])
      sulfate <- c(dat[,2])
      corvec<- c(corvec, cor(nitrate, sulfate, use = "complete.obs"))
    }
  }
  output <- corvec
}
