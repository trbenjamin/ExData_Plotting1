# Use CSV data from plot1.R
csvData   <- "../feb_1_2_2007.csv"


q <- read.csv(csvData,sep=';',stringsAsFactors=FALSE)
q1 <- q
c1 <- paste(q$Date, q$Time)
c2 <- q$Global_active_power
q1 <- cbind(c1,c2)
z<-colnames(q)
colnames(q1) <- c( paste0(z[1],z[2]) , z[3] )
q1 <- cbind(c1,c2)
colnames(q1) <- c( paste0(z[1],z[2]) , z[3] )
q1<-as.data.frame(q1)
q1$DateTime <- strftime ( strptime(q1$DateTime, "%d/%m/%Y %H:%M:%S"), "%Y-%m-%d %H:%M:%S")
q1$DateTime <- as.POSIXlt(q1$DateTime)
plot( q1$DateTime , q1$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')

dev.copy(png,'plot2.png')
dev.off()