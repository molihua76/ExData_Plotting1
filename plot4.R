# Read the dataset from txt file within Date limitation 
mydata <- read.table("./household_power_consumption.txt",header=F, sep=';', na.strings="?",stringsAsFactors=F,skip = 66637, nrows = 2880)
header <- read.table('./household_power_consumption.txt', nrows = 1, header = F, sep =';', stringsAsFactors = FALSE)
names(mydata)<-header

# Combine Date and Time together to form a new variable column datetime 
datetime <- strptime(paste(mydata$Date, mydata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
mydata$Datetime <- datetime

## Create 4 plots(2 by 2)
# Set graphic device and layout
png("plot4.png", width=480, height=480) 
par(mfrow=c(2,2))

#plot1
plot(mydata$Datetime,mydata$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot2
plot(mydata$Datetime,mydata$Voltage, type="l", xlab="datetime", ylab="Voltage")

#plot3
with(mydata, plot(Datetime,Sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering"))
points(mydata$Datetime,mydata$Sub_metering_1, col="black", type="l")
points(mydata$Datetime,mydata$Sub_metering_2, col="red", type="l")
points(mydata$Datetime,mydata$Sub_metering_3, col="blue", type="l")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

#plot4
plot(mydata$Datetime,mydata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# turn off graphic device
dev.off()  