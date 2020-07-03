## WE SET THE WORKING DIRECTORY ON THE FOLDER OF THE EXERCISE
setwd("C:/Work/Coursera/Data_Analysis/3)Cleaning_and_Getting_Data/Project/getdata_projectfiles_UCI HAR Dataset")

## 1) WE MERGE THE TRAINING AND THE TEST DATASETS:

## WE IMPORT THE "activity_labels.txt" FILE THAT WILL GIVE THE VALUES OF THE ACTIVITY COLUMN
activities <- read.table("activity_labels.txt", header = FALSE, sep = " ")

## WE IMPORT THE "features.txt" FILE THAT WILL GIVE NAMES TO THE COLUMNS OF OUR DATA FRAME
features <- read.delim("features.txt", header = FALSE, sep = " ")

## WE CREATE THE NAMES OF THE COLUMNS OF THE DATA FRAME FROM "features.txt"
featuresNames <- features[,2]

### 1A) WE IMPORT THE TEST DATASET:
## WE IMPORT THE SUBJECT FILE ("subject_test.txt")
subjectTest <- read.table("test/subject_test.txt", header = FALSE)

## WE IMPORT THE ACTIVITIES VALUES FILE ("y_test.txt")
activitiesTest <- read.table("test/y_test.txt", header = FALSE)

## WE REPLACE THE NUMERIC VALUES IN THE ABOVE FILE BY THE "character" ONES ACCORDING TO THE
## CODE PROVIDED IN THE "activity_labels.txt" FILE
activitiesTest <- activities[activitiesTest[,1],2]

## WE IMPORT THE MEASUREMENTS VALUES FILE ("X_test.txt")
featuresTest <- read.table("test/X_test.txt", header = FALSE)


### 1B) WE IMPORT THE TRAINING DATASET:
## WE IMPORT THE SUBJECT FILE ("subject_train.txt")
subjectTrain <- read.table("train/subject_train.txt", header = FALSE)

## WE IMPORT THE ACTIVITIES VALUES FILE ("y_train.txt")
activitiesTrain <- read.table("train/y_train.txt", header = FALSE)

## WE REPLACE THE NUMERIC VALUES IN THE ABOVE FILE BY THE "character" ONES ACCORDING TO THE
## CODE PROVIDED IN THE "activity_labels.txt" FILE
activitiesTrain <- activities[activitiesTrain[,1],2]

## WE IMPORT THE MEASUREMENTS VALUES FILE ("X_train.txt")
featuresTrain <- read.table("train/X_train.txt", header = FALSE)

## WE CREATE THE DATA FRAMES:
testData <- cbind(subjectTest$V1, activitiesTest)
testData <- cbind(testData,featuresTest)
names(testData) <- append(c("Subject", "Activity"), featuresNames, after = 2)

trainData <- cbind(as.numeric(subjectTrain$V1), activitiesTrain)
trainData <- cbind(trainData,featuresTrain)
names(trainData) <- append(c("Subject", "Activity"), featuresNames, after = 2)

## WE MERGE BOTH DATASETS:
mergedData <- rbind(testData,trainData)

## 2) WE EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND THE STANDARD DEVIATION:
extractMean <- mergedData[,grep("mean[()])",names(mergedData))]
extractStd <- mergedData[,grep("std()",names(mergedData))]
extractMeanStd <- cbind(extractMean,extractStd)
extractInit <- cbind("Subject" = mergedData$Subject, "Activity" = mergedData$Activity)
extract <- cbind(extractInit,extractMeanStd)

write.table(names(extract),"variables.txt", quote = FALSE, sep = "\n", row.names = FALSE)

## A SAMPLE OF THE extract MATRIX
str(extract)

## 3) and 4) WE HAVE USED DESCRIPTIVE ACTIVITY NAMES AND APPROPRIATELY LABELLED
## THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES ACCORDING TO THE DOC OF THE DATA

## 5) FROM THE PREVIOUS DATASET WE CREATE A NEW ONE WITH THE AVERAGE OF EACH VARIABLE
## FOR EACH ACTIVITY AND EACH SUBJECT

## FIRST: WE ORDER THE DATA FRAME BY THE SUBJECT NUMBER AND BY ACTIVITY
extract[,1] <- as.numeric(extract[,1]) # We coerce the subject column to numeric
extractOrdered <- extract[order(extract[,1], extract[,2]),]

## SECOND: WE CALCULATE THE AVERAGE TO EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
result <- aggregate(extractOrdered, by = list(extractOrdered[,1],extractOrdered[,2]), FUN = function(x) mean(x))
result <- result[-(3:4)] ## We eliminate the two columns as a result of applying
                         ## the "aggregate" command to the first two columns.

## WE ADD "average" TO THE NAMES OF VARIABLES IN THE NEW DATASET
colnames(result)[3:68] <- paste("average(",colnames(result)[3:68],")", sep = "")
colnames(result)[1:2] <- c("Subject", "Activity")

write.table(result, "esorolla.txt", row.name=FALSE)
