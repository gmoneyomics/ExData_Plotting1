setwd("~/ExData_Plotting1")

library(tidyverse)

# filter for these dates 2007-02-01 and 2007-02-02, make Global_active_power numeric

df = read_delim("household_power_consumption.txt.gz", delim=";") %>%
  mutate(Global_active_power=as.numeric(Global_active_power)) %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007")

# plot histogram
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# save the plot as plot1.png
dev.copy(png,'plot1.png', width=480,height=480)
dev.off()