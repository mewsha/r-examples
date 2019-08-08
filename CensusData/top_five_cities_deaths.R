#' Census Data Script
#' Author: Jessica Diehl
#' Data Source: https://www.census.gov/data/datasets/time-series/demo/
#'   popest/2010s-total-metro-and-micro-statistical-areas.html
#' Style Guide: https://style.tidyverse.org/index.html

#' Load Dependencies ---------------------------------
options(scipen=999)
library(ggplot2)

#' Load Census Data ----------------------------------
census_data<-read.csv('D:/CSCI620_All/CSCI620_DataSets/cbsa-est2018-alldata.csv')
#' Combine data for each year
death_data <- data.frame(
  Cities = census_data$NAME ,       
  Y2010 = census_data$DEATHS2010,   
  Y2011 = census_data$DEATHS2011,  
  Y2012 = census_data$DEATHS2012,
  Y2013 = census_data$DEATHS2013,
  Y2014 = census_data$DEATHS2014,
  Y2015 = census_data$DEATHS2015,  
  Y2016 = census_data$DEATHS2016,   
  Y2017 = census_data$DEATHS2017,   
  Y2018 = census_data$DEATHS2018)


#' Extract top five cities
census_data_2<-tail(death_data[with(death_data, order(Y2018)),], 5)
#' census_data_2

#' Create two columns from nine columns
census_data_2 = melt(census_data_2, id.vars=c("Cities"))


#' Plot All Data -------------------------------------
ggplot(census_data_2, aes(Cities, value, fill=variable)) +
#' Create bar graph
geom_bar(stat='Identity',position=position_dodge()) +
#' Label title and axis
ggtitle("Top 5 Cities with the Most Deaths 2010-2018") +
labs(x="Cities", y="Number of Deaths")+
theme(plot.title=element_text(hjust=0.5), 
	text=element_text(size=16, 
				family="Arial"),
	axis.text.x=element_text(size=11, angle=5))+
#' Customize legend
scale_fill_manual(name = "Census Years", 
			labels=c(2010,2011,2012,2013,2014,2015,2016,2017,2018),
			values=c("#0A2F51",
				   "#0E4D64",
				   "#137177",
				   "#188977",
				   "#1D9A6C",
				   "#39A96B",
				   "#56B870",
				   "#74C67A",
				   "#99D492"))


