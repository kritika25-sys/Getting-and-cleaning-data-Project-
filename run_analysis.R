#COURSE PROJECT - GETTING AND CLEANING DATA (Submitted by Kritika Gulati) 
setwd("E:/RStudio files/Getting and cleaning data/Course project")

# 1) Merging the training and test sets to create one data set 
X_test<-read.table("test/x_test.txt")   #reading data from training and test sets
X_train<-read.table("train/X_train.txt")
Y_test<-read.table("test/y_test.txt")
Y_train<-read.table("train/y_train.txt")
dim(X_test)  #checking the dimensions of the two dataframes
dim(X_train)
test1<-data.frame(activity=Y_test, X_test) #adding training and test labels to the respective dataframe
names(test1)[1:2]<-c("activity","V1")
train1<-data.frame(activity=Y_train, X_train)
names(train1)[1:2]<-c("activity","V1")
dt1<-rbind(test1, train1) #Merging the two data sets to create one data set  

# 2) Extracting only the measurements on mean and standard deviation for each measurement
library(dplyr)
res<-read.table("features.txt")
res1<-grep("mean",res$V2,value=TRUE ) # extracting the columns corresponding to mean and std
res1<-grep("meanFreq", res1, invert=TRUE, value=TRUE)
res2<-grep("std",res$V2,value=TRUE)
dd<-res$V2
i<-1
dd2<-1:(length(res1)+length(res2))    
res3<-data.frame(names(dt1)[2:562],dd)
for (i in 1:length(res1)) {
  for (j in 1:length(dt1)) {
    if(res1[i]==res3$dd[j]){
      dd2[i]<-j
      break()
    }
  }
}
i<-i+1
for (k in 1:length(res2)) {
  for (j in 1:length(dt1)) {
    if(res2[k]==res3$dd[j]){
      dd2[i]<-j
      i<-i+1
      break()
    }
  }
}

res4<-select(dt1, res3$names.dt1..2.562.[dd2])

# 3) using descriptive activity names to name the activities in the data set
# 5-standing, 4-sitting, 3-walking_downstairs, 2-walking_upstairs, 1-walking, 6-laying
for (i in 1:length(dt1$activity)) {
  if(dt1$activity[i]=="1")
    dt1$activity<-replace(dt1$activity,i,"walking")
  else if(dt1$activity[i]=="2")
    dt1$activity<-replace(dt1$activity,i,"walking_upstairs")
  else if(dt1$activity[i]=="3")
    dt1$activity<-replace(dt1$activity,i,"walking_downstairs")
  else if(dt1$activity[i]=="4")
    dt1$activity<-replace(dt1$activity,i,"sitting")
  else if(dt1$activity[i]=="5")
    dt1$activity<-replace(dt1$activity,i,"standing")
  else if(dt1$activity[i]=="6")
    dt1$activity<-replace(dt1$activity,i,"laying")
}

# 4) appropriately labelling the data set with descriptive variable names

names(dt1)[2:562]<-res3$dd

#5) From the data set in step4, creating a second , independent tidy data set
# with the average of each variable for each activity and each subject

subject_train<-read.table("train/subject_train.txt")
subject_test<-read.table("test/subject_test.txt")
subject<-rbind(subject_test, subject_train)
dt1<-cbind(subject,dt1)
y1<-unique(dt1$activity)
names(dt1)[1]<-"subject"
d1<-NULL
for (i in 1:30) {
  for (j in 1:6) {
    b1<-dt1[dt1$activity==y1[j]&dt1$subject==i,]
    dtrr<-b1[,3:563]
    c1<-as.list(summarize_all(dtrr,mean))
    d1<-c(d1,c1)
  }
}
a1<-matrix(d1,nrow=180, ncol=561, byrow = TRUE)
k<-1
rnames<-1:180
for(i in 1:30)
  for (j in 1:6){
    rnames[k]<- paste("subject",i,"-",y1[j])
    k<-k+1
  }
cnames<-NULL
row.names(a1)<-rnames
for (i in 1:561) {
  cnames[i]<-paste("avg(V",i,")")
}
colnames(a1)<-cnames
