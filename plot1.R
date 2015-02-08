## Load in the data
data<-read.table(file = "household_power_consumption.txt", header = T, 
                 sep = ";", na.strings = "?")
## Filter the data by date
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
data<-data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
## Plot the histogram chart
par(cex = 0.8, bg = "transparent")
hist(data[,3], col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
## Write the plot in png device
dev.copy(png, file = "plot1.png")
dev.off()