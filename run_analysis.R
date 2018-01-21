# This script takes the "Human Activity Recognition Using Smartphones Data Set" from the UCI
# Machine Learning Repository and does the following - 
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names.
# 5) From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.

# Load relevant packages.
library(dplyr)

# Create new directory for this analysis and set it as the working directory.
if(!dir.exists("SmartphonesData")) {dir.create("SmartphonesData")}
setwd("SmartphonesData")

# Download and unzip data files.
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
unzip("data.zip")

# Get variable names for features vector.
setwd("UCI Har Dataset")
features <- read.table("features.txt")

# Get labels for activities.  Convert to lower case characters and delete "_".
activitylabels <- read.table("activity_labels.txt")
activitylabels[,2] <- tolower(as.character(activitylabels[,2]))
activitylabels[,2] <- gsub("_", "", activitylabels[,2])


# "Test" data set - 
# Get features vector and add features vector column labels.
setwd("test")
testvector <- read.table("X_test.txt")
names(testvector) <- features[,2]

# Get data on test subject and activity and create new data frame (testdata) consisting of
# subject, activity, and feature vector (561 columns).
# Add descriptive labels to activity column.
testsubjects <- read.table("subject_test.txt")
testactivities <- read.table("y_test.txt")
testactivities <- factor(testactivities[,1], labels = activitylabels[,2])
testdata <- data.frame(testsubjects, testactivities)
names(testdata) <- c("subject", "activity")
testdata <- cbind(testdata, testvector)



# "Train" data set - 
# Same as above procedure.
setwd(".."); setwd("train")
# Get features vector and add features vector column labels.
trainvector <- read.table("X_train.txt")
names(trainvector) <- features[,2]

# Get data on test subject and activity and create new data frame (testdata) consisting of
# subject, activity, and feature vector (561 columns).
# Add descriptive labels to activity column.
trainsubjects <- read.table("subject_train.txt")
trainactivities <- read.table("y_train.txt")
trainactivities <- factor(trainactivities[,1], labels = activitylabels[,2])
traindata <- data.frame(trainsubjects, trainactivities)
names(traindata) <- c("subject", "activity")
traindata <- cbind(traindata, trainvector)



# Merge data into one data.frame.
alldata <- rbind(testdata, traindata)

# Select columns that are either the mean or standard deviation 
indices <- sort(c(grep("[Mm]ean\\(\\)", names(alldata)),grep("[Ss]td\\(\\)", names(alldata))))
meanstddata <- cbind(alldata[1:2],alldata[indices])

# Clean up column names.  I think mixed upper/lower case is easier to read so I do 
# not change to lowercase.
names(meanstddata) <- gsub("\\(\\)", "", names(meanstddata))
names(meanstddata) <- gsub("-", "", names(meanstddata))



# Create tidy data set with the average of each variable for each activity and each subject.
# Use dplyr package to group by subject and activity and take means of each column.
meandata <- meanstddata %>% group_by(subject, activity) %>% summarize_at(names(meanstddata)[3:ncol(meanstddata)],mean)
for(i in 3:ncol(meandata)){names(meandata)[i] = paste("Avg", names(meandata)[i], sep = "")}


# Save tidy data set in Smartphonesdata directory.  Return to starting directory.
for(i in 1:2) {setwd("..")}
write.table(meandata, "meandata.txt", row.name=FALSE)
setwd("..")

# Delete temporary variables.
rm(i, indices)
