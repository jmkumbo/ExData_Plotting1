getwd()
setwd("C:/Users/Admin/Desktop/Coursera/Exploratory Data Analysis/ExData_Plotting1")
File = "C:/Users/Admin/Desktop/Coursera/Exploratory Data Analysis/ExData_Plotting1/household_power_consumption.txt"
data = read.csv(File, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

data$Date = as.Date(data$Date, format="%d/%m/%Y")

subsetdata = subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

date_time = paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$d_time <- as.POSIXct(date_time)

with(subsetdata, {
  plot(d_time, Sub_metering_1, type="l",
       ylab="Energy sub metering", xlab="")
  lines(d_time, Sub_metering_2,col='Red')
  lines(d_time, Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, filename ="plot3.png", width=480, height=480, bg = "transparent", units = "px")

dev.off()
