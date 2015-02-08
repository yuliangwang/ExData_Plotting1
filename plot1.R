#Script to make plot1.png
#Read data. Missing values encoded as ?
electric_power<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings = "?",stringsAsFactors = F)
#Convert date to R Date class
electric_power$Date<-strptime(electric_power$Date,format="%d/%m/%Y")
#Subset to 2007-02-01 and 2007-02-02
electric_power<-subset(electric_power,Date>=strptime("2007-02-01",format="%Y-%m-%d") & Date<=strptime("2007-02-02",format="%Y-%m-%d"))
#Set up plotting
png(file="plot1.png",width=480,height=480)
#Make histogram
with(electric_power,hist(Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red"))
dev.off()