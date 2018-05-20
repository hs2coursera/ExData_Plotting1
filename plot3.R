# Ex1Data_Plotting_1 Plot 3
# Read data from the provided file.
d <- read.table("data/household_power_consumption.txt", 
                header = TRUE, 
                sep = ";", 
                na.strings = "?")
# Change data type of "Date" column, from "Factor" to "Date".
d$Date <- as.Date(d$Date, "%d/%m/%Y")
# Create subset of the loaded data.
d <- subset(d, Date == "2007-2-1" | Date == "2007-2-2")

# Set local.
locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")

# Create Datetime/Sub metering plot.
dates <- strptime(paste(d$Date, d$Time), "%Y-%m-%d %H:%M:%S")
plot(dates, 
     d$Sub_metering_1, 
     xlab = "",
     ylab = "Energy sub metering",
     type = "l", 
     xaxp = c(0, length(d$Date), length(unique(d$Date))))
lines(dates, d$Sub_metering_2, col="red")
lines(dates, d$Sub_metering_3, col="blue")
# Create Legend.
legend("topright", 
       lwd = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Create png file.
dev.copy(png, file = "plot3.png")
dev.off()

# Reset locale
Sys.setlocale("LC_TIME", locale)
