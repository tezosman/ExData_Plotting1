
## read in the data
df <- read.csv("./household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, na.strings="?", colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## convert to date and to correct format
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

startDate <- as.Date("01/02/2007", format="%d/%m/%Y")
endDate <- as.Date("02/02/2007", format="%d/%m/%Y")

## Subset only for the 2 days
df <- df[df$Date >= startDate & df$Date <= endDate, ]

## Plotting the data
png(filename="plot1.png", width=480, height=480)
hist(as.numeric(df$Global_active_power), col ="Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()