##This code creates the first assigned plot

##Set filepaths and working directory
wd <- file.path("~/Desktop","Coursera","Exploratory","Exploratory1")
repoPath <- file.path(wd, "ExData_Plotting1","ExData_Plotting1")
setwd(wd)

##Import the data and subset to the appropriate period
householdData <- read.delim("household_power_consumption.txt",sep=";")
householdData$Date <- as.Date(householdData$Date,format="%d/%m/%Y")
householdDataSub <- householdData[householdData$Date >= as.Date("2007-02-01"),]
householdDataSub <- householdDataSub[householdDataSub$Date <= as.Date("2007-02-02"),]

#Convert Global Active Power to numeric
householdDataSub$Global_active_power <- as.numeric(householdDataSub$Global_active_power)

##Construct the first plot
png(filename=file.path(repoPath,"Plot1.png"))
hist(householdDataSub$Global_active_power, xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()
