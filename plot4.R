#This script creates the fourth plot in JHU's Exploratory Data Course Project 1

#Read subset of data for plotting

varNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
		    "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
		    "Sub_metering_3")

hhPowDt <- read.table(file = "household_power_consumption.txt", header = FALSE,
				  sep = ";", nrows = 2880, skip = 66637, col.names = varNames)

#Combine date and time vectors
library(lubridate)
dateTime <- dmy_hms(paste(hhPowDt$Date, hhPowDt$Time))

#Set up multi-plot environment
par(mfrow = c(2,2), mar = c(4,4,2,1))

#Add plots to multi-plot environment

#Plot datetime vs Global Active Power (kilowatts)
plot(dateTime, hhPowDt$Global_active_power, type = "l", 
	ylab = "Global Active Power (kilowatts)")

#Plot datetime vs Voltage
plot(dateTime, hhPowDt$Voltage, type = "l", xlab = "datetime",
	ylab = "Voltage")

#Plot Sub_metering plots
plot(dateTime, hhPowDt$Sub_metering_1, type = "l", col = "black",
	ylab = "Energy sub metering")
lines(dateTime, hhPowDt$Sub_metering_2, col = "red")
lines(dateTime, hhPowDt$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
				"Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

#Plot datetime vs Global Reactive Power (kilowatts)
plot(dateTime, hhPowDt$Global_reactive_power, type = "l", xlab = "datetime",
	ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()