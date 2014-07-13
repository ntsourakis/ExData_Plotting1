# plot4() creates a multiple plot of the data in household_power_consumption.txt
# for the period between 2007-02-01 to 2007-02-02
plot4 <- function( )
{
	# Read the data from the file
	data <- read.table("../household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")
	
	# Convert the columns to the appropriate values
	data[,1] <- as.Date(data$Date,"%d/%m/%Y")
	data$DateTime <-  as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
	data[,3] <- as.numeric(data[,3])
	data[,4] <- as.numeric(data[,4])
	data[,5] <- as.numeric(data[,5])
	data[,6] <- as.numeric(data[,6])
	data[,7] <- as.numeric(data[,7])
	data[,8] <- as.numeric(data[,8])
	data[,9] <- as.numeric(data[,9])

	# Get data of interest from 2007-02-01 to 2007-02-02
	sub = subset(data, data$Date %in% as.Date(c("2007-02-01","2007-02-02")))

	# Create the plots
	par(mfrow = c(2,2))

	# Up-left plot
	plot(sub$DateTime, subData[,3], xlab = " ", ylab = "Global Active Power", type = "l")

	# Up-right plot
	plot(sub$DateTime, subData[,5], xlab = "datetime", ylab = "Voltage", type = "l")

	# Down-left plot
	plot(subData$DateTime, subData[,7], type = "l", xlab = " ", ylab = "Energy sub metering")
	legend(x = "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black","Red","Blue"), lwd = 1, pt.cex = 0.6, cex = 0.6, bty = "n")
	lines(subData[,10],subData[,8],col="Red")
	lines(subData[,10],subData[,9],col="Blue")

	# Down-right plot
	plot(subData$DateTime, subData[,4], xlab = "datetime", ylab = "Global_reactive_power", type = "l")

	# Copy the plot to a PNG file
	dev.copy(png,file="./figure/plot4.png")

	# Close the device
	dev.off()
}
