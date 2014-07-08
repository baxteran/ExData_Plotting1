#
# plot2.R charts global active power consumption 
# of a home for two days in Feb 2007 vs time
#

# first call out to utility function to get the required dataset
source("getFebPower.R")
febPower <- getFebPower()
# Set up the plotting area
par(mfrow = c(1,1))
with(febPower,plot(realTime,Global_active_power,type="n",xlab="",
                   ylab="Global Active Power (kilowatts)"))
# plot the time series
with(febPower,lines(realTime,Global_active_power))
# Write the plot to png and close the device
dev.copy(png,file = "plot2.png")
dev.off()