outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
for (i in c(11,17,23)) outcome[, i] <- as.numeric(outcome[, i])
rankhospital <- function(state, outcomefunc, num = "best") {
	try(if(! state%in%outcome$State) stop("invalid state", call. = FALSE))
	try(
		if(outcomefunc == "heart attack") col = 11
		else if (outcomefunc == "heart failure") col = 17
		else if (outcomefunc == "pneumonia") col = 23
		else stop("invalid outcome", call. = FALSE)
	)
	newout = outcome[outcome$State == state,]
	ordered = newout[order(newout[col],newout[2],na.last = NA),]
	if(num == "best") num = 1
	if(num == "worst") num = nrow(ordered)
	return (ordered[num,2])
}