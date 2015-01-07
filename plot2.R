## Exploratory Analysis
## Project #1
## Plot 2
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

## Draw Plot 2
# Open Graphics Device - png file 480x480
png(filename = "plot2.png", width = 480, height = 480)

## Draw Plot 2
##   use plot, line mode, y-axis title, no x-axis title
plot(power_data$DateTime, power_data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#Close Graphics Device
dev.off()

