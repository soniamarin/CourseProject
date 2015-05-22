if (!file.exists("UCI HAR Dataset")) {
  print("download the UCI HAR Dataset to your working directory")
}
library(data.table)
library(plyr)
library(dplyr)
##
## 1.Merges the training and the test sets to create one data set
##
## reading info
myfeatures <- read.table("./UCI HAR Dataset/features.txt")  #read text file 
myactivities <-read.table("./UCI HAR Dataset/activity_labels.txt")
mytrainingset <- read.table("./UCI HAR Dataset/train/X_train.txt") #read text file training set 
mytestingset <- read.table("./UCI HAR Dataset/test/X_test.txt") #read text file testing set
mylabelstrain <- read.table("./UCI HAR Dataset/train/Y_train.txt") #read text file training lb
mylabelstest <- read.table("./UCI HAR Dataset/test/Y_test.txt") #read text file testing lb
mysubjecttrain<- read.table("./UCI HAR Dataset/train/subject_train.txt") #read text file training sb
mysubjecttest<- read.table("./UCI HAR Dataset/test/subject_test.txt") #read text file testing sb
    ## setting column names
    colnames(mytrainingset)<-myfeatures[,2]
    colnames(mytestingset)<-myfeatures[,2]
    colnames(mysubjecttrain)<-list("subject")
    colnames(mysubjecttest)<-list("subject")
    colnames(mylabelstrain)<-list("activity")
    colnames(mylabelstest)<-list("activity")
    ## merging train and test dataser, including subject and activities number
    mymergedata<-rbind(mytrainingset, mytestingset)
    mysubjecdata<-rbind(mysubjecttrain,mysubjecttest)
    mylabelsdata<-rbind(mylabelstrain,mylabelstest)
    mymergerdata<-cbind(mymergedata,mysubjecdata)
    mymergerdata<-cbind(mymergerdata,mylabelsdata)
    ##dim(mymergerdata)
    ##head(mymergerdata, n=2)
    ##tail(mymergerdata, n=2)
##
##2.Extracts only the measurements on the mean and standard deviation for each measurement
##
    mysubmean1<- mymergerdata[,grep("mean", colnames(mymergerdata))] 
    ##is.data.frame(mysubmean1)
    mysubmean2<- mysubmean1[,grep("meanfreq", colnames(mysubmean1), 
                ignore.case = TRUE, value = TRUE, invert = TRUE )] 
    mysubsd1<- mymergerdata[,grep("std", colnames(mymergerdata))] 
    mysub1<-cbind(mysubmean2, mysubsd1)
    mysub1copy=mysub1
    mysub1<-cbind(mysub1,mysubjecdata)
    mysub1<-cbind(mysub1,mylabelsdata)
    ##dim(mysub1)
    ##mysub1copy     
    ##tail(mysub1, n=2)
##
##3.Uses descriptive activity names to name the activities in the data set
##   myactivities[2,2]
##
##    mymergerdata<-as.data.table(mymergerdata)
##    mymergerdata<-mymergerdata[, activityname:= myactivities[activity,2]]
    mysub1<-as.data.table(mysub1)
    mysub1<-mysub1[, activityname:= myactivities[activity,2]]
    ##dim(mysub1)
    ##is.data.frame(mysub1)
    ##head(mysub1, n=2)
    ##tail(mysub1, n=2)
##
##4.Appropriately labels the data set with descriptive variable names
##  mysub1 
##
      ## deleting underscores, parenthesis and setting lower case for column names
      dataprue<-data.table(lapply(colnames(mysub1), function(x) {
      x<-gsub("-", "", x)
      x<-gsub("\\(", "", x)
      x<-gsub("\\)", "", x)
      if (is.character(x)) return(tolower(x))
      else return(x)
      }))
      colnames(mysub1) <- unlist(dataprue)
      ##head(mysub1, n=2)
      ##tail(mysub1, n=2)
        
##
##5.From the data set in step 4, creates a second, 
##  independent tidy data set with the average of each 
##  variable for each activity and each subject
##  mysubtidy is the tidy data
##
##  Calculation by activity and by subject combined   
    mysub7<-select(mysub1, 1:68)
    ##is.data.table(mysub7)
    mysub8<-mysub7[,lapply(.SD,mean),by="subject,activity"]
    mysub8<- arrange (mysub8, subject, activity)
    mysub8<-mutate(mysub8,keyname=c(paste("average for","subject",subject,"activity",activity))) 
    mysub8 <- subset(mysub8, select=-activity)
    mysub8 <- subset(mysub8, select=-subject)
    ##dim(mysub8)
    mysubtidy<-mysub8
    ##dim(mysubtidy)
    write.table(mysubtidy, "tidydata.txt", row.names=FALSE)
    ##listrow<- select(mysubtidy, 67)
    ##write.table(listrow, "rowlabels.txt", row.names=FALSE)

       
     
     

