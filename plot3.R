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
data$Time<- as.POSIXlt(paste(data$Date, data$Time),tz="GMT", format='%d/%m/%Y %H:%M:%S')
data[,1]<-as.Date(data[,1], format = "%d/%m/%Y")
data[,3]<-as.numeric(as.character(data[,3]))
data[,7]<-as.numeric(as.character(data[,7]))
data[,8]<-as.numeric(as.character(data[,8]))
data[,9]<-as.numeric(as.character(data[,9]))

##save plot to png file
png(file="plot3.png")
plot(data$Time,data[,7],type="l",xlab="",ylab="Energy sub metering")
points(data$Time,data[,8],type="l",xlab="",ylab="Energy sub metering",col="red")
points(data$Time,data[,9],type="l",xlab="",ylab="Energy sub metering",col="blue")
legend("topright",cex=0.7,lty=1,legend=c(names(data[7]),names(data[8]),names(data[9])), col=c("black","blue","red"))
dev.off()
