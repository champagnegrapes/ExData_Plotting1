##This code creates the fourth assigned plot

##Set filepaths and working directory
wd <- file.path("~/Desktop","Coursera","Exploratory","Exploratory1")
repoPath <- file.path(wd, "ExData_Plotting1","ExData_Plotting1")
setwd(wd)

##Import the data and subset to the appropriate period
householdData <- read.delim("household_power_consumption.txt",sep=";")
householdData$Date <- as.Date(householdData$Date,format="%d/%m/%Y")
householdDataSub <- householdData[householdData$Date >= as.Date("2007-02-01"),]
householdDataSub <- householdDataSub[householdDataSub$Date <= as.Date("2007-02-02"),]

#Convert important variables to numeric
householdDataSub$Global_active_power <- as.numeric(householdDataSub$Global_active_power)

householdDataSub$Sub_metering_1 <- as.numeric(householdDataSub$Sub_metering_1)
householdDataSub$Sub_metering_2 <- as.numeric(householdDataSub$Sub_metering_2)
householdDataSub$Sub_metering_3 <- as.numeric(householdDataSub$Sub_metering_3)

householdDataSub$Voltage <- as.numeric(householdDataSub$Voltage)

householdDataSub$Global_reactive_power <- as.numeric(householdDataSub$Global_reactive_power)
##Construct the fourth plot

png(filename=file.path(repoPath,"Plot4.png"))
par(mfrow=c(2,2))
par(mar=c(4,4,4,2))
#plot upper left
plot(householdDataSub$Global_active_power2, type="l",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
axis(1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
#plot upper right
plot(householdDataSub$Voltage, type="l",xaxt="n",yaxt="n",xlab="datetime",ylab="Voltage")
axis(1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
axis(2,at=c(800,1200,1600,2000),labels=c("234","238","242","246"))
axis(2,at=c(1000,1400,1800),labels=c("","",""))
#plot bottom left
plot(householdDataSub$Sub_metering_1, type="l",xlab="",xaxt="n",ylab="Energy sub metering")
lines(householdDataSub$Sub_metering_2, col="red")
lines(householdDataSub$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),cex=.25)
axis(1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
#plot bottom right
plot(householdDataSub$Global_reactive_power, type="l",xaxt="n",yaxt="n",xlab="datetime",ylab="Global_reactive_power")
axis(1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
axis(2,at=c(0,45,90,135,180,225),labels=c("0.0","0.1","0.2","0.3","0.4","0.5"))

dev.off()
