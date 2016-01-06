complete <- function(directory, id = 1:332) {
	setwd(directory)
	files  <- list.files()
	tables <- lapply(files, read.csv, header = TRUE)
	combined.df <- do.call(rbind, tables)
	setwd("..")
	nobs = numeric(0)
	for(i in id) {
		nobs = append(nobs, nrow(combined.df[combined.df$ID == i & !is.na(combined.df$sulfate) & !is.na(combined.df$nitrate),]))
	}
	dataframe = data.frame("id" = id, "nobs" = nobs)
	return (dataframe)
}