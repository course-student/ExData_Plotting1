#Reading data
all_data <- read.csv("household_power_consumption.txt",header=TRUE,sep=';',na.strings="?")

#Converting date and time
dateTime <- paste(all_data$Date,all_data$Time)
dateTime <- strptime(dateTime, "%e/%m/%Y %H:%M:%S")
all_data <- cbind(all_data,dateTime)

#Subseting to select data from the days 01-fev-2007 and 02-fev-2007
mydata <- all_data[all_data$Date == '1/2/2007' | all_data$Date == '2/2/2007',]

#Generate plot 2 in a png file
png(filename = "plot2.png", width = 480, height = 480)
plot(mydata$dateTime, mydata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
