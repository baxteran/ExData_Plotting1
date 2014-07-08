#
# plot1.R creates the histogram of global active power consumption 
# of a home for two days in Feb 2007
#

# first call out to utility function to get the required dataset
source("getFebPower.R")
febPower <- getFebPower()
# set up the plot area
par(mfrow = c(1,1))
hist(as.numeric(febPower$Global_active_power), col="red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
# write the plot to the png device and then close it.
dev.copy(png,file = "plot1.png")
dev.off()
