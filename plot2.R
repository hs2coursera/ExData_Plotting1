# Ex1Data_Plotting_1 Plot 2
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

# Create Datetime/Global_active_power plot.
plot(strptime(paste(d$Date, d$Time), "%Y-%m-%d %H:%M:%S"), 
     d$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l", 
     xaxp = c(0, length(d$Date), length(unique(d$Date))))
# Create png file.
dev.copy(png, file = "plot2.png")
dev.off()

# Reset locale
Sys.setlocale("LC_TIME", locale)
