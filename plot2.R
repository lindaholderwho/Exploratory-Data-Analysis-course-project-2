## Load datas:
NEI <- readRDS("G:\\data science\\course 4\\assignment\\summarySCC_PM25.rds")
SCC <- readRDS("G:\\data science\\course 4\\assignment\\Source_Classification_Code.rds")

Bal<-subset(NEI,fips=="24510")
total_emission_Bal<-aggregate(Emissions~year,data=Bal,sum)
plot(total_emission_Bal$year,total_emission_Bal$Emissions, pch=17,type="l", xlab="Year", ylab="Baltimore Total PM2.5 Emission", main="Baltimore Total PM2.5 Emission")
points(total_emission_Bal$year,total_emission_Bal$Emissions, pch=7)

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()