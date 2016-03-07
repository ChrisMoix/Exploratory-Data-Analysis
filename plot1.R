# dataset
dataset <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

# Subset the dataset to Feb 1-2 2007
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)

# Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency", col="Red")

# Save
dev.copy(png, file="plot1.png", height=480, width=480)

#Close device
dev.off()