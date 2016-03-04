##Set working directory to folder with unzipped file containing data to analyze. 
setwd("~/R/Data Sets/Exploratory Data Analysis")
## Read in the data from the directory(Similiar to Plot1)
whole_data <- read.table("~/R/Data Sets/Exploratory Data Analysis/household_power_consumption.txt", header = T, sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")
## Subset the full data to extract the data pertaining to the required dates
Req_data<- subset(whole_data, (whole_data$Date =="1/2/2007" | whole_data$Date == "2/2/2007"))
## Converting the dates and times for clearer data 
datetime <- strptime(paste(Req_data$Date, Req_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Req_data$datetime <- as.POSIXct(datetime)
##Subsetting the data needed to plot the second Plot
GlobalActivePower<- as.numeric(Req_data$Global_active_power)
#Plotting Plot 2 with Global Active Power values
plot(datetime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()
