#
# plot4.R charts multiple views of the energy consumption in a house
# for 2 days in Feb 2007
#

# first call out to utility function to get the required dataset
source("getFebPower.R")
febPower <- getFebPower()
# Set up the plotting area
par(mfrow = c(2,2))
# active power histogram
with(febPower,plot(realTime,Global_active_power,type="n",ylab="Global Active Power",xlab = ""))
with(febPower,lines(realTime,Global_active_power))
# voltage time series
with(febPower,plot(realTime,Voltage,type="n",ylab="Voltage",xlab="datetime"))
with(febPower,lines(realTime,Voltage))
# sub metering time series
with(febPower,plot(realTime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(febPower,lines(realTime,Sub_metering_1))
with(febPower,lines(realTime,Sub_metering_2,col="red"))
with(febPower,lines(realTime,Sub_metering_3,col="blue"))
legend("topright",lwd=1,col = c("black","red","blue"), cex = 0.8,
       text.col=c("black","red","blue"),bty = "n", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# reactive power time series
with(febPower,plot(realTime,Global_reactive_power,type="n",xlab="datetime"))
with(febPower,lines(realTime,Global_reactive_power))
dev.copy(png,file = "plot4.png")
dev.off()