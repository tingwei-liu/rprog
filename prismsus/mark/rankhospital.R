rankhospital <- function(state, outcome, num = "best"){
  frame <- best(state, outcome)
  if(num == "best") {
    n<-1
    result <- frame[n,2]
  } else if(num == "worst") {
    n <- nrow(frame)
    result <- frame[n,2]
  } else if (num > nrow(frame)){
    result <- NA
  } else {
    n <- num
    result <- frame[n,2]
  }
  result
}
