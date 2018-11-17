#Mean pollution by type for a specific set of files
pollutantmean <- function(directory, pollutant, id = 1:332) {
        
       mean(unlist(lapply(dir(directory, full.names = TRUE)[id], + 
                                  function(x){ read.csv(x)[pollutant]})), na.rm = TRUE)
}

pollutantmean("specdata","nitrate")


#For a specific set of files, determine the number of completed cases
complete <- function(directory, id = 1:2) {
        
        data.frame(id = id, nobs = unlist(lapply(dir(directory, full.names = TRUE)[id], function(x){ sum(complete.cases(read.csv(x)))})))
        
}

cc <- complete("specdata",1:332)
print(cc$nobs)

summary(cc$nobs)

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332,10)
print(cc[use, "nobs"])

#COR - limit the data to a threshod of completed cases and calculate the correlation between
#sulfate and nitrate


corr <- function(directory, threshold = 0) {
        files_list <- dir(directory, full.names = TRUE)[which(unlist(lapply(dir(directory, full.names = TRUE), function(x){ sum(complete.cases(read.csv(x)))})) > threshold)]
        df<- data.frame(matrix(ncol = 1, nrow = 0))
        colnames(df) <- "correlation"

        for(i in 1:length(files_list)) {
                
                df <- rbind(df, cor(x = read.csv(files_list[i])$sulfate, y = read.csv(files_list[i])$nitrate, use = "pairwise.complete.obs"))
        }
        
        df

}

cr <- corr("specdata", 150)

head(cr)
summary(cr)        



cr <-corr("specdata")
cr <- sort(cr$X.0.222552560758546)
set.seed(868)
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <-corr("specdata", 129)
cr <- sort(cr$X.0.0189575409702549)
n <- length(cr)
set.seed(197)
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


cr <-corr("specdata", 1000)
cr <- sort(cr$X.0.0189575409702549)
n <- length(cr)
set.seed(197)
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


files_list <- dir("specdata", full.names = TRUE)[which(unlist(lapply(dir("specdata", full.names = TRUE), function(x){ sum(complete.cases(read.csv(x)))})) > 0)]
