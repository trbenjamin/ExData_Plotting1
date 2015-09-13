meterData <- "../household_power_consumption.txt"
csvData   <- "../feb_1_2_2007.csv"
rgx <- "^[12]/2/2007|^[A-Za-z]"

rwMatchCSV <- function (iFile, oFile, rgx = ".") {
        rcon <- file(iFile, open = 'r')
        wcon <- file(oFile, open = 'w')
        while (length(oneLine <- readLines(rcon, n=1, warn=FALSE)) > 0) {
                if (grepl(rgx, oneLine)) {
                        #print (oneLine)
                        writeLines(oneLine, wcon)
                }
        }
        close(rcon)
        close(wcon)
}

getPowerData <- function (csvFile) {
        read.csv(csvFile, sep = ';', stringsAsFactors = FALSE)
}

rwMatchCSV(meterData, csvData, rgx)

meter <- getPowerData(csvData)

hist(meter$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png,'plot1_01.png')
dev.off()
