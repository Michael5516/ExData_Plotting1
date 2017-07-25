## Reading in full dataset
Dataset <- read.table("household_power_consumption.txt", 
                      header = TRUE, 
                      sep = ";",
                      stringsAsFactors = FALSE,
                      dec = ".",
                      na.strings = "?")

## subsetting the data by date
subDataset <- Dataset[Dataset$Date %in% c("1/2/2007", "2/2/2007"), ]

## Converting the Date and Time vars from character into class of date and time
datetime <- strptime(paste(subDataset$Date, subDataset$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

## Plot 2
plot(datetime, subDataset$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

## Saving to a PNG file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()