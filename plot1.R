## plot1: Should reproduce one plot
#######################################

## Set directory if necessary
#### setwd("C:/...../ExData_Plotting1")
#### getwd()


## Load the Data
#######################################
#### load first row with headers, then relevant data and adjust headers
#### EP for "Electric Power"-Data
#### It is assumed, that the data-file is in the folder

EP_firstrow <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?",
                          nrows=1)
EP <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?",
                 skip=66636, nrows=2880)
colnames(EP) <- colnames(EP_firstrow)

## Conversion of Date and Time
## 
x <- paste(EP$Date, EP$Time)
#### make one new column for a Date & Time - format
EP$completeTime <- strptime(x, format="%d/%m/%Y %H:%M:%S")
EP$Date <- as.Date(EP$Date, format="%d/%m/%Y")
#### set system to US-locals
Sys.setlocale(category = "LC_TIME", locale = "US")

## Plot1
######################################
#### plotting in png-file, default is 480x480 pixels
png(file="plot1.png")
hist(EP$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()

######################################