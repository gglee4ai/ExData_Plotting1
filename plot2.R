df <- read.table(
  unz("exdata_data_household_power_consumption.zip", 
      filename = "household_power_consumption.txt"), 
  sep = ";", header = TRUE)

df <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]
df$datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)


png(filename = "plot2.png")
plot(df$date, df$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

