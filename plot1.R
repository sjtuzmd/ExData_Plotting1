# Load the data, asuming the data sits in working directory
pdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric",7) ), na.strings="?")

# Subset the data for only two days
pdata1 <- subset(pdata, Date=="1/2/2007" | Date == "2/2/2007")

#Create a PNG file device with a width of 480 pixels and a height of 480 pixels
png(filename="plot1.png", width=480, height=480, units="px")

# Construct the Plot
hist(pdata1$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()