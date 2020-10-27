# Download the data available in the README and save it in your working directory


Sys.setlocale(category = "LC_ALL", locale = "english")
master <- as.character(unzip("exdata_data_household_power_consumption.zip",list = TRUE)$Name) #Get the dataset's file names
ori_data  <- read.csv(unz("exdata_data_household_power_consumption.zip", master),nrows = 2075259 , sep = ";",header=TRUE) #Read dataset
date1 <- "1/2/2007"; date2 <- "2/2/2007"    #Dates of interest
data <- ori_data[ori_data$Date == date2 | ori_data$Date == date1,];  #Obtain data's subsets of interest
data[data == "?" ] <- NA 
data$Date <- as.Date(data$Date, "%d/%m/%Y") #Convert the Date and Time variables to Date/Time classes
data$DateTime <-paste(data$Date,data$Time); data$DateTime <- strptime(data$DateTime,"%Y-%m-%d %H:%M:%S",tz="")

# Create and save plot 2
png(file="plot2.png",width=480, height=480)
plot(data$DateTime,data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowats)")
dev.off()
