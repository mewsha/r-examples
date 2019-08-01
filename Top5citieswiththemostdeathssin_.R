options(scipen=999)

mydata<-read.csv('D:/CSCI620_All/CSCI620_DataSets/cbsa-est2018-alldata.csv')
# run.R
# Generate data frame
dataframe <- data.frame(
  Cities = mydata$NAME ,       
  Y2010 = mydata$DEATHS2010,   
  Y2011 = mydata$DEATHS2011,  
  Y2012 = mydata$DEATHS2012,
  Y2013 = mydata$DEATHS2013,
  Y2014 = mydata$DEATHS2014,
  Y2015 = mydata$DEATHS2015,  
  Y2016 = mydata$DEATHS2016,   
  Y2017 = mydata$DEATHS2017,   
  Y2018 = mydata$DEATHS2018)


# Print data frame
tail(dataframe[with(dataframe, order(Y2018)),], 5)

mydata<-tail(dataframe[with(dataframe, order(Y2018)),], 5)


xlab("Number of Births")
ylab("Cities")
df_ = melt(mydata, id.vars=c("Cities"))
ggplot(df_, aes(Cities, value, fill=variable)) +
geom_bar(stat='Identity',position=position_dodge()) +
ggtitle("Top 5 Cities with the Most Deaths 2010-2018") +
labs(x="Cities", y="Number of Births")


