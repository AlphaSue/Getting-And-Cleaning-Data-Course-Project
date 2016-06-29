##run_analysis.R

##This script is trying to get and clean data.

##step 1.Merges the training and the test sets to create one data set.
## read the data about test
test_set_subject_ids_as_table<- read.table("test/subject_test.txt")
test_set_activities_as_table<- read.table("test/y_test.txt")
test_set_measurements<- read.table ("test/X_test.txt", sep="")
test_table<- cbind (test_set_activities_as_table , test_set_measurements)
colnames(test_table)[1] <-"activity"
##change the colnames
test_table <- cbind (test_set_subject_ids_as_table , test_table)
colnames(test_table)[1] <- "subjectid"
##read the data about train in the same way as reading test
train_set_subject_ids_as_table <- read.table("train/subject_train.txt")
train_set_activities_as_table <- read.table("train/y_train.txt")
train_set_measurements <- read.table ("train/X_train.txt", sep="")
train_table <- cbind (train_set_activities_as_table , train_set_measurements)
colnames(train_table)[1] <- "activity"
train_table[1] <- factor(train_table[[1]])
train_table <- cbind (train_set_subject_ids_as_table , train_table)
colnames(train_table)[1] <- "subjectid"
##merge data
merged_data <- rbind (train_table, test_table)
merged_data <- merged_data[order(merged_data$subjectid, merged_data$activity), ]
row.names(merged_data) <- NULL
merged_data[1] <- factor(merged_data[[1]]) 
merged_data[2] <- factor(merged_data[[2]])
##find out whether  there are any na values
missing_values <- sum(is.na(merged_data))
print(paste("There are ", missing_values," missing values in the merged data.", collapse=""))





##step 2.Extracts only the measurements on the mean and standard deviation for each measurement.
features<-read.table("./features.txt")
vect<-grep("mean[^F]|std()",features$V2)
vect<-vect+2
vect<-append(c(1,2),vect)
mean_std_data<-merged_data[,vect]

##step 3.Uses descriptive activity names to name the activities in the data set
 merged_data[,2]<- gsub("1","walking",merged_data[,2])
 merged_data[,2]<- gsub("2","walking_upstairs",merged_data[,2])
 merged_data[,2]<- gsub("3","walking_downstairs",merged_data[,2])
 merged_data[,2]<- gsub("4","sitting",merged_data[,2])
 merged_data[,2]<- gsub("5","standing",merged_data[,2])
 merged_data[,2]<- gsub("6","laying",merged_data[,2])

##step 4.Appropriately labels the data set with descriptive variable names.
 colvariable<-append(c("subjectid","activity"),as.character(features[,2]))
 colvariable<-append(c("subjectid","activity"),as.character(features[,2]))
 colnames(merged_data)<-colvariable

##step 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
meltdata<-melt(merged_data, id=c("subjectid","activity"))
tidydata<-dcast(meltdata,subjectid+activity~variable,mean)
write.table(tidydata,"./tidydata.txt")
