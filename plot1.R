## Reading in full dataset
Dataset <- read.table("household_power_consumption.txt", 
                      header = TRUE, 
                      sep = ";",
                      stringsAsFactors = FALSE,
                      dec = ".",
                      na.strings = "?")

## subsetting the data by date
subDataset <- Dataset[Dataset$Date %in% c("1/2/2007", "2/2/2007"), ]

## Plot 1
hist(subDataset$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red")

## Saving to a PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()