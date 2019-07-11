#Data Import
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data1 <- read.table(unz(temp, "household_power_consumption.txt"),sep = ";",header = TRUE,stringsAsFactors = "FALSE")
unlink(temp)

data<-subset(data1,dmy(data1$Date)>=dmy("01/02/2007") & dmy(data1$Date)<=dmy("02/02/2007"))
data$Time<-hms(data$Time)
datetime <-strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Plot
png("plot3.png")
plot(datetime,as.numeric(data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, as.numeric(data$Sub_metering_2), col = "red")
lines(datetime, as.numeric(data$Sub_metering_3), col = "blue")
legend(x="topright", legend=c(names(data)[7],names(data)[8],names(data)[9]), col = c("black","red","blue"), lwd = 2)
dev.off()