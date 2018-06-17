## Load datas:
NEI <- readRDS("G:\\data science\\course 4\\assignment\\summarySCC_PM25.rds")
SCC <- readRDS("G:\\data science\\course 4\\assignment\\Source_Classification_Code.rds")

vehicle<-grepl("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE)
vehicleSCC<-SCC[vehicle,]$SCC
vehicleNEI<-NEI[NEI$SCC %in% vehicleSCC,]
LAvehicleNEI<-subset(vehicleNEI,fips=="06037")
Balvehicle<-subset(vehicleNEI,fips==24510)
Balvehicle$city<-"Baltimore City"
LAvehicleNEI$city<-"Los Angeles County"
Baltotalvehicle<-aggregate(Emissions~year+city,data=Balvehicle,sum)
LAtotalvehicle<-aggregate(Emissions~year+city,data=LAvehicleNEI,sum)
bothBalLA<-rbind(Baltotalvehicle,LAtotalvehicle)

library(ggplot2)
ggplot()
ggplot(bothBalLA,aes(year,Emissions))+geom_point(alpha=1/3)+facet_grid(.~city)+geom_smooth(method = "lm",se=FALSE,size=2,color="blue")+labs(x="year",y="total PM2.5 Emissions of vehicles",main="total PM2.5 Emissions of vehicles[Baltimore VS L.A.]")

dev.copy(png, file="plot6.png", height=480, width=480)
dev.off()