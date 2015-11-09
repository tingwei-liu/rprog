# this func reads a string from the console.
readS <- function()
{ 
  n <- readline(prompt = "Enter an integer: ")
  return(n)
}

# the addition function
high_accuracy_add <- function(A, B)
{
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
	return(Result)
}

# adds zeros to the string
add_zeros <- function(A, n)
{
	for (i in 1:n) {
		A = paste0(A, "0")
	}
	return(A)
}

high_accuracy_mult <- function(A, B)
{
	# nchar returns the length of the string.
	lA <- nchar(A)
	lB <- nchar(B)

	# if it's simple to calculate, we do it directly.
	if (lA + lB < 10) return(as.character(as.integer(as.integer(A) * as.integer(B))))
	
	# to swap two strings, we create another string called C to store the temporary data.
	if (lA < lB) { 
		C <- A
		A <- B
		B <- C
		lC <- lA
		lA <- lB
		lB <- lC
	}
	
	# now that A is longer than B, we cut A into halves!
	return(high_accuracy_add(add_zeros(high_accuracy_mult(substr(A, 1, lA / 2), B), (lA + 1) / 2), high_accuracy_mult(substr(A, lA / 2 + 1, lA), B)))
}





# introduction on what does this program do.
print("This program allows you to multiply any positive integer to another.")

# you may need to run these line by line.
A <- readS()
B <- readS()

# print.
print(high_accuracy_mult(A, B))
