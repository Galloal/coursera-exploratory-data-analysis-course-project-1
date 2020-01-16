#Exploratory Data Analysis - Semana 1 - Course Project 1
## plot 4

household_power_consumption <- read.csv("~/R/Exploratory Data Analysis/exdata_data_household_power_consumption/household_power_consumption.txt", header=FALSE, sep=";")
names(household_power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
Power <- subset(household_power_consumption, Date == c("1/2/2007" ,"2/2/2007"))

datetime<- strptime(paste(Power$Date, Power$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(as.character(Power$Global_active_power))
SubMetering1 <- as.numeric(as.character(Power$Sub_metering_1))
SubMetering2 <- as.numeric(as.character(Power$Sub_metering_2))
SubMetering3 <- as.numeric(as.character(Power$Sub_metering_3))
Voltage <- as.numeric(as.character(Power$Voltage))
GlobalReactivePower <- as.numeric(as.character(Power$Global_reactive_power))

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()