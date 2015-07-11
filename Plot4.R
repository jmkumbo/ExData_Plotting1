getwd()
setwd("C:/Users/Admin/Desktop/Coursera/Exploratory Data Analysis/ExData_Plotting1")
File = "C:/Users/Admin/Desktop/Coursera/Exploratory Data Analysis/ExData_Plotting1/household_power_consumption.txt"
data = read.csv(File, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

data$Date = as.Date(data$Date, format="%d/%m/%Y")

subsetdata = subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

date_time = paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$d_time <- as.POSIXct(date_time)

par(mfrow = c(2, 2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subsetdata, {
  # Top left corner
  plot(d_time, Global_active_power,
       type = "l",
       xlab = "", ylab = "Global Active Power")
  # Top right corner
  plot(d_time, Voltage,
       type = "l",
       xlab = "datetime", ylab = "Voltage")
  # Bottom left corner
  plot(d_time, Sub_metering_1,
       type = "l",col = "black",
       xlab = "", ylab = "Energy sub metering")
  lines(d_time, Sub_metering_2, col = "red")
  lines(d_time, Sub_metering_3, col = "blue")

  legend("topright",bty = "n",col = c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1, lwd=1)
  # Bottom right corner
  plot(d_time, Global_reactive_power,
       type = "l",
       col = "black",
       xlab = "datetime", ylab = colnames(subsetdata)[4])
  dev.copy(png, filename ="plot4.png", width=480, height=480, bg = "transparent", units = "px")
  
  dev.off()
})