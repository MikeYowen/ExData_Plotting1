data <- read.csv("household_power_consumption.txt", sep = ";")
data[,1] <- as.Date(data[,1], "%d/%m/%Y")

data1 <- subset(data, data[,1] == as.Date("01/02/2007", "%d/%m/%Y"))
data2 <- subset(data, data[,1] == as.Date("02/02/2007", "%d/%m/%Y"))
data <-  rbind(data1, data2)
png("plot1.png", width = 480, height = 480)
hist(as.numeric(data[,3]), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
