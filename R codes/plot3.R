# Download the data available in the README and save it in your working directory


Sys.setlocale(category = "LC_ALL", locale = "english")
master <- as.character(unzip("exdata_data_household_power_consumption.zip",list = TRUE)$Name) #Get the dataset's file names
ori_data  <- read.csv(unz("exdata_data_household_power_consumption.zip", master),nrows = 2075259 , sep = ";",header=TRUE) #Read dataset
date1 <- "1/2/2007"; date2 <- "2/2/2007"    #Dates of interest
data <- ori_data[ori_data$Date == date2 | ori_data$Date == date1,];data[data == "?" ] <- NA   #Obtain data's subsets of interest
data$Date <- as.Date(data$Date, "%d/%m/%Y") #Convert the Date and Time variables to Date/Time classes
data$DateTime <-paste(data$Date,data$Time); data$DateTime <- strptime(data$DateTime,"%Y-%m-%d %H:%M:%S",tz="")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)

# Create and save plot 3
png(file="plot3.png",width=480, height=480)
plot(data$DateTime,data$Sub_metering_1,ylim=range(c(0,max(data$Sub_metering_1))),type="l",xlab="",ylab="Energy sub metering")
par(new = TRUE)
plot(data$DateTime,data$Sub_metering_2, ylim=range(c(0,max(data$Sub_metering_1))),col="red",type="l",xlab ="",ylab="")
par(new = TRUE)
plot(data$DateTime,data$Sub_metering_3, ylim=range(c(0,max(data$Sub_metering_1))),col="blue",type="l",xlab ="",ylab="")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1:3, cex=0.9)
dev.off()
