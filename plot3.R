## Load in the data
data<-read.table(file = "household_power_consumption.txt", header = T, 
                 sep = ";", na.strings = "?")
## Format the Date and Time variable for further analysis
data$Date<-as.character(data$Date)
data$Time<-as.character(data$Time)
data$Time<-paste(data$Date,data$Time)
data$Time<-strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
## Filter the data by date
data<-data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
## Plot the chart
par(cex = 0.7)
plot(data$Time, data[,7], type = "n", main = NULL, xlab = "", 
     ylab = "Energy sub metering")
lines(data$Time, data[,7], type= "l")
lines(data$Time, data[,8], type= "l", col = "red")
lines(data$Time, data[,9], type= "l", col = "blue")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = colnames(data)[7:9])
## Write the plot in png device
dev.copy(png, file = "plot3.png")
dev.off()