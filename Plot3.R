##This code creates the third assigned plot

##Set filepaths and working directory
wd <- file.path("~/Desktop","Coursera","Exploratory","Exploratory1")
repoPath <- file.path(wd, "ExData_Plotting1","ExData_Plotting1")
setwd(wd)

##Import the data and subset to the appropriate period
householdData <- read.delim("household_power_consumption.txt",sep=";")
householdData$Date <- as.Date(householdData$Date,format="%d/%m/%Y")
householdDataSub <- householdData[householdData$Date >= as.Date("2007-02-01"),]
householdDataSub <- householdDataSub[householdDataSub$Date <= as.Date("2007-02-02"),]

#Convert sub meters to numeric
householdDataSub$Sub_metering_1 <- as.numeric(householdDataSub$Sub_metering_1)
householdDataSub$Sub_metering_2 <- as.numeric(householdDataSub$Sub_metering_2)
householdDataSub$Sub_metering_3 <- as.numeric(householdDataSub$Sub_metering_3)

##Construct the third plot

png(filename=file.path(repoPath,"Plot3.png"))
plot(householdDataSub$Sub_metering_1, type="l",xlab="",,xaxt="n",ylab="Energy sub metering")
lines(householdDataSub$Sub_metering_2, col="red")
lines(householdDataSub$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),cex=.75)
axis(1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
dev.off()