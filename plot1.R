##################################################
##  coursera Exploratory Data Analysis          ##
##           course project I                   ##
## Andreas Windisch, andreas.windisch@yahoo.com ##
##################################################

cat("\n")
cat("---------------------------------------------\n")
cat("   Coursera 'Exploratory Data Analysis'\n ")
cat("         course project I R script 1\n")
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
cat("Createing histogram and storing it to plot1.png\n")

png(filename = "plot1.png",width = 480, height = 480)
hist(as.numeric(as.character(data$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
cat( "Done. End of script.\n")




