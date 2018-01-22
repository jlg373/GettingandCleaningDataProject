---
title: "Coursera Getting and Cleaning Data Final Project - README"
author: "Jennifer Grab"
date: "1/21/2018"
output: html_document
---
## Overview

The included script run_analysis.R downloads and unzips the data set from [this website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and does the following -

1) Merges the training and the test sets to create one data set.  
2) Extracts only the measurements on the mean and standard deviation for each measurement.  
3) Uses descriptive activity names to name the activities in the data set.  
4) Appropriately labels the data set with descriptive variable names.  
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

The resulting tidy data set is saved as meandata.txt which can be loaded into R using the following code - 

```{r}
data <- read.table("meandata.txt", header = TRUE)
View(data)
```

For a more detailed description of the study, and the raw and processed data, please see the included file, "CodeBook.md".

Package requirements - dplyr

## 1 - Getting the data and initial processing

The script creates a directory called "SmartphonesData" (if it doesn't already exist) in the working directory.  Data is downloaded from the above link and unzipped into this directory.

The script first processes information in the "UCI HAR Dataset" directory.  Variable names for the features vector are extracted from "features.txt" and stored in the features data.frame.  Activity labels are extracted from "activity_labels.txt" and stored in the activitylabels data.frame.  

## 2 - Processing the "test" and "train" data sets

From the data source ("README.txt") -  
"The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."  

These two sets are stored in the "test" and "train" directories in "UCI HAR Dataset".  The script processes these two sets separately and then merges them at a later point.  Processing is the same for both, so the following description for the "test" data set also applies to the "train" data set, with names changed accordingly.

First, the features vector is extracted from "X_test.txt" and saved in the data.frame, testvector.  Columns are correctly labelled using the features data.frame.

Next, information on the test subjects is extracted from "subject_test.txt" and stored in the testsubjects data.frame.  The activities for each row are extracted from "y_test.txt" and stored in the testactivities data.frame.  This data.frame is converted to a factor with labels from activitylabels, giving descriptive labels for each row.  testsubjects and testactivities are merged into a new data.frame called testdata with column  names "subject" and "activity".

Lastly, testvector is column binded to the right of testdata, resulting in one data.frame containing all information from the "test" directory.

The above steps are repeated in the "train" directory, resulting in a data.frame called traindata.  testdata and traindata are merged into one large data.frame called alldata using the rbind function.

## 3 - Extracting the mean and standard deviation of each measurement

The grep function, with the appropriate regular expressions, is used to find the column indices in alldata with names containing either "mean()" or "std()".  These columns and the "subject" and "activity" columns are column binded to create the meanstddata data.frame.  Variable names are cleaned up to remove "()" and "-".  meanstddata meets the requirements of steps 1-4 described in the Overview.

It is important to note that here I assume that only variables containing "mean()" are desired.  There are also variables containing "meanFreq()" that may be relelvant depending on how the project description is interpreted.  

## 4 - Creating tidy data set with the average of each variable for each activity and each subject

The dplyr package is used to group meanstddata by activity and subject, and then the summarize_at function is used to find the mean of each column, other than the activity and subject columns, for each activity/subject combination.  The resulting data.frame (tbl_df) is called meandata.  For clarity, "Avg" is appended to the beginning of each column name of meandata.

The meandata data set is tidy because each column contains a different variable, and each row contains a different average measurement.  There are alternative ways to arrange this data in a tidy way, but without knowing what sort of analysis follows or what sort of questions we want to answer, it is difficult to say which form is optimal.  For the sake of simplicity, I think it is best to leave the data set in a form similar to the original data set.

The data set is saved as "meandata.txt" in the Smartphonesdata directory.  The script then navigates to the starting directory and deletes unnecessary variables.