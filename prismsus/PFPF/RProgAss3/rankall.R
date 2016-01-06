outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
for (i in c(11,17,23)) outcome[, i] <- as.numeric(outcome[, i])
rankall <- function(outcomefunc, num = "best") {
	try(
		if(outcomefunc == "heart attack") col = 11
		else if (outcomefunc == "heart failure") col = 17
		else if (outcomefunc == "pneumonia") col = 23
		else stop("invalid outcome", call. = FALSE)
	)
	hospital = character(0)
	state = character(0)
	for (i in sort(unique(outcome$State))) {
		newout = outcome[outcome$State == i,]
		ordered = newout[order(newout[col],newout[2],na.last = NA),]
		if(num == "best") num = 1
		if(num == "worst") num = nrow(ordered)
		hospital = append(hospital, ordered[num,2])
		state = append(state, i)
	}
	return(data.frame("hospital" = hospital, "state" = state, row.names = sort(unique(outcome$State))))
}