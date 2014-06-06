dat<-read.csv(pipe("grep -e \"^Date\" -e \"^[12]/2/2007\"  household_power_consumption.txt"), sep=";",stringsAsFactors=FALSE)

dat$Date<-as.Date(dat$Date,"%d/%m/%Y")


dattime<-strptime(paste(dat$Date,dat$Time),"%Y-%m-%d %H:%M:%S")

dat<-cbind(dat,dattime)

plot(dat$dattime,dat$Sub_metering_1,ylab="Energy sub metering",xlab="",pch=NA)
lines(dat$dattime,dat$Sub_metering_1,col="black")
lines(dat$dattime,dat$Sub_metering_2,col="red")
lines(dat$dattime,dat$Sub_metering_3,col="blue")

legend("topright",pch="---",col=c("black","red","blue"), legend=names(dat[7:9]))

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()