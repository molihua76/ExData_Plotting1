# Read the dataset from txt file within Date limitation 
mydata <- read.table("./household_power_consumption.txt",header=F, sep=';', na.strings="?",stringsAsFactors=F,skip = 66637, nrows = 2880)
header <- read.table('./household_power_consumption.txt', nrows = 1, header = F, sep =';', stringsAsFactors = FALSE)
names(mydata)<-header

# Combine Date and Time together to form a new variable column datetime 
datetime <- strptime(paste(mydata$Date, mydata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
mydata$Datetime <- datetime

# Plot
png("plot3.png", width=480, height=480)
with(mydata, plot(Datetime,Sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering"))
points(mydata$Datetime,mydata$Sub_metering_1, col="black", type="l")
points(mydata$Datetime,mydata$Sub_metering_2, col="red", type="l")
points(mydata$Datetime,mydata$Sub_metering_3, col="blue", type="l")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
dev.off()