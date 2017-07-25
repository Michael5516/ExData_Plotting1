## Reading in full dataset
Dataset <- read.table("household_power_consumption.txt",
                      header = TRUE,
                      sep = ";",
                      dec = ".",
                      stringsAsFactors = FALSE,
                      na.strings = "?")

## Subsetting the data by date
subDataset <- Dataset[Dataset$Date %in% c("1/2/2007", "2/2/2007"), ]

## Converting the Date and Time vars from character into class of date and time
datetime <- strptime(paste(subDataset$Date, subDataset$Time, sep = " "), 
                     format = "%d/%m/%Y %H:%M:%S")

## Plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

plot(datetime, subDataset$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

plot(datetime, subDataset$Voltage, type = "l",
     ylab = "Voltage (volt)",
     xlab = "datetime")

plot(datetime, subDataset$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, subDataset$Sub_metering_2, type = "l", col = "red")
lines(datetime, subDataset$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       lwd = 2.5,
       col = c("black", "red", "blue"))

plot(datetime, subDataset$Global_reactive_power, type = "l",
     xlab = "datetime",
     ylab = "Global Reactive Power")

## Saving to a PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

