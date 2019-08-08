#' El Nino Script
#' Author: Jessica Diehl
#' Data Source: https://archive.ics.uci.edu/ml/datasets/El+Nino
#' Style Guide: https://style.tidyverse.org/index.html

#' Load Dependencies ---------------------------------
library(rworldmap)

#' Load El Nino Data ---------------------------------
elnino <- read.csv("D:/CSCI620_All/CSCI620_DataSets/elnino/elnino.csv")
newMap <- getMap(resolution="low")
colnames(elnino) <- c("Date", 
			    "ID", 
			    "Latitude", 
			    "Longitude", 
			    "Zonal Winds", 
			    "Meridional Winds", 
			    "Humidity", 
			    "Air Temperature", 
			    "Sea Surface Temperature")
elnino$tempdiv <- ((as.numeric(as.character(
			  elnino$'Air Temperature'))*(9/5))+32)/100

#' Plot Data -----------------------------------------
plot(newMap, xlim=c(-10, 10), ylim=c(-150, 170), asp=1)
points(elnino$Longitude, 
	 elnino$Latitude, 
	 col="blue", 
	 cex=elnino$tempdiv)
#' Add legend
legend(-160, 
	 -30,
	 box.lty=1,
	 legend=c("Bouy"), 
	 col=c("blue"), 
	 pch=c(1))
#' Add title and axis labels
title(line=-6,
	main="El Nino Bouy Temperatures")
title(line=-5,
	xlab="Longitude")
title(line=-1,
	ylab="Lattitude")

