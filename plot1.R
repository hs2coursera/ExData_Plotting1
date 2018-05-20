# Ex1Data_Plotting_1 Plot 1
# Read data from the provided file.
d <- read.table("data/household_power_consumption.txt", 
                header = TRUE, 
                sep = ";", 
                na.strings = "?")
# Change data type of "Date" column, from "Factor" to "Date".
d$Date <- as.Date(d$Date, "%d/%m/%Y")
# Create subset of the loaded data.
d <- subset(d, Date == "2007-2-1" | Date == "2007-2-2")
# Create histogram of Global_active_power.
hist(d$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
# Create png file.
dev.copy(png, file = "plot1.png")
dev.off()
