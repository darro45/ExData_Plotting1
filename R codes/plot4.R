# Download the data available in the README and save it in your working directory


Sys.setlocale(category = "LC_ALL", locale = "english")
master <- as.character(unzip("exdata_data_household_power_consumption.zip",list = TRUE)$Name) #Get the dataset's file names
ori_data  <- read.csv(unz("exdata_data_household_power_consumption.zip", master),nrows = 2075259 , sep = ";",header=TRUE) #Read dataset
date1 <- "1/2/2007"; date2 <- "2/2/2007"    #Dates of interest
data <- ori_data[ori_data$Date == date2 | ori_data$Date == date1,];  #Obtain data's subsets of interest
data[data == "?" ] <- NA 
data$Date <- as.Date(data$Date, "%d/%m/%Y") #Convert the Date and Time variables to Date/Time classes
data$DateTime <-paste(data$Date,data$Time); data$DateTime <- strptime(data$DateTime,"%Y-%m-%d %H:%M:%S",tz="")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)

# Create and save plot 4 
png(file="plot4.png",width=480, height=480)
par(mfrow = c(2,2))
with(data,{
  plot(data$DateTime,data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowats)")
  plot(data$DateTime,data$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
  plot(data$DateTime,data$Sub_metering_1,ylim=range(c(0,max(data$Sub_metering_1))),type="l",xlab="",ylab="Energy sub metering")
  par(new = TRUE)
  plot(data$DateTime,data$Sub_metering_2, ylim=range(c(0,max(data$Sub_metering_1))),col="red",type="l",xlab ="",ylab="")
  par(new = TRUE)
  plot(data$DateTime,data$Sub_metering_3, ylim=range(c(0,max(data$Sub_metering_1))),col="blue",type="l",xlab ="",ylab="")
  legend("topright",legend=c("Submetering 1", "Submetering 2","Submetering 3"),col=c("black","red","blue"), lty=1:3, cex=0.7)
  plot(data$DateTime,data$Global_reactive_power, type = "l", xlab = "datetime",ylab ="Global_reactive_power")
})
dev.off()
