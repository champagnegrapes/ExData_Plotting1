##This code creates the second assigned plot

##Set filepaths and working directory
wd <- file.path("~/Desktop","Coursera","Exploratory","Exploratory1")
repoPath <- file.path(wd, "ExData_Plotting1","ExData_Plotting1")
setwd(wd)

##Import the data and subset to the appropriate period
householdData <- read.delim("household_power_consumption.txt",sep=";")
householdData$Date <- as.Date(householdData$Date,format="%d/%m/%Y")
householdDataSub <- householdData[householdData$Date >= as.Date("2007-02-01"),]
householdDataSub <- householdDataSub[householdDataSub$Date <= as.Date("2007-02-02"),]

#Convert Global Active Power to numeric and a scaled version
householdDataSub$Global_active_power <- as.numeric(householdDataSub$Global_active_power)
householdDataSub$Global_active_power2 <- householdDataSub$Global_active_power/500

##Construct the second plot
png(filename=file.path(repoPath,"Plot2.png"))
plot(householdDataSub$Global_active_power2, type="l",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
axis(1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
dev.off()

