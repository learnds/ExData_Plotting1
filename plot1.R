# read data after filtering using grep
dat<-read.csv(pipe("grep -e \"^Date\" -e \"^[12]/2/2007\"  household_power_consumption.txt"), sep=";",stringsAsFactors=FALSE)

# convert date column
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")

# Merge and add datetime column to data
dattime<-strptime(paste(dat$Date,dat$Time),"%Y-%m-%d %H:%M:%S")

dat<-cbind(dat,dattime)

# Plot the data
png(filename='plot1.png',width=480,height=480)

hist(dat$Global_active_power,xlab="Global Active Power (kilowatts)",col="orangered",main="Global Active Power")

dev.off()