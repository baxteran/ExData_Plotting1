#
# plot3.R charts the energy metering for 3 zones in 
# in a home for two days in Feb 2007 vs time
# as described in the README
#

# first call out to utility function to get the required dataset
source("getFebPower.R")
febPower <- getFebPower()
# Set up the plotting area
par(mfrow = c(1,1))
with(febPower,plot(realTime,Sub_metering_1,type="n",ylab="Energy sub metering"))
# plot each zones time series
with(febPower,lines(realTime,Sub_metering_1))
with(febPower,lines(realTime,Sub_metering_2,col="red"))
with(febPower,lines(realTime,Sub_metering_3,col="blue"))
# annotate with legend
legend("topright",lwd=1,col = c("black","red","blue"),
       text.col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# write to the png graphics device
dev.copy(png,file = "plot3.png")
dev.off()