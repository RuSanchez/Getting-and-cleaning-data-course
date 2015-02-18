#Packages
install.packages("reshape2")
install.packages("dplyr")
#Libraries necessaries
library(data.table)
library(dplyr)
library(reshape2)
#Unzip dataset in working Directory
dataFile=("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
temp <- tempfile()
setInternet2()
download.file(dataFile,temp)
unzip(temp)
unlink(temp)
#Read data downloaded
feat<-read.table(".\\UCI HAR Dataset\\features.txt")
XTest<-read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
Xtrain<-read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
YTest<-read.table(".\\UCI HAR Dataset\\test\\Y_test.txt")
Ytrain<-read.table(".\\UCI HAR Dataset\\train\\Y_train.txt")
SubjectTest<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
Subjecttrain<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
Activity_names<-read.table(".\\UCI HAR Dataset\\activity_labels.txt")
#Join test and training data
X<-rbind(XTest,Xtrain)
Y<-rbind(YTest,Ytrain)
Subject<-rbind(SubjectTest,Subjecttrain)
#Rename columns for all tables
colnames(X)<-feat$V2#Rename Columns
colnames(Y)<-"Activity #"#Rename Columns
colnames(Subject)<-"Subject"#Rename Columns
#Create only one table
TidyData<-cbind(Subject,Y,X)
Final<-merge(TidyData,Activity_names,by.x="Activity #",by.y="V1",all=T)#Activity name added
Final<-Final[,c(564,1:563)]#Activity name moved to first column
names(Final)[names(Final)=="V2"]<-"Activity_name"#Activity column renamed
#Extracts only the measurements on the mean and standard deviation for each measurement.
Point2<-select(Final,contains("Activity_name"),contains("Subject"),contains("std()"),contains("mean()"))
#Prepare data for second tidy data set
P5<-melt(Point2,id=c("Activity_name","Subject"),measure.vars=names(Point2[,c(3:68)]))
Point5<-dcast(P5,Activity_name+Subject ~ variable,mean)
#Save table to upload
write.table(Point5,file="Tidy data set.txt",row.names=F)
