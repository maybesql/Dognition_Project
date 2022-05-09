library(magrittr)
library(dplyr)

#Reading the CSV data of our Cleaned Dognition Data
data1 <- read.csv("/Users/yarkingazi/Desktop/Dognition_Project/Cleaned Dognition Data.csv", header=TRUE, stringsAsFactors=FALSE)

#Pipelines are being used heavily in the following procedures in this project. 
#Observing the dimensions of our data, which can be seen that there are 32 coloumns in total
dim(head(data1, n=4))
data1 %>% head(4) %>% dim
head(data1)

#Isolating the 2 columns we are interested: Free_Start_User and Membership_Type. These are crucial to understand if
#a customer is given a free trial, are they interested to get more of off it?
selectedRowData <- data1 %>% select(Free_Start_User, Membership_Type)
head(selectedRowData)

#Filtering the 
FreeTrial <- selectedRowData %>% filter(Free_Start_User == '1')
head(FreeTrial)
dim(FreeTrial)

NoFreeTrial <- selectedRowData %>% filter(Free_Start_User == '0')
head(NoFreeTrial)
dim(NoFreeTrial)



FreeTrialPlusSubscriptionOfAnyType <- FreeTrial %>%  filter(Membership_Type == '2' | Membership_Type == '3' |Membership_Type == '4')
dim(FreeTrialPlusSubscriptionOfAnyType)
#4147 Observation = FreeTrialPlusSubscriptionOfAnyType!!!

FreeTrialPlusAndNoSubscription <- FreeTrial %>%  filter(Membership_Type == '1')
dim(FreeTrialPlusAndNoSubscription)
#371 Observation = FreeTrialPlusAndNoSubscription!!!

NoFreeTrialPlusSubscriptionOfAnyType <- NoFreeTrial %>%  filter(Membership_Type == '2' | Membership_Type == '3' |Membership_Type == '4')
dim(NoFreeTrialPlusSubscriptionOfAnyType)
#4121 Observation = NoFreeTrialPlusSubscriptionOfAnyType

NoFreeTrialPlusAndNoSubscription <- NoFreeTrial %>%  filter(Membership_Type == '1')
dim(NoFreeTrialPlusAndNoSubscription)
#8758 Observation = NoFreeTrialPlusAndNoSubscription!!!




