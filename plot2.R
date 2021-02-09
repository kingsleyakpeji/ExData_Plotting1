#This script creates the second plot in JHU's Exploratory Data Course Project 1

#Read subset of data for plotting

varNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
		    "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
		    "Sub_metering_3")

hhPowDt <- read.table(file = "household_power_consumption.txt", header = FALSE,
				  sep = ";", nrows = 2880, skip = 66637, col.names = varNames)

#Combine date and time vectors
library(lubridate)
dateTime <- dmy_hms(paste(hhPowDt$Date, hhPowDt$Time))


#Plot datetimevs Global Active Power (kilowatts)
plot(dateTime, hhPowDt$Global_active_power, type = "l", 
	ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()