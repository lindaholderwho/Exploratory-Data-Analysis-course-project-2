## Load datas:
NEI <- readRDS("G:\\data science\\course 4\\assignment\\summarySCC_PM25.rds")
SCC <- readRDS("G:\\data science\\course 4\\assignment\\Source_Classification_Code.rds")

vehicle<-grepl("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE)
vehicleSCC<-SCC[vehicle,]$SCC
vehicleNEI<-NEI[NEI$SCC %in% vehicleSCC,]

Balvehicle<-subset(vehicleNEI,fips==24510)
Baltotalvehicle<-aggregate(Emissions~year,data=Balvehicle,sum)
plot(Baltotalvehicle$year,Baltotalvehicle$Emissions,type = "l",xlab="year", ylab = "Total PM2.5 emission of vehicle",main="Total PM2.5 emissions of vehicle in Baltimore City")
points(Baltotalvehicle$year,Baltotalvehicle$Emissions,pch=6,col="blue")

dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()
