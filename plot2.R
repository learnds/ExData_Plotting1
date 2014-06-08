dat<-read.csv(pipe("grep -e \"^Date\" -e \"^[12]/2/2007\"  household_power_consumption.txt"), sep=";",stringsAsFactors=FALSE)

dat$Date<-as.Date(dat$Date,"%d/%m/%Y")


dattime<-strptime(paste(dat$Date,dat$Time),"%Y-%m-%d %H:%M:%S")

dat<-cbind(dat,dattime)

png(filename="plot2.png",width=480,height=480)

plot(dat$dattime,dat$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",pch=NA)
lines(dat$dattime,dat$Global_active_power)

dev.off()