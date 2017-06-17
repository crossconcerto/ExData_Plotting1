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

##plot2
png("plot2.png", width=480, height=480)
plot(p1dataclear$datetime,p1dataclear$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()