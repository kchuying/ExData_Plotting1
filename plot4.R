#set preferred working directory
#setwd("exdata-data-household_power_consumption//")

#read in data file
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)

#subset data based on date between 2007-02-01 and 2007-02-02
date1 <- c("1/2/2007")
date2 <- c("2/2/2007")
mydata <- subset(data, (data$Date == date1 | data$Date == date2))

#adjusting format of data to be printed
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))
mydata$Global_reactive_power <-as.numeric(as.character(mydata$Global_reactive_power))
mydata$Voltage<- as.numeric(as.character(mydata$Voltage))
mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 <- as.numeric(as.character(mydata$Sub_metering_3))
x <- paste(mydata$Date, mydata$Time)
mydata$DateTime<- strptime(x, "%d/%m/%Y %H:%M:%S")

#generate png
png("plot4.png", width = 480, height = 480)

#create 2 by 2 matrix for 4 plots & adjust margin
par(mfrow = c(2,2), mar=c(4,4,2,2))

#generate 1st plot (top-left)
plot(mydata$DateTime, mydata$Global_active_power, type="l", ylab= "Global Active Power", xlab="")

#generate 2nd plot (top-right)
plot(mydata$DateTime, mydata$Voltage, type="l", ylab= "Voltage", xlab="datetime")

#generate 3rd plot (bottom-left)
plot(mydata$DateTime, mydata$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(mydata$DateTime, mydata$Sub_metering_2, type="l", col="red")
lines(mydata$DateTime, mydata$Sub_metering_3, type="l", col="blue")

#create legend
legend("topright", lty = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#generate 4th plot (bottom-right)
plot(mydata$DateTime, mydata$Global_reactive_power, type="l", ylab= "Global_reactive_power", xlab="datetime")

dev.off()