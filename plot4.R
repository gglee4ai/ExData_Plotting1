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


png("plot4.png")

par(mfrow = c(2, 2))
# c(1, 1)
plot(df$date, df$Global_active_power, type = "l", xlab = "", ylab = "GlobalActive Power")

# c(1, 2)
plot(df$date, df$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

# c(2, 1)
plot(df$date, df$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(df$date, df$Sub_metering_2, col = "red")
lines(df$date, df$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# c(2, 2)
plot(df$date, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

