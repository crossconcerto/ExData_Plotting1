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

##plot1
##produce the histogram of global_active_power
png("plot10.png", width=480, height=480)
hist(p1dataclear$Global_active_power,xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()