## Exploratory Analysis
## Project #1
## Plot 3
## ---------------------------------------
## File downloaded and unzipped in ./data directory
## - separated by ';'
## ---------------------------------------
file <- "./data/household_power_consumption.txt"
power_data <- read.table(file, header=TRUE, sep=";", na.strings="?")

## subset the data needed - in DD/MM/YYYY format
power_data <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007"),]

## Merge Date and Time columns to an convert into Date classes
power_data$DateTime <- paste(power_data$Date, power_data$Time)
power_data$DateTime <- strptime(power_data$DateTime, format = "%d/%m/%Y %H:%M:%S")


## Draw Plot 3
# Open Graphics Device - png file 480x480
png(filename = "plot3.png", width = 480, height = 480)

## Draw Plot 3
##   use Plot, then add 3 lines for sub metering with colors
##   add legend matching lines/colors
plot(power_data$DateTime, power_data$Sub_metering_1, type="n",
     ylab="Energy sub metering", xlab="")
points(power_data$DateTime, power_data$Sub_metering_1, type="l", col="black")
points(power_data$DateTime, power_data$Sub_metering_2, type="l", col="red")
points(power_data$DateTime, power_data$Sub_metering_3, type="l", col="blue")
legend("topright", lwd = 2, col= c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close Graphics Device
dev.off()