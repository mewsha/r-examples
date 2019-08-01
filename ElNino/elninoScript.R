elnino <- read.csv('D:\CSCI620_All\CSCI620_DataSets\elnino\elnino.csv')
library('rworldmap')
newMap <- getMap(resolution="high")
colnames(elnino) <- c("Date", "ID", "Latitude", "Longitude", "Zonal Winds", "Meridional Winds", "Humidity", "Air Temperature", "Sea Surface Temperature")
elnino$tempdiv <- ((as.numeric(as.character(elnino$'Air Temperature'))*(9/5))+32)/100
plot(newMap, xlim=c(-10, 10), ylim=c(-150, 170), asp=1)
points(elnino$Longitude, elnino$Latitude, col="blue", cex=elnino$tempdiv)
