---
title: "README"
author: "Edén Sorolla"
date: 03/07/2020
output: html_document
---


# Structure of the scripts

We have created a single script named **"run_analysis.R"** where we apply the 5 requested steps
sequentially:

1. Merge the training and the test sets to create one data set.

2. Extract only the measurements on the mean and standard deviation for each measurement.

3. Use descriptive activity names to name the activities in the data set.

4. Appropriately label the data set with descriptive variable names.

5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

# Script description

## 1. Merging the training and the test data set

We begin by importing the data:

```
# THIS FILE STORES THE NAMES OF THE ACTIVITIES
activities <- read.table("activity_labels.txt", header = FALSE, sep = " ")

# THE "features.txt" FILE GIVES NAMES TO THE COLUMNS OF THE DATA FRAME
features <- read.delim("features.txt", header = FALSE, sep = " ")
featuresNames <- features[,2] # WE CREATE THE NAMES OF THE COLUMNS

## 1A) THE TEST DATASET:
subjectTest <- read.table("test/subject_test.txt", header = FALSE)
activitiesTest <- read.table("test/y_test.txt", header = FALSE)

# WE REPLACE THE NUMERIC VALUES OF "y_test.txt" BY THE "character" ACTIVITIES
activitiesTest <- activities[activitiesTest[,1],2]

# WE IMPORT THE MEASUREMENTS VALUES FILE
featuresTest <- read.table("test/X_test.txt", header = FALSE)


### 1B) THE TRAINING DATASET:
subjectTrain <- read.table("train/subject_train.txt", header = FALSE)
activitiesTrain <- read.table("train/y_train.txt", header = FALSE)

# WE REPLACE THE NUMERIC VALUES OF "y_test.txt" BY THE "character" ACTIVITIES
activitiesTrain <- activities[activitiesTrain[,1],2]

## WE IMPORT THE MEASUREMENTS VALUES FILE
featuresTrain <- read.table("train/X_train.txt", header = FALSE)
```

We create both data frames and assign the names to the columns:

```
testData <- cbind(subjectTest$V1, activitiesTest)
testData <- cbind(testData,featuresTest)
names(testData) <- append(c("Subject", "Activity"), featuresNames, after = 2)

trainData <- cbind(as.numeric(subjectTrain$V1), activitiesTrain)
trainData <- cbind(trainData,featuresTrain)
names(trainData) <- append(c("Subject", "Activity"), featuresNames, after = 2)
```

We finally merge the data:

```
mergedData <- rbind(testData,trainData)
```

## 2. Extract the measurements on the mean and standard deviation

We extract the measurements on the mean and the standard deviation:

```
extractMean <- mergedData[,grep("mean[()])",names(mergedData))]
extractStd <- mergedData[,grep("std()",names(mergedData))]
extractMeanStd <- cbind(extractMean,extractStd)
extractInit <- cbind("Subject" = mergedData$Subject, "Activity" = mergedData$Activity)
extract <- cbind(extractInit,extractMeanStd)

```

## 3) USING DESCRIPTIVE ACTIVITY NAMES
We have already used the activity names provided by the source data set in the file "activity_labels.txt"

## 4) LABELLING APPROPRIATELY THE DATA SET
We have already labelled the data set according to the file "features.txt"

## 5) CREATE A NEW DATA FRAME WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

First, we order the data frame by the subject number and by activities

```
extract[,1] <- as.numeric(extract[,1]) # We coerce the subject column to numeric
extractOrdered <- extract[order(extract[,1], extract[,2]),]

```

Second, we calculate the average of the extracted variables for each activity and each subject by using the command **aggregate**

```
result <- aggregate(extractOrdered, by = list(extractOrdered[,1],extractOrdered[,2]), FUN = function(x) mean(x))
result <- result[-(3:4)] ## We eliminate the two columns as a result of applying
                         ## the "aggregate" command to the first two columns.

## WE ADD "average" TO THE NAMES OF VARIABLES IN THE NEW DATASET
colnames(result)[3:68] <- paste("average(",colnames(result)[3:68],")", sep = "")
colnames(result)[1:2] <- c("Subject", "Activity") #we update the names of the first two columns

```