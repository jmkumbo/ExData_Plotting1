getwd()
setwd("C:/Users/Admin/Desktop/Coursera/Exploratory Data Analysis/ExData_Plotting1")
File = "C:/Users/Admin/Desktop/Coursera/Exploratory Data Analysis/ExData_Plotting1/household_power_consumption.txt"
data = read.csv(File, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

data$Date = as.Date(data$Date, format="%d/%m/%Y")

subsetdata = subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

dev.copy(png, file = "plot1.png", width = 480, height = 480, bg = "transparent", units = "px")
hist(subsetdata$Global_active_power, main = "Global Active Power", col = "red",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",breaks = 12,
     ylim = c(0, 1200))

dev.off()