#read in the files into data frames
#Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
#contains subject number range from 1 to 30
sTrain<-read.table("subject_train.txt")
names(sTrain)<-"Subject"

#Training set, contains the information for each subject, each column is a feature 561 of them
xTrain<-read.table("X_train.txt") 

#Training labels, contains what activity labels of each row 
#1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
yTrain<-read.table("y_train.txt")
names(yTrain)<-"Activity"

#Change the yTrain codes into its' respective activity labels 
#eg. 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
yTrain[which(yTrain[,1]=="1"), 1]<-"WALKING"
yTrain[which(yTrain[,1]=="2"), 1]<-"WALKING_UPSTAIRS"
yTrain[which(yTrain[,1]=="3"), 1]<-"WALKING_DOWNSTAIRS"
yTrain[which(yTrain[,1]=="4"), 1]<-"SITTING"
yTrain[which(yTrain[,1]=="5"), 1]<-"STANDING"
yTrain[which(yTrain[,1]=="6"), 1]<-"LAYING"

#read in the 561 features
features<-read.table("features.txt") 

#take the second column of the features table and use them as names
names<-features[,2]

#use these names as labels for each column of xTrain dataframe
names(xTrain)<-names

#combine subject numbers, activities, and features together
trainFull<-cbind(sTrain, yTrain, xTrain)


##Do the same above steps for the testing set data
#Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
#contains subject number range from 1 to 30
sTest<-read.table("subject_test.txt")
names(sTest)<-"Subject"

#Testing measurement data, columns are features and rows are subjects 
xTest<-read.table("X_test.txt") 

#Readin in the activity labels of each row 
#1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
yTest<-read.table("y_test.txt")
names(yTest)<-"Activity"

#Change the yTest codes into its' respective activity labels 
#eg. 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
yTest[which(yTest[,1]=="1"), 1]<-"WALKING"
yTest[which(yTest[,1]=="2"), 1]<-"WALKING_UPSTAIRS"
yTest[which(yTest[,1]=="3"), 1]<-"WALKING_DOWNSTAIRS"
yTest[which(yTest[,1]=="4"), 1]<-"SITTING"
yTest[which(yTest[,1]=="5"), 1]<-"STANDING"
yTest[which(yTest[,1]=="6"), 1]<-"LAYING"

#use these names as labels for each column of xTrain dataframe
names(xTest)<-names

#combine subject numbers, activities, and features together
testFull<-cbind(sTest, yTest, xTest)

#combine training and testing data together 
allData<-rbind(trainFull, testFull)

library(tidyr)
library(dplyr)
library(reshape) 

#get column positions where titles are mean or std
v<-grep("std|mean", names(allData), ignore.case=TRUE)
#include the subject and activity columns
v<-c(1:2,v)
#create new dataframe with items with mean or std
subset<-allData[,v]

#exclude columns that include angle
subsetMeanStd<-select(subset, -(grep("angle", names(subset))))

#names for use in the melt function
n<-names(subsetMeanStd[,3:81])

#convert data set from wide to long
subsetMelt<-melt(subsetMeanStd, id=c("Subject", "Activity"), measure.vars=n)

#create a data set with the average of each variable for each activity and each subject
tidy<-summarise(group_by(subsetMelt, Subject, Activity, variable), mean(value))

#rename the names to be more descriptive
names(tidy)[names(tidy)=="mean(value)"] <- "Average"
names(tidy)[names(tidy)=="variable"] <- "Feature"

#Create text file with write.table() using row.name=FALSE for submission
#output to a text file called tidy.txt 
sink("tidy.txt", append=FALSE, split=FALSE)
write.table(tidy, row.name=FALSE)
sink()