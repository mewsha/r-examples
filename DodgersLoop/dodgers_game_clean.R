#' Dodgers Loop Script
#' Author: Jessica Diehl
#' Data Source: https://archive.ics.uci.edu/ml/datasets/Dodgers+Loop+Sensor
#' Style Guide: https://style.tidyverse.org/index.html

#' Load Dependencies ---------------------------------
library(ggplot2)

#' Load Car Data -------------------------------------
car_data_1 <- read.table("D:/CSCI620_All/CSCI620_DataSets/Dodgers/Dodgers.data", 
				 sep=",")
#' Omit -1 data from beginning and end
car_data_2 <- tail(car_data_1, 50377-380)
car_data_3 <- head(car_data_2, (50377-380)-50115)
#' Title columns
colnames(car_data_3) <- c("time", "cars")
#' Convert time to POSIX form
car_data_3$car_day<-as.POSIXct(car_data_3$time, 
					 format="%m/%d/%Y %H:%M")


#' Load Game Events Data -----------------------------
game_data_1 <- read.table("D:/CSCI620_All/CSCI620_DataSets/Dodgers/Dodgers.events", 
				  sep=",")
#' Title columns
colnames(game_data_1) <- c("date", "start", "end", "team", "winloss")
#' Turn two digit year into full four digit year
game_data_1$date<-gsub("/05", "/2005", game_data_1$date)
#' Combine day with time
game_start_1 <- data.frame(paste(game_data_1$date, 
					   game_data_1$start))
game_end_1 <- data.frame(paste(game_data_1$date, 
					 game_data_1$end))
#' Convert time to POSIX form
game_data_1$start_day<-as.POSIXct(game_start_1[,1], 
					    format="%m/%d/%Y %H:%M:%S")
game_data_1$end_day<-as.POSIXct(game_end_1[,1], 
					  format="%m/%d/%Y %H:%M:%S")
#' Create column with height of bars
game_data_1$value<-100


#' Plot All Data -------------------------------------
ggplot(data=car_data_3, aes(x=car_day, y=cars, color="car")) + 
#' Plot car points
geom_point(na.rm=TRUE, size=1.5) +
#' Plot game day bars
geom_bar(data=game_data_1, 
	   aes(x=start_day, y=value, color="start"), 
	   stat="identity", 
	   width=.1) +
geom_bar(data=game_data_1, 
	   aes(x=end_day, y=value, color="end"), 
	   stat="identity",
	   width=.1)+
#' Add legend
scale_color_manual(name = "Cars vs. Games", 
			 values = c("car"='#56B4E9', 
				      "start"='#E69F00', 
				      "end"='#999999'),
			 labels = c("Cars Per 5 Minutes", 
				      "Game Start Time", 
				      "Game End Time"))+
guides(color=guide_legend(override.aes=list(fill=NA,
							  size=3,
							  shape=c(16,15,15),
							  border=FALSE))) +
#' Add labels for axis and title
xlab("Date")+
ylab("Cars") +
ggtitle("Dodgers Loop Sensor")+
theme(plot.title=element_text(hjust=0.5), 
	text=element_text(size=16, 
				family="Arial"))
