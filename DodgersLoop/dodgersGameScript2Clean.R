#load dependencies
library(ggplot2)

#load car data
carData1 <- read.table("D:/CSCI620_All/CSCI620_DataSets/Dodgers/Dodgers.data", sep=",")
carData2 <- tail(carData1, 50377-380)
carData3 <- head(carData2, (50377-380)-50115)
colnames(carData3) <- c("time", "cars")
cartime1 <- data.frame(paste(carData3$time))
head(cartime1[,1])
str(cartime1[,1])
carData3$carday<-as.POSIXct(cartime1[,1], format="%m/%d/%Y %H:%M")
head(carData3)

#load game events data
gameData1 <- read.table("D:/CSCI620_All/CSCI620_DataSets/Dodgers/Dodgers.events", sep=",")
colnames(gameData1) <- c("date", "start", "end", "team", "winloss")
gameData1$date<-gsub("/05", "/2005", gameData1$date)
gameStart1 <- data.frame(paste(gameData1$date, gameData1$start))
gameEnd1 <- data.frame(paste(gameData1$date, gameData1$end))
head(gameStart1)
gameData1$startday<-as.POSIXct(gameStart1[,1], format="%m/%d/%Y %H:%M:%S")
gameData1$endday<-as.POSIXct(gameEnd1[,1], format="%m/%d/%Y %H:%M:%S")
gameData1$value<-100
gameData1

#plot the data
ggplot(data=carData3, aes(x=carday, y=cars, color="car")) + 
geom_point(na.rm=TRUE, size=1.2) +
geom_bar(data=gameData1, aes(x=startday, y=value, color="start"), stat="identity", width=.1) +
geom_bar(data=gameData1, aes(x=endday, y=value, color="end"), stat="identity",width=.1)+
scale_color_manual(name = "Cars vs. Games", 
			values = c("car"='#56B4E9', "start"='#E69F00', "end"='#999999'),
			labels = c("Cars Per 5 Minutes", "Game Start Time", "Game End Time"))+
xlab("Date")+
ylab("Cars") +
ggtitle("Dodgers Loop Sensor")+
theme(plot.title=element_text(hjust=0.5))+
guides(color=guide_legend(override.aes=list(fill=NA,size=3,shape=c(16,15,15),border=FALSE)))