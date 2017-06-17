## find the working directory and read the data into R
getwd()
setwd("C:/Users/ted/Desktop/coursera/R/lesson4/project1")
p1data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

##grab the data only in Date 2/2/2007 and 1/2/2007
head(p1data)
names(p1data)
p1dataclear <- subset(p1data,Date == "2/2/2007"|Date == "1/2/2007")

##change the class of global_activ_power
class(p1dataclear$Global_active_power)
p1dataclear$Global_active_power <- as.numeric(p1dataclear$Global_active_power)

##combine the data and time variable named(datetime)
p1dataclear$datetime <- strptime(paste(p1dataclear$Date,p1dataclear$Time), format = "%d/%m/%Y %H:%M:%S")

##plot4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
##plot4-1
plot(p1dataclear$datetime,p1dataclear$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power") 
##plot4-2
plot(p1dataclear$datetime,p1dataclear$Voltage, type = "l", xlab = "datatime", ylab = "Voltage") 
##plot4-3
plot(p1dataclear$datetime, p1dataclear$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(p1dataclear$datetime, p1dataclear$Sub_metering_2, type = "l", col = "red")
lines(p1dataclear$datetime, p1dataclear$Sub_metering_3, type = "l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1), col = c("black","red","blue"), cex = 0.6)
##plot4-4
plot(p1dataclear$datetime,p1dataclear$Global_reactive_power, type = "l", xlab = "datatime", ylab = "Global_reactive_power")
dev.off()