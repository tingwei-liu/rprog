pollutantmean <- function(directory, pollutant, id = 1:332)
{
	fileslist <- list.files(directory, full.names = TRUE)
	dat <- data.frame()
	for(i in seq_along(id))
	{
		dat <- rbind(dat, read.csv(fileslist[id[i]]))
	}
	dat_sub <- (dat[, pollutant])
	mean(dat_sub, na.rm = TRUE)
}
