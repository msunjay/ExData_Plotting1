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
subMetering1<- as.numeric(Req_data$Sub_metering_1)
subMetering2<- as.numeric(Req_data$Sub_metering_2)
subMetering3<- as.numeric(Req_data$Sub_metering_3)

#Plotting Plot 3 with Energy Submetering Values after creating a file for a PNG file
png("Plot3.png", width = 480, height = 480)
plot(datetime,subMetering1, type = "l", ylab= "Energy Submetering", xlab = "")
lines(datetime,subMetering2, type = "l", col="Red")
lines(datetime, subMetering3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("Black", "Red", "Blue"), cex = 1.0)

##Convert Plot 3 into a PNG file. 
dev.off()