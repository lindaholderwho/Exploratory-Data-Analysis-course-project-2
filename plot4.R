## Load datas:
NEI <- readRDS("G:\\data science\\course 4\\assignment\\summarySCC_PM25.rds")
SCC <- readRDS("G:\\data science\\course 4\\assignment\\Source_Classification_Code.rds")

combustionR<-grepl("combustion",SCC$SCC.Level.One:SCC$SCC.Level.Four,ignore.case = TRUE)
coalR<-grepl("coal",SCC$SCC.Level.One:SCC$SCC.Level.Four,ignore.case = TRUE)
coalCombustion<-(combustionR&coalR)

coalCombustionSCC<-SCC[coalCombustion,]$SCC
coalCombustionNEI<-NEI[NEI$SCC %in% coalCombustionSCC,]
coalCombustionNEI_total<-aggregate(Emissions~year,data=coalCombustionNEI,sum)

plot(coalCombustionNEI_total$year,coalCombustionNEI_total$Emissions/10^5,type = "l",xlab="Year", ylab="Total PM2.5 Emission (10^5 Tons)",main = "PM2.5 Coal Combustion Source Emissions Across US from 1999-2008")
points(coalCombustionNEI_total$year,coalCombustionNEI_total$Emissions/10^5,pch=4,col="red")
 

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()