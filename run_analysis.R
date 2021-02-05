
# 0. Download the zip file, unzip it and store it in an appropriate directory

setwd("/Users/daniela/Desktop/Data Science Coursera/3 - Getting_and_Cleaning_Data/week 4/")
if(!file.exists("Getting and Cleaning Data Course Project")) {dir.create("Getting and Cleaning Data Course Project")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("Getting and Cleaning Data Course Project/UCI HAR Dataset")) {
        download.file(fileurl, destfile = "Getting and Cleaning Data Course Project/human_activity_recognition_using_smartphones.zip", method = "curl")
        unzip("Getting and Cleaning Data Course Project/human_activity_recognition_using_smartphones.zip", exdir = "Getting and Cleaning Data Course Project" )
        file.remove("Getting and Cleaning Data Course Project/human_activity_recognition_using_smartphones.zip")
        }

setwd("Getting and Cleaning Data Course Project")

library(dplyr)
library(plyr)

# 0.1. Load the relevant tables

# load activity labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
# load features
features <- read.table("UCI HAR Dataset/features.txt")

## load test files ##
# load test subject
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
# load test values
testValues <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
# load test activities
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE)

## load train files ##
# load train subject
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
# load train values
trainValues <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
# load train activities
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE)

# 1. Merge the training and the test sets to create one data set. As we know from
# the README file from the data set:

# activityLabels: link class labels with their activity name.
# features: lists all the features, corresponds to the variable names for test and train values.
# trainSubjects & testSubjects: Subjects Id's 
# trainVales & testValues: Values recorded for each subject for each feature
# trainActivities & testActivities: Activity corresponding to each subject for each feature.

# first we link the subjects to the activities & values
test <- cbind(testSubjects,testActivities)
test <- cbind(test,testValues)
train <- cbind(trainSubjects,trainActivities)
train <- cbind(train,trainValues)

# then we link the train and test subjects
Data <- rbind(test,train)

# 4.1 Appropriately labels the data set with descriptive variable names.

# We set the features as column names for the Values and add descriptive names 
# to the subject-id and activity columns.

colnames(Data) <- c("subject","activity",features[,2])

# 2. Extract only the measurements on the mean and standard deviation for each 
# measurement. 

Data <- Data[grepl("subject|activity|\\mean()\\b|std()", colnames(Data))]

# 3. Use the descriptive activity names to name the activities in the data set
# we define activity variable as a factor and then reset the levels with the names
# instead of the numbers

Data$activity <- as.factor(Data$activity)
levels(Data$activity) <- activityLabels[,2]

# 4.2 Appropriately labels the data set with descriptive variable names.

# We simplify the variable names with a few replacements

temp <- names(Data) 
temp <- gsub("-","",temp)
temp <- gsub("()","",temp, fixed = TRUE)
temp <- gsub("mean", "Mean", temp)
temp <- gsub("std", "Std", temp)
temp <- gsub("^t","time", temp)
temp <- gsub("^f","fourier", temp)
temp <- gsub("BodyBody","Body", temp)
names(Data) <- temp

# 5. From the previous data set, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

tidyData <- Data %>% group_by(subject,activity) %>% 
        summarise_each(mean)

# finally we export tidyData frame as a text file & store it in the work directory

write.table(tidyData,"tidy_data.txt",sep="\t",row.names=FALSE)



