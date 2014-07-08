getFebPower <-function()
{
  # First. get the raw data file, if it doesn't already exist
  if (!file.exists("./exdata-data-household_power_consumption.zip"))
  {
    fileUrl <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile="./exdata-data-household_power_consumption.zip", method = "curl")
  }
  # Now read the dataset
  powerd <- read.table(unz("./exdata-data-household_power_consumption.zip","household_power_consumption.txt"), sep=";",header=T,
                       stringsAsFactors=F)
  # Convert the dates so that they can be easily manipulated
  powerd$realDate <-as.Date(powerd$Date, format = "%d/%m/%Y")
  powerd$realTime <-strptime(paste(powerd$Date,powerd$Time,sep = " "),format="%d/%m/%Y %H:%M:%S")
  # Select the required data for the dates in Feb
  febPower <- subset(powerd,(realDate == as.Date("2007-02-01",format = "%Y-%m-%d") | realDate == as.Date("2007-02-02",format = "%Y-%m-%d")))
  # release the original raw data
  remove(powerd)
  return(febPower)
}