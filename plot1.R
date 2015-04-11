#set preferred working directory 
setwd("exdata-data-household_power_consumption//")

#read in data file
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)

#subset data based on date between 2007-02-01 and 2007-02-02
date1 <- c("1/2/2007")
date2 <- c("2/2/2007")
mydata <- subset(data, (data$Date == date1 | data$Date == date2))

#adjusting format of data to be printed
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))

#generate histogram & png
png("plot1.png", width = 480, height = 480) #generate png
par(mar=c(4,4,2,2)) #adjust margin
hist(mydata$Global_active_power,  main="Global Active Power",col='red',ylab= "Frequency",xlab="Global Active Power(kilowatts)") #generate plot
dev.off()