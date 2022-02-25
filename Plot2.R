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
df$Global_active_power<-as.numeric(as.character(df$Global_active_power))

# plot 
plot(date_time, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png,'plot2.png', width=480,height=480)
dev.off()