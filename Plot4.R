setwd("~/ExData_Plotting1")

library(tidyverse)

# filter for these dates 2007-02-01 and 2007-02-02, make Global_active_power numeric

df = read_delim("household_power_consumption.txt.gz", delim=";") %>%
  mutate(Global_active_power=as.numeric(Global_active_power)) %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007") 

# put date and  time together
x <- paste(as.character(df$Date), as.character(df$Time))
date_time <- strptime(x, "%d/%m/%Y %H:%M:%S")

# make numeric
df.num <- df %>% select(-c(Date)) %>% mutate(across(where(is.character), as.numeric))
df.num$Date=df$Date

# set the plotting area to 2x2
par(mfrow=c(2,2))

# plot time vs Global_active_power
plot(date_time, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# plot time vs voltage
plot(date_time, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# plot time vs Sub_metering_1,2,3
plot(date_time, df$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, df$Sub_metering_2, col = "red")
lines(date_time, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

# plot time vs Global_reactive_power
plot(date_time, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png,'plot4.png', width=480,height=480)
dev.off()
