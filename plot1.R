# File with all power data
meterData <- "../household_power_consumption.txt"

# Write Feb 1, Feb 2, 2007 data to this file, and use for plots 2, 3, and 4.
csvData   <- "../feb_1_2_2007.csv"
# Regular expression to get Feb 1, Feb 2, 2007n power data
rgx <- "^[12]/2/2007|^[A-Za-z]"

# Function to get data for the date/times specified by the regular expression,
# and write it to the specified CSV file.
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

# Function to read power data from CSV file specified above.
getPowerData <- function (csvFile) {
        read.csv(csvFile, sep = ';', stringsAsFactors = FALSE)
}

# Get data for specied date, and write to csv file.
rwMatchCSV(meterData, csvData, rgx)

# Read CSV file for plot processing.
meter <- getPowerData(csvData)

hist(meter$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png,'plot1.png')
dev.off()
