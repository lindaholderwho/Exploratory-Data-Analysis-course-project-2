## Load datas:
NEI <- readRDS("G:\\data science\\course 4\\assignment\\summarySCC_PM25.rds")
SCC <- readRDS("G:\\data science\\course 4\\assignment\\Source_Classification_Code.rds")

Bal<-subset(NEI,fips=="24510")
total_emission_Bal<-aggregate(Emissions~year+type,data=Bal,sum)
g<-ggplot(data=total_emission_Bal,aes(year,Emissions))
g+geom_point()+geom_smooth(method = "lm",se=FALSE,lwd=2,color="purple")+facet_grid(.~type)+labs(x="Year",y="Baltimore Total Emission", title="Baltimore Total Emission")

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()