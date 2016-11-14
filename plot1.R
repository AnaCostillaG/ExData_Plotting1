#Exploratory data analysis peer review project 1
getwd()
setwd("./Documents/git/expdataanalysis/ExData_Plotting1")

##download zip in temporary file
file="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(file,temp)
##unzip file
temp2<-unzip(temp)
##identify lines to keep
lines <- grep('^[1-2]/2/2007', readLines(temp2))

##generate dataset and prepare for plotting
dataset<-read.table(temp2,header=TRUE,sep=";")
data<-dataset[lines,]
data[,1]<-as.Date(data[,1], format = "%d/%m/%Y")
data[,3]<-as.numeric(as.character(data[,3]))

##save plotted in png fie. 
png(file="plot1.png", width = 480, height = 480)
hist(data[,3],col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",ylim=c(1,1200))
dev.off()
