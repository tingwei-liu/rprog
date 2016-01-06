outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
for (i in c(11,17,23)) outcome[, i] <- as.numeric(outcome[, i])
best <- function(state, outcomefunc) {
	try(if(! state%in%outcome$State) stop("invalid state", call. = FALSE))
	try(
		if(outcomefunc == "heart attack") col = 11
		else if (outcomefunc == "heart failure") col = 17
		else if (outcomefunc == "pneumonia") col = 23
		else stop("invalid outcome", call. = FALSE)
	)
	maxm = min(outcome[col][outcome$State == state,],na.rm=TRUE)
	name = sort(outcome[2][!is.na(outcome[col]) & outcome[col]==maxm & outcome$State == state,])[1]
	return(name)
}