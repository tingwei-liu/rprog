corr <- function(directory, threshold = 0) {
	c = numeric(0)
	comp = complete(directory)
	for (i in 1:332) {
		if (comp$nobas[i] > threshold) c = append(c, cor(combined.df[combined.df$ID == i,]$sulfate,combined.df[combined.df$ID == i,]$nitrate,use = "complete.obs"))
	}
	return(c)
}