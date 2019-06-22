# Load the data, asuming the data sits in working directory
pdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric",7) ), na.strings="?")

# Subset the data for only two days
pdata1 <- subset(pdata, Date=="1/2/2007" | Date == "2/2/2007")

# convert to date and time class
pdata1$datetime <- paste(pdata1$Date, pdata1$Time)
pdata1$datetime <- strptime(pdata1$datetime, "%d/%m/%Y %H:%M:%S")

#Create a PNG file device with a width of 480 pixels and a height of 480 pixels
png(filename="plot3.png", width=480, height=480, units="px")

# Construct the Plot 
with(pdata1, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(pdata1, lines(datetime, Sub_metering_2, col="red"))
with(pdata1, lines(datetime, Sub_metering_3, col="blue"))

legend("topright",lty=1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()