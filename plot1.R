
setwd("~/Coursera/Exploratory Data Analysis/Week 1")

## read in data
powerdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## subset data to retain dates 2007-02-01 & 2007-02-02
subsetdata <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

## update class on fields
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")
subsetdata$Time <- format(subsetdata$Time, format="%H:%M:%S")
subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)
subsetdata$Global_reactive_power <- as.numeric(subsetdata$Global_reactive_power)
subsetdata$Voltage <- as.numeric(subsetdata$Voltage)
subsetdata$Global_intensity <- as.numeric(subsetdata$Global_intensity)
subsetdata$Sub_metering_1 <- as.numeric(subsetdata$Sub_metering_1)
subsetdata$Sub_metering_2 <- as.numeric(subsetdata$Sub_metering_2)
subsetdata$Sub_metering_3 <- as.numeric(subsetdata$Sub_metering_3)


# Plot 1
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, 
                    col = "red", border = "black",
                    main = "Global Active Power", 
                    xlab = "Global Active Power (kilowatts)",
                    ylab = "Frequency"
                    )
dev.copy(png,'plot1.png')
dev.off()