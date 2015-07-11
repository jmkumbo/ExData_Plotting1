getwd()
setwd("C:/Users/Admin/Desktop/Coursera/Exploratory Data Analysis/ExData_Plotting1")
File = "C:/Users/Admin/Desktop/Coursera/Exploratory Data Analysis/ExData_Plotting1/household_power_consumption.txt"
data <- read.csv(File, header=T, sep=';', na.strings="?", stringsAsFactors=F)
data$Date = as.Date(data$Date, format="%d/%m/%Y")

subsetdata = subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

date_time = paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$d_time = as.POSIXct(date_time)

plot(subsetdata$d_time, subsetdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, filename ="plot2.png", width=480, height=480, bg = "transparent", units = "px")

dev.off()
