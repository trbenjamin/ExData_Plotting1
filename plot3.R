# Use CSV data from plot1.R
csvData   <- "../feb_1_2_2007.csv"

q <- read.csv(csvData,sep=';',stringsAsFactors=FALSE)
c1 <- paste(q$Date, q$Time)
q1 <- cbind(c1,q)
z <- colnames(q)
colnames(q1)[1] <- paste0(z[1],z[2])

q1$DateTime <- strftime ( strptime(q1$DateTime, "%d/%m/%Y %H:%M:%S"), "%Y-%m-%d %H:%M:%S")
q1$DateTime <- as.POSIXlt(q1$DateTime)

plot(  q1$DateTime , q1$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines( q1$DateTime , q1$Sub_metering_2, type = 'l', col = 'red')
lines( q1$DateTime , q1$Sub_metering_3, type = 'l', col = 'blue')
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,'plot3.png')
dev.off()