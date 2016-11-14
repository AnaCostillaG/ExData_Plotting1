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
data$Time<- as.POSIXlt(paste(data$Date, data$Time),tz="GMT", format='%d/%m/%Y %H:%M:%S')
data[,3]<-as.numeric(as.character(data[,3]))

##save plotted graph to png file.
png(file="plot2.png", height = 480, width = 480)
plot(data[,2],data[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
