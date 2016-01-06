pollutantmean <- function(directory, pollutant, id = 1:332) {
	setwd(directory)
	files  <- list.files()
	tables <- lapply(files, read.csv, header = TRUE)
	combined.df <- do.call(rbind, tables)
	setwd("..")
	return(mean(combined.df[combined.df$ID %in% id,][[pollutant]],na.rm=TRUE))
}