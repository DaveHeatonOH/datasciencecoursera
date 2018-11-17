#Check Working directory
getwd()

dir()

#Load the csv
x <- read.csv("hw1_data.csv", header = TRUE)

#View the file
View(x)

#Check dimensions
dim(x)

#Get Column Names
colnames(x)

#Get first 2 rows
head(x,2)

#Number of rows
nrow(x)

#Last 2 rows
tail(x,2)

#Valuw of ozone row 47
x[47, "Ozone"]

#Get number of missing rows
table(is.na(x$Ozone))

#Get mean of Ozone column
mean(x$Ozone, na.rm = TRUE)


#Subset the data where Ozone > 31 and Temp > 90. Mean solar.R
xSubs <- subset(x, Ozone > 31 & Temp >90)

mean(xSubs$Solar.R)


#Mean temp when Month = 6
xSubs <- subset(x, Month == 6)

mean(xSubs$Temp)

#Max temp when Month = 5
xSubs <- subset(x, Month == 5)

max(xSubs$Ozone, na.rm = TRUE)

#Clear Workspace
rm(list = ls())
