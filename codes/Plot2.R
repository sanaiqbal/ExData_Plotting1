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
png(filename = "Plot2.png")
with(reqd2,(plot(time2,as.numeric(reqd2[,3]),type="l",lty=1,lwd=2,xlab="",ylab="Global Active Power (killowatts)")))
dev.off()