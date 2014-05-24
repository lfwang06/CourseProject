## Already downloaded the Samsung data and unzipped it in my working directiory.
## 1. Merges the training and the test sets to create one data set.

setwd("E:/Wang/Coursera/Getting and Cleaning data")
train<-read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
trainlabels<-read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
trainsubject<-read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
ctrain<-data.frame(trainsubject,trainlabels,train)
test<-read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
testlabels<-read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
testsubject<-read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
ctest<-data.frame(testsubject,testlabels,test)
alldata<-rbind(ctest,ctrain)

## 2. Extracts only the measurements on the mean and std for each meansurement.

features<-read.table("./UCI HAR Dataset/features.txt", header=FALSE)
names<-as.character(features$V2)
names(alldata)<-c("subject","activity", names)
meannames<-grep("mean()",names,value=TRUE)
stdnames<-grep("std()",names,value=TRUE)
mydata<-alldata[,c("subject","activity",meannames,stdnames)]

## 3. Uses descriptive activity names to name the activities in the data set.

activity<-read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
for (i in 1:6){mydata$activity<-sub(i,activity[,2][i],mydata$activity)}

## 4. Appropriately labels the data set with descriptive acitivity names.

names(mydata)<-gsub("-","",names(mydata))
names(mydata)<-gsub(pattern="\\(\\)", replacement="", x=names(mydata))

## 5. Creates a second, independent tidy data set with the average of each variable
##    for each activity and each subject.

sum(!complete.cases(mydata))
tidydata<-aggregate(.~ activity+subject, data=mydata, mean)
write.table(tidydata, file="tidydata.txt",row.names=FALSE,sep=" ")
