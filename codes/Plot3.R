download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="data.zip",mode="wb")
unzip(data.zip)
list.file()
data<-read.csv2("household_power_consumption.txt",header=T,na.strings = "?",colClasses = "character")
data1<-data
reqd<-mutate(data1,Date=as.Date(Date,"%d/%m/%Y"))
z<-filter(reqd,Date=="2007-02-01"|Date=="2007-02-02")
##PLOT2.PNG,GENERATE WEEKDAY AND TIME##
library(lubridate)
reqd2<-mutate(z,time2=ymd_hms(paste(Date,Time)))
##energy sub metring##
##plot extra graphs using lines command ##
png(filename = "Plot3.png")
with(reqd2,(plot(time2,as.numeric(reqd2[,7]),type="l",xlab="",ylab="Energy Sub metering")))
with(reqd2,(lines(time2,as.numeric(reqd2[,8]),col="red")))
with(reqd2,(lines(time2,as.numeric(reqd2[,9]),col="blue")))
n<-names(reqd2[,7:9])
legend("topright",lwd=2,legend=n,col=c("black","red","blue"))
dev.off()