## read in the data
df <- read.csv("./household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, na.strings="?", colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## format the date and time for the correct dates (2007-02-01 and 2007-02-02)
df$timestamp <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC")

## Setting startdate and end date
startDate <- strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate <- strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")

## Subsetting the data for the 2 days 2007-02-01 and 2007-02-02
df <- df[df$timestamp >= startDate & df$timestamp <= endDate, ]

## Kicking off the plotting
png(filename="plot4.png", width=480, height=480)

## setting the dimensions of the multiple report display
par(mfcol=c(2,2))

## plotting the first plot.
plot(df$timestamp, df$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## plot second plot
plot(df$timestamp, df$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
lines(df$timestamp, df$Sub_metering_2, col="red")
lines(df$timestamp, df$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

## plotting the 3rd plot
plot(df$timestamp, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

## 4th plot
plot(df$timestamp, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Closing off
dev.off()