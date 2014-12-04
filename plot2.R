
## read in the data
df <- read.csv("./household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, na.strings="?", colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## format the date and time for the correct dates (2007-02-01 and 2007-02-02)
df$timestamp <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC")

## Setting startdate and end date
startDate <- strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate <- strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")

## Subsetting the data for the 2 days 2007-02-01 and 2007-02-02
df <- df[df$timestamp >= startDate & df$timestamp <= endDate, ]

## Plot data to image
png(filename="plot2.png", width=480, height=480)
plot(df$timestamp, df$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

