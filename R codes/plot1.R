# Download the data available in the README and save it in your working directory

master <- as.character(unzip("exdata_data_household_power_consumption.zip",list = TRUE)$Name) #Get the dataset's file names
ori_data  <- read.csv(unz("exdata_data_household_power_consumption.zip", master),nrows = 2075259 , sep = ";",header=TRUE) #Read dataset
date1 <- "1/2/2007"; date2 <- "2/2/2007"    #Dates of interest
data <- ori_data[ori_data$Date == date2 | ori_data$Date == date1,]; data[data == "?" ] <- NA   #Obtain data's subsets of interest
data$Global_active_power <- as.numeric(data$Global_active_power)

# Create and save plot 1
png(file="plot1.png",width=480, height=480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowats)", main = "Global Active Power")
dev.off()
