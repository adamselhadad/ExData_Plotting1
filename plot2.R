#Data Import
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data1 <- read.table(unz(temp, "household_power_consumption.txt"),sep = ";",header = TRUE,stringsAsFactors = "FALSE")
unlink(temp)

data<-subset(data1,dmy(data1$Date)>=dmy("01/02/2007") & dmy(data1$Date)<=dmy("02/02/2007"))
data$Time<-hms(data$Time)
datetime <-strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Plot
png("plot2.png")
plot(datetime,as.numeric(data$Global_active_power)/1000, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off