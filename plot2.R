#Exploratory Data Analysis - Semana 1 - Course Project 1
## plot2

household_power_consumption <- read.csv("~/R/Exploratory Data Analysis/exdata_data_household_power_consumption/household_power_consumption.txt", header=FALSE, sep=";")
names(household_power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
Power <- subset(household_power_consumption, Date == c("1/2/2007" ,"2/2/2007"))
GlobalActivePower <- as.numeric(as.character(Power$Global_active_power))

datetime<- strptime(paste(Power$Date, Power$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()