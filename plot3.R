data <- read.csv("household_power_consumption.txt", sep = ";")
data[,1] <- as.Date(data[,1], "%d/%m/%Y")

data1 <- subset(data, data[,1] == as.Date("01/02/2007", "%d/%m/%Y"))
data2 <- subset(data, data[,1] == as.Date("02/02/2007", "%d/%m/%Y"))
data <-  rbind(data1, data2)
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S") 

png("plot3.png", width = 480, height = 480)
plot(data[,10],as.numeric(as.character(data[,7])), type="l", xlab="", ylab="Energy sub metering")
lines(data[,10],as.numeric(as.character(data[,8])), col="red")
lines(data[,10],as.numeric(as.character(data[,9])), col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1)
dev.off()
