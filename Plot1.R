##Set working directory to folder with unzipped file containing data to analyze. 
setwd("~/R/Data Sets/Exploratory Data Analysis")
## Read in the data from the directory
whole_data <- read.table("~/R/Data Sets/Exploratory Data Analysis/household_power_consumption.txt", header = T, sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")
## Subset the full data to extract the data pertaining to the required dates
Req_data<- subset(whole_data, (whole_data$Date =="1/2/2007" | whole_data$Date == "2/2/2007"))
## Converting the dates and times for clearer data 
datetime <- paste(as.Date(Req_data$Date), Req_data$Time)
Req_data$Datetime <- as.POSIXct(datetime)
##Subsetting the data needed to plot the first Histogram
GlobalActivePower<- as.numeric(Req_data$Global_active_power)
#Plotting Plot 1 with Global Active Power values
hist(GlobalActivePower, main= "Global Active Power", xlab= "Global Active Power (Kilowatts)", ylab = "Frequency", col = "Red")
##Convert Plot1 into a PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()