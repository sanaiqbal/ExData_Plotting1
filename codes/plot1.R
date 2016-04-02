download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="data.zip",mode="wb")
unzip(data.zip)
list.file()
data<-read.csv2("household_power_consumption.txt",header=T,na.strings = "?",colClasses = "character")
data1<-data
##PLOT1.PNG-convert date column to date class##
reqd<-mutate(data1,Date=as.Date(Date,"%d/%m/%Y"))
z<-filter(reqd,Date=="2007-02-01"|Date=="2007-02-02")
##CALL GRAPHIC DEVICE PNG##
png(filename = "plot1.png",    width = 480, height = 480, units = "px")
hist(as.numeric(z[,3]),xlab="Global Active Power (killowatts)",main="Global Active Power",col="red")
dev.off()