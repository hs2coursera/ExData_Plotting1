# Ex1Data_Plotting_1 Plot 4
# Read data from the provided file.
d <- read.table("data/household_power_consumption.txt", 
                header = TRUE, 
                sep = ";", 
                na.strings = "?")
# Change data type of "Date" column, from "Factor" to "Date".
d$Date <- as.Date(d$Date, "%d/%m/%Y")
# Create subset of the loaded data.
d <- subset(d, Date == "2007-2-1" | Date == "2007-2-2")
Datetime <- strptime(paste(d$Date, d$Time), "%Y-%m-%d %H:%M:%S")
d <- cbind(d, Datetime)

# Set up locale and layout
locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")
par.old <- par(mfcol = c(2,2), mar = c(3, 4.1, 3, 2.1))

dates <- strptime(paste(d$Date, d$Time), "%Y-%m-%d %H:%M:%S")
# 1. topleft:Create Datetime/Global_active_power plot.
plot(d$Datetime, 
     d$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

# 2. bottomleft:Create Datetime/Sub metering plot.
plot(d$Datetime, 
     d$Sub_metering_1, 
     xlab = "",
     ylab = "Energy sub metering",
     type = "l")
lines(dates, d$Sub_metering_2, col="red")
lines(dates, d$Sub_metering_3, col="blue")
# Create Legend.
legend("topright", 
       bty = "n",
       lwd = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 3. topright:Create Voltage/Datetime plot.
plot(d$Datetime, 
     d$Voltage, 
     xlab = "datetime", 
     ylab = "Voltage",
     type = "l")

# 4. bottomright:Create Global_reactive_power/Datetime plot.
plot(d$Datetime, 
     d$Global_reactive_power, 
     xlab = "datetime", 
     ylab = "Global_reactive_power",
     type = "l")

# Create png file.
dev.copy(png, file = "plot4.png")
dev.off()

# Reset settings.
Sys.setlocale("LC_TIME", locale)
par(par.old)
