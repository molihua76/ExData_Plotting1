# Read the dataset from txt file within Date limitation 
mydata <- read.table("./household_power_consumption.txt",header=F, sep=';', na.strings="?",stringsAsFactors=F,skip = 66637, nrows = 2880)
header <- read.table('./household_power_consumption.txt', nrows = 1, header = F, sep =';', stringsAsFactors = FALSE)
names(mydata)<-header

# Combine Date and Time together to form a new variable column datetime 
datetime <- strptime(paste(mydata$Date, mydata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
mydata$Datetime <- datetime

# Plot
png("plot2.png", width=480, height=480)
plot(mydata$Datetime,mydata$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()