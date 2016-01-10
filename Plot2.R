plotdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c("NA","?"))
plotdata[,1]<-as.Date(strptime(plotdata[,1],"%d/%m/%Y"))
date1<-as.Date("2007-02-01")
date2<-as.Date("2007-02-02")
plotdata2<-plotdata[plotdata$Date>=date1 & plotdata$Date<=date2,]
plotdata2<-transform(plotdata2,timestamp=as.POSIXct(paste(Date,Time)))
png(file="plot2.png",width=480,height=480)
plot(plotdata2$timestamp,plotdata2$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
