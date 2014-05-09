## plot3: Should reproduce one plot
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

######################################

## Plot3
png(file="plot3.png")
plot(EP$completeTime, EP$Sub_metering_1, ylab="Energy sub metering", xlab="",
     type="n")
lines(EP$completeTime, EP$Sub_metering_1, col="black")
lines(EP$completeTime, EP$Sub_metering_2, col="red")
lines(EP$completeTime, EP$Sub_metering_3, col="blue")
legend("topright", lty="solid", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

######################################