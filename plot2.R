

## read data
setwd("~/Coursera/Exploratory Data Analysis/Week 1")

powerdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

# create new column merge date and time together
DateTime <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerdata <- cbind(powerdata, DateTime)

# subset data to retain dates 2007-02-01 & 2007-02-02
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
subsetdata <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

# update class on the rest of the fields
subsetdata$Time <- format(subsetdata$Time, format="%H:%M:%S")
subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)
subsetdata$Global_reactive_power <- as.numeric(subsetdata$Global_reactive_power)
subsetdata$Voltage <- as.numeric(subsetdata$Voltage)
subsetdata$Global_intensity <- as.numeric(subsetdata$Global_intensity)
subsetdata$Sub_metering_1 <- as.numeric(subsetdata$Sub_metering_1)
subsetdata$Sub_metering_2 <- as.numeric(subsetdata$Sub_metering_2)
subsetdata$Sub_metering_3 <- as.numeric(subsetdata$Sub_metering_3)

# plot as png
png("plot2.png", width=480, height=480)
with(subsetdata, plot(DateTime, Global_active_power, type="l", 
                        xlab="Day", 
                        ylab="Global Active Power (kilowatts)"))
dev.copy(png,'plot2.png')
dev.off()