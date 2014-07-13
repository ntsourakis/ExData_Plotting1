# plot1() creates a histogram of the data in household_power_consumption.txt
# for the period between 2007-02-01 to 2007-02-02
plot1 <- function( )
{
	# Read the data from the file
	data <- read.table("../household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")
	
	# Convert the columns to the appropriate values
	data[,1] <- as.Date(data$Date,"%d/%m/%Y")
	data[,2] <- as.Date(data$Time,"%H/%M/%S")
	data[,3] <- as.numeric(data[,3])
	data[,4] <- as.numeric(data[,4])
	data[,5] <- as.numeric(data[,5])
	data[,6] <- as.numeric(data[,6])
	data[,7] <- as.numeric(data[,7])
	data[,8] <- as.numeric(data[,8])
	data[,9] <- as.numeric(data[,9])

	# Get data of interest from 2007-02-01 to 2007-02-02
	sub = subset(data, data$Date %in% as.Date(c("2007-02-01","2007-02-02")))

	# Create the histogram
	hist(sub[,3], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

	# Copy the plot to a PNG file
	dev.copy(png,file="./figure/plot1.png")

	# Close the device
	dev.off()
}
