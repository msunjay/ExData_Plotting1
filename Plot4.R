##Set working directory to folder with unzipped file containing data to analyze. 
setwd("~/R/Data Sets/Exploratory Data Analysis")
## Read in the data from the directory(Similiar to Plot1)
whole_data <- read.table("~/R/Data Sets/Exploratory Data Analysis/household_power_consumption.txt", header = T, sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")

## Subset the full data to extract the data pertaining to the required dates
Req_data<- subset(whole_data, (whole_data$Date =="1/2/2007" | whole_data$Date == "2/2/2007"))

## Converting the dates and times for clearer data 
datetime <- strptime(paste(Req_data$Date, Req_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Subsetting the data needed to plot the third plot
GlobalActivePower<- as.numeric(Req_data$Global_active_power)
GlobalReactivePower<- as.numeric(Req_data$Global_reactive_power)
Voltage<- as.numeric(Req_data$Voltage)
subMetering1<- as.numeric(Req_data$Sub_metering_1)
subMetering2<- as.numeric(Req_data$Sub_metering_2)
subMetering3<- as.numeric(Req_data$Sub_metering_3)

##Making Plots for the 2 by 2 structure for the four plots
png("Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
##Top Left Plot
plot(datetime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power")
##Top Right Plot
plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
##Bottom Left Plot
plot(datetime, subMetering1, type = "l", col = "black", xlab = "", ylab = "Energy Sub Metering")
lines(datetime, subMetering2, col = "Red")
lines(datetime, subMetering3, col = "Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("Black", "Red", "Blue"), cex = .9)
##Bottom Right
plot(datetime, GlobalReactivePower, type = "l", col = "Black", xlab = "datetime", ylab = "Global Reactive Power")
dev.off()