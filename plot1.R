#This script creates the first plot in JHU's Exploratory Data Course Project 1

#Read subset of data for plotting

varNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
		    "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
		    "Sub_metering_3")

hhPowDt <- read.table(file = "household_power_consumption.txt", header = FALSE,
				  sep = ";", nrows = 2880, skip = 66637, col.names = varNames)

#Plot histogram of Global_Active_Power
#png(filename = "plot1.png") #Alternative for direct copying to png device

hist(hhPowDt$Global_active_power, col = "red", main = "Global Active Power",
	xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()