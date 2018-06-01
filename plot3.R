##################################################
##  coursera Exploratory Data Analysis          ##
##           course project I                   ##
## Andreas Windisch, andreas.windisch@yahoo.com ##
##################################################

cat("\n")
cat("---------------------------------------------\n")
cat("   Coursera 'Exploratory Data Analysis'\n ")
cat("         course project I R script 3\n")
cat(" A. Windisch, andreas.windisch@yahoo.com\n")
cat("               June 2018\n")
cat("---------------------------------------------\n")


##################################################
#         setting wdir and loading data          #
##################################################
setwd("/home/andreas/GitHub/ExData_Plotting1")
cat("Downloading and reading data. This may take a while... \n")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="data.zip")
data <- read.csv(unz("data.zip","household_power_consumption.txt"), header=TRUE,sep=";")
cat("Done.\n")
cat("Dimensions: ", dim(data), "\n")
cat("Picking data from 2007-02-01 and 2007-02-02\n")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data <- subset(data,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
cat("Dimensions: ", dim(data), "\n")
cat("Combining dates and times.\n")
data$Date <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

cat("Createing graph and storing it to plot3.png\n")

png(filename = "plot3.png",width = 480, height = 480)
par(mar=c(3,5,3,3))
plot(data$Date,data$Sub_metering_1, type="l", xlab=c("Thu","Fri","Sat"),ylab="Energy sub metering")
lines(data$Date,data$Sub_metering_2, type="l", col="red")
lines(data$Date,data$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
cat( "Done. End of script.\n")




