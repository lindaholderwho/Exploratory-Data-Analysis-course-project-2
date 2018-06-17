## Load datas:
NEI <- readRDS("G:\\data science\\course 4\\assignment\\summarySCC_PM25.rds")
SCC <- readRDS("G:\\data science\\course 4\\assignment\\Source_Classification_Code.rds")

total_emission<-aggregate(Emissions~year,data=NEI,sum)
plot(total_emission$year,total_emission$Emissions, type="l", xlab="Year", ylab="Total PM2.5 Emission", main="Total PM2.5 Emission")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()