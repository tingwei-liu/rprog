best <- function(state, outcome, num){
  
  out <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  out_state <- out[["State"]]
  if(outcome == "heart attack") {n<- 11}
  else if(outcome =="pneumonia") {n<- 23}
  else if(outcome == "heart failure") {n<- 17}
  else {stop("invalid outcome")}
  
  if(!(state%in%out[[7]])) {stop("invalid state")}
  
  sts <- subset(out, State == state, select = 1:23)
  sts_new <- sts[order(as.numeric(sts[[n]]), sts[[2]]),]
  hospital <- subset(sts_new, sts_new[,n] != "Not Available")
  
  if(num == "best") {n<-1
  result <- cbind(hospital[n,2], state)
  } else {if (num == "worst") {
    n <- nrow(hospital)
    result <- cbind(hospital[n,2], state)
  } else {if (num > nrow(hospital)) {
    result <- cbind(NA, state) 
  } else {
    n <- num
    result <- cbind(hospital[n,2], state)
  }}}
  result
}
