# Clean up workspace
rm(list=ls())


# Read the dataset from txt file within Date limitation 
mydata <- read.table("./household_power_consumption.txt",header=F, sep=';', na.strings="?",stringsAsFactors=F,skip = 66637, nrows = 2880)
header <- read.table('./household_power_consumption.txt', nrows = 1, header = F, sep =';', stringsAsFactors = FALSE)
names(mydata)<-header


# Plot
png("plot1.png", width=480, height=480)
hist(mydata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()








