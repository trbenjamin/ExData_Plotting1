# Use CSV data from plot1.R
csvData   <- "../feb_1_2_2007.csv"

q <- read.csv(csvData, sep=';',stringsAsFactors=FALSE)
c1 <- paste(q$Date, q$Time)
#c2 <- q$Global_active_power
q1 <- cbind(c1,q)
z <- colnames(q)
colnames(q1)[1] <- paste0(z[1],z[2])
#print ( colnames(q1))
#print ( head(q1,10) )

q1$DateTime <- strftime ( strptime(q1$DateTime, "%d/%m/%Y %H:%M:%S"), "%Y-%m-%d %H:%M:%S")
q1$DateTime <- as.POSIXlt(q1$DateTime)

par(mfrow = c(2,2))
# plot 1,1
plot( q1$DateTime , q1$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power')

# plot 1,2
plot( q1$DateTime , q1$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

# plot 2,1
plot(  q1$DateTime , q1$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines( q1$DateTime , q1$Sub_metering_2, type = 'l', col = 'red')
lines( q1$DateTime , q1$Sub_metering_3, type = 'l', col = 'blue')
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot 2,2
plot( q1$DateTime , q1$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
#legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,'plot4.png')
dev.off()