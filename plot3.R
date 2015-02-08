#Script to generate plot3.png
#Read data. Missing values encoded as ?
electric_power<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings = "?",stringsAsFactors = F)
#Convert date to R Date class,combinig Date and Time into a single "date_time" variable
electric_power$date_time<-strptime(paste(electric_power$Date,electric_power$Time),format="%d/%m/%Y %H:%M:%S")
#Subset to 2007-02-01 and 2007-02-02
electric_power<-subset(electric_power,date_time>=strptime("2007-02-01 0:0:0",format="%Y-%m-%d %H:%M:%S") & date_time<=strptime("2007-02-03 0:0:0",format="%Y-%m-%d %H:%M:%S"))
#Set up plotting
png(file="plot3.png",width=480,height=480)
#set type="l" to make the line plot
#Make plot for sub_metering_1, then add other sub_meterings and legend
with(electric_power,{plot(date_time,Sub_metering_1,type="l",xlab="",ylab="Global Active Power (kilowatts)",col="black")
                     lines(date_time,Sub_metering_2,col="red")
                     lines(date_time,Sub_metering_3,col="blue")
                     legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))})
dev.off()
