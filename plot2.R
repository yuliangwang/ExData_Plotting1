#Script to generate plot2.png
#Read data. Missing values encoded as ?
electric_power<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings = "?",stringsAsFactors = F)
#Convert date to R Date class,combinig Date and Time into a single "date_time" variable
electric_power$date_time<-strptime(paste(electric_power$Date,electric_power$Time),format="%d/%m/%Y %H:%M:%S")
#Subset to 2007-02-01 and 2007-02-02
electric_power<-subset(electric_power,date_time>=strptime("2007-02-01 0:0:0",format="%Y-%m-%d %H:%M:%S") & date_time<=strptime("2007-02-03 0:0:0",format="%Y-%m-%d %H:%M:%S"))
#Set up plotting
png(file="plot2.png",width=480,height=480)
#set type="l" to make the line plot
with(electric_power,plot(date_time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()