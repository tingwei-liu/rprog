# this func reads a string from the console.
readS <- function()
{ 
  n <- readline(prompt = "Enter an integer: ")
  return(n)
}

# you may need to run these line by line.
A <- readS()
B <- readS()

# nchar returns the length of the string.
lA = nchar(A)
lB = nchar(B)

# to swap two strings, we create another string called C to store the temporary data.
if (lA < lB) { 
	C <- A
	A <- B
	B <- C
	lC <- lA
	lA <- lB
	lB <- lC
}

# initialize the variables.
Result <- ""
jinwei <- 0 # carry-bit

# manually caluclate the sum and record them.
for (q in lA : (lA - lB + 1)) {
	# calculate the sum of the current digit.
	# as.integer transfers a char to an integer; substr makes a substring.
	sum <- as.integer(substr(A, q, q)) + as.integer(substr(B, q + lB - lA, q + lB - lA)) + jinwei
	
	# %/%: integer division, %%: mod
	jinwei <- sum %/% 10
	# paste0("Frederic","Peng") = "FredericPeng"
	Result = paste0(as.character(sum %% 10), Result)
}

# now, B finishes calculating.
if (lA > lB) {
	for (q in (lA - lB) : 1) {
		sum <- as.integer(substr(A, q, q)) + jinwei
		jinwei <- sum %/% 10
		Result <- paste0(as.character(sum %% 10), Result)
	}
}
if (jinwei != 0) {
	Result <- paste0(as.character(jinwei), Result)
}

# print.
print(Result)
