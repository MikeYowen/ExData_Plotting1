data <- read.csv("household_power_consumption.txt", sep = ";")
data[,1] <- as.Date(data[,1], "%d/%m/%Y")

data1 <- subset(data, data[,1] == as.Date("01/02/2007", "%d/%m/%Y"))
data2 <- subset(data, data[,1] == as.Date("02/02/2007", "%d/%m/%Y"))
data <-  rbind(data1, data2)
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width = 480, height = 480)
plot(data[,10],as.numeric(as.character(data[,3])), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
