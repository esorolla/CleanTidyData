---
title: "Codebook"
author: "Eden Sorolla"
date: 30/06/2020
output: html_document
---


# Introduction

The original data consists of different mathematical operations applied on the signals registered by the accelerometer and the gyroscope of a smartphone (Samsung Galaxy S II) attached to the waist of 30 subjects while making different activities. The measurements consist of the 3-axial components of the acceleration and of the angular velocity registered by the accelerometer and the gyroscope of the smartphone, respectively. Two different data sets with the same variables were created: the first one corresponding to 70% of the observations, named training set, and the second one with 30% of the observations, named test set.

The first task of the script **"run_analysis.R"** consists of merging both data sets so as to create a single data frame named "mergeddata" with all the variables. Secondly, we select the columns corresponding to the mean value and the standard deviation of the different measurements for each subject and each activity. Note that for each subject different observations were done with the same activity. Finally, the script calculates the mean value of the measurements for each subject and activity by averaging over the measurements recorded during the repeated activities.

# Variables description

The script **"run_analysis.R"** builds three data frames:

1. **"mergeddata"** --> the merged data frame made up with the original dataset (10299 observations and 563 variables). Click [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to get the original data with the variables description, although the set and training data are not merged.

2. **"extract"** --> selection of the "mergeddata" data frame just with the mean values and the standard deviations of the original measurements.

3. **"result"** --> the data frame as a result of averaging the variables of the data frame "extract" across the common activities for each subject and each activity.


## The dataframe "extract"

This data set is an extract of the original merged dataset named "mergeddata" where only the variables corresponding to the mean and the standard deviation of each measurement have been collected.

Besides the first two columns, the variables of the data frame "extract" can be separated in those beginning by "t"
(time-domain signals) from those beginning by "f" (Fast Fourier Transform of the time signal variables).

The first part of the following table describes the variables corresponding to the mean values of both the time-domain signal and the frequency-domain signal measurements. The former variables spread over the columns 3 to 22, whereas the latter spread over the columns 23 to 35. The second part of the following table corresponds to the variables storing the standard deviation of the same measurements.

All the variables are without units, since the measurements have been normalized, so the values lie within the range [-1,+1].

The second part of the variables description corresponds to the variables storing the standard deviation
(std) of the same measurements as of the first part (besides the first two variables: "Subject" and "Activity"). Therefore, in the description of the variables of the second part we have just replaced "mean value" by std (abbreviation of standard deviation).

Notes: **FFT**: (Fast Fourier Transform);
       **std**: standard deviation

### <a name="head1a"></a>First part


| N. column |Variable name                 |    Class     |Description            |    Values          |
|-----------|------------------------------|--------------|-----------------------|--------------------|
|1          |Subject                       |Numeric       |Number of subject on which measurements are registered.   | [1-30] |
|2 |Activity |Character |Activity of the subject while the measurement was recorded.|<ul><li>LAYING</li><li>SITTING</li><li>STANDING</li><li>WALKING</li><li>WALKING DOWNSTAIRS</li><li>WALKING UPSTAIRS</li></ul> |
|3-5        |tBodyAcc-mean()-XYZ           |Numeric       |3-axial components of the mean value of the body acceleration signal|[-1,1] |
|6-8        |tGravityAcc-mean()-XYZ        |Numeric       |3-axial components of the mean value of the gravity acceleration. |[-1,1]   |
|9-11       |tBodyAccJerk-mean()-XYZ       |Numeric       |3-axial components of the mean value of the time-derivative of the body acceleration signal.|[-1,1]|
|12-14      |tBodyGyro-mean()-XYZ          |Numeric       |3-axial components of the mean value of the angular velocity of the body. |[-1,1]|
|15-17      |tBodyGyroJerk-mean()-XYZ      |Numeric       |3-axial components of the mean value of the angular acceleration of the body. |[-1,1]|
|18         |tBodyAccMag-mean()            |Numeric       |The mean value of the magnitude of the body acceleration.|[-1,1]    |
|19         |tGravityAccMag-mean()         |Numeric       |The mean value of the magnitude of the gravity acceleration.|[-1,1] |
|20         |tBodyAccJerkMag-mean()        |Numeric       |The mean value of the magnitude of the time-derivative of the body acceleration.|[-1,1] |
|21         |tBodyGyroMag-mean()           |Numeric       |The mean value of the magnitude of the angular velocity of the body.|[-1,1] |
|22         |tBodyGyroJerkMag-mean()       |Numeric       |The mean value of the magnitude of the angular acceleration of the body.|[-1,1] |
|23-25      |fBodyAcc-mean()-XYZ           |Numeric       |The mean value of the FFT of the 3-axial components of the body acceleration signal.|[-1,1] |
|26-28      |fBodyAccJerk-mean()-XYZ       |Numeric       |The mean value of the FFT of the 3-axial components of the time-derivative of the body acceleration signal.|[-1,1]|
|29-31      |fBodyGyro-mean()-XYZ          |Numeric       |The mean value of the FFT of the 3-axial components of the angular velocity of the body.|[-1,1] |
|32         |fBodyAccMag-mean()            |Numeric       |The mean value of the FFT of the magnitude of the body acceleration. |[-1,1] |
|33         |fBodyBodyAccJerkMag-mean()    |Numeric       |The mean value of the magnitude of the FFT of the time-derivative of the body acceleration.|[-1,1] |
|34         |fBodyBodyGyroMag-mean()       |Numeric       |The mean value of the magnitude of the FFT of the angular velocity of the body.|[-1,1]   |
|35         |fBodyBodyGyroJerkMag-mean()   |Numeric       |The mean value of the magnitude of the FFT of the angular acceleration of the body.|[-1,1] |

### <a name="head1b"></a>Second part

| N. column |Variable name                 |    Class     |Description            |    Values          |
|-----------|------------------------------|--------------|-----------------------|--------------------|
|36-38      |tBodyAcc-std()-XYZ            |Numeric       |3-axial components of the std of the body acceleration signal.|[-1,1] |
|39-41      |tGravityAcc-std()-XYZ         |Numeric       |3-axial components of the std of the gravity acceleration.|[-1,1]   |
|42-44      |tBodyAccJerk-std()-XYZ        |Numeric       |3-axial components of the std of the time-derivative of the body acceleration signal.|[-1,1] |
|45-47      |tBodyGyro-std()-XYZ           |Numeric       |3-axial components of the std of the angular velocity of the body.|[-1,1] |
|48-50      |tBodyGyroJerk-std()-XYZ       |Numeric       |3-axial components of the std of the angular acceleration of the body.|[-1,1] |
|51         |tBodyAccMag-std()             |Numeric       |The std of the magnitude of the body acceleration. |[-1,1]  |
|52         |tGravityAccMag-std()          |Numeric       |The std of the magnitude of the gravity acceleration. |[-1,1] |
|53         |tBodyAccJerkMag-std()         |Numeric       |The std of the magnitude of the time-derivative of the body acceleration. |[-1,1] |
|54         |tBodyGyroMag-std()            |Numeric       |The std of the magnitude of the angular velocity of the body. |[-1,1] |
|55         |tBodyGyroJerkMag-std()        |Numeric       |The std of the magnitude of the angular acceleration of the body. |[-1,1]  |
|56-58      |fBodyAcc-std()-XYZ            |Numeric       |The std of the FFT of the 3-axial components of the body acceleration signal. |[-1,1] |
|59-61      |fBodyAccJerk-std()-XYZ        |Numeric       |The std of the FFT of the 3-axial components of the time-derivative of the body acceleration signal.|[-1,1]|
|62-64      |fBodyGyro-std()-XYZ           |Numeric       |The std of the FFT of the 3-axial components of the angular velocity of the body.|[-1,1]|
|65         |fBodyAccMag-std()             |Numeric       |The std of the FFT of the magnitude of the body acceleration. |[-1,1] |
|66         |fBodyBodyAccJerkMag-std()     |Numeric       |The std of the magnitude of the FFT of the time-derivative of the body acceleration.|[-1,1] |
|67         |fBodyBodyGyroMag-std()        |Numeric       |The std of the magnitude of the FFT of the angular velocity of the body. |[-1,1] |
|68         |fBodyBodyGyroJerkMag-std()    |Numeric       |The std of the magnitude of the FFT of the angular acceleration of the body.|[-1,1] |


## The dataframe "result"

This dataset is built by sorting the dataframe "extract" by subject and by activity and applying the average to all the variables across the values of the variable "Activity" for each subject.

Besides the two first columns, the variables of the data frame "result" can be separated in those beginning by "t"
(time-domain signals) from those beginning by "f" (Fast Fourier Transform of the time signal variables).

Notes: **FFT**: (Fast Fourier Transform);
       **std**: standard deviation

### First part

| N. column |Variable name                        |    Class     |Description                |    Values          |
|-----------|------------------------------|--------------|-----------------------|--------------------|
|1          |Subject                              |Numeric       |Number of subject on which measurements are registered.|[1-30]|
|2          |Activity                             |Character     |Activity of the subject while the measurement was recorded.|<ul><li>LAYING</li><li>SITTING</li><li>STANDING</li><li>WALKING</li><li>WALKING DOWNSTAIRS</li><li>WALKING UPSTAIRS</li></ul> |
|3-5        |average(tBodyAcc-mean()-XYZ)         |Numeric       |The average across activities of tBodyAcc-mean()-XYZ (see [here](#head1a)) |[-1,1] |
|6-8        |average(tGravityAcc-mean()-XYZ)      |Numeric       |The average across activities of tGravityAcc-mean()-XYZ (see [here](#head1a)) |[-1,1] |
|9-11       |average(tBodyAccJerk-mean()-XYZ)     |Numeric       |The average across activities of tBodyAccJerk-mean()-XYZ (see [here](#head1a))|[-1,1] |
|12-14      |average(tBodyGyro-mean()-XYZ)        |Numeric       |The average across activities of tBodyGyro-mean()-XYZ (see [here](#head1a))|[-1,1] |
|15-17      |average(tBodyGyroJerk-mean()-XYZ)    |Numeric       |The average across activities of tBodyGyroJerk-mean()-XYZ (see [here](#head1a))|[-1,1] |
|18         |average(tBodyAccMag-mean())          |Numeric       |The average across activities of tBodyAccMag-mean() (see [here](#head1a)) |[-1,1]  |
|19         |average(tGravityAccMag-mean())       |Numeric       |The average across activities of tGravityAccMag-mean() (see [here](#head1a))|[-1,1] |
|20         |average(tBodyAccJerkMag-mean())      |Numeric       |The average across activities of tBodyAccJerkMag-mean() (see [here](#head1a)) |[-1,1]|
|21         |average(tBodyGyroMag-mean())         |Numeric       |The average across activities of tBodyGyroMag-mean() (see [here](#head1a)) |[-1,1] |
|22         |average(tBodyGyroJerkMag-mean())     |Numeric       |The average across activities of tBodyGyroJerkMag-mean() (see [here](#head1a)) |[-1,1] |
|23-25      |average(fBodyAcc-mean()-XYZ))        |Numeric       |The average across activities of fBodyAcc-mean()-XYZ) (see [here](#head1a)) |[-1,1]  |
|26-28      |average(fBodyAccJerk-mean()-XYZ)     |Numeric       |The average across activities of fBodyAccJerk-mean()-XYZ (see [here](#head1a))|[-1,1] |
|29-31      |average(fBodyGyro-mean()-XYZ)        |Numeric       |The average across activities of fBodyGyro-mean()-XYZ (see [here](#head1a))|[-1,1] |
|32         |average(fBodyAccMag-mean())          |Numeric       |The average across activities of fBodyAccMag-mean() (see [here](#head1a)) |[-1,1]  |
|33         |average(fBodyBodyAccJerkMag-mean())  |Numeric       |The average across activities of fBodyBodyAccJerkMag-mean() (see [here](#head1a)) |[-1,1]|
|34         |average(fBodyBodyGyroMag-mean())     |Numeric       |The average across activities of fBodyBodyGyroMag-mean() (see [here](#head1a)) |[-1,1] |
|35         |average(fBodyBodyGyroJerkMag-mean()) |Numeric       |The average across activities of fBodyBodyGyroJerkMag-mean() (see [here](#head1a))|[-1,1]|

### Second part

| N. column |Variable name                      |    Class     |Description                |    Values          
|-----------|------------------------------|--------------|-----------------------|--------------------|
|36-38      |average(tBodyAcc-std()-XYZ))       |Numeric       |The average across activities of tBodyAcc-std()-XYZ (see [here](#head1b)) |[-1,1] |
|39-41      |average(tGravityAcc-std()-XYZ)     |Numeric       |The average across activities of tGravityAcc-std()-XYZ (see [here](#head1b))|[-1,1] |
|42-44      |average(tBodyAccJerk-std()-XYZ)    |Numeric       |The average across activities of tBodyAccJerk-std()-XYZ (see [here](#head1b))|[-1,1] |
|45-47      |average(tBodyGyro-std()-XYZ)       |Numeric       |The average across activities of tBodyGyro-std()-XYZ (see [here](#head1b)) |[-1,1] |
|48-50      |average(tBodyGyroJerk-std()-XYZ)   |Numeric       |The average across activities of tBodyGyroJerk-std()-XYZ (see [here](#head1b))|[-1,1]|
|51         |average(tBodyAccMag-std())         |Numeric       |The average across activities of tBodyAccMag-std() (see [here](#head1b)) |[-1,1] |
|52         |average(tGravityAccMag-std())      |Numeric       |The average across activities of tGravityAccMag-std() (see [here](#head1b)) |[-1,1]|
|53         |average(tBodyAccJerkMag-std())     |Numeric       |The average across activities of tBodyAccJerkMag-std() (see [here](#head1b))|[-1,1] |
|54         |average(tBodyGyroMag-std())        |Numeric       |The average across activities of tBodyGyroMag-std() (see [here](#head1b))|[-1,1] |
|55         |average(tBodyGyroJerkMag-std())    |Numeric       |The average across activities of tBodyGyroJerkMag-std() (see [here](#head1b))|[-1,1]|
|56-58      |average(fBodyAcc-std()-XYZ)        |Numeric       |The average across activities of fBodyAcc-std()-XYZ) (see [here](#head1b))|[-1,1] |
|59-61      |average(fBodyAccJerk-std()-XYZ)    |Numeric       |The average across activities of fBodyAccJerk-std()-XYZ (see [here](#head1b))|[-1,1] |
|62-64      |average(fBodyGyro-std()-XYZ)       |Numeric       |The average across activities of fBodyGyro-std()-XYZ (see [here](#head1b))|[-1,1] |
|65         |average(fBodyAccMag-std())         |Numeric       |The average across activities of fBodyAccMag-std() (see [here](#head1b))|[-1,1] |
|66         |average(fBodyBodyAccJerkMag-std()) |Numeric       |The average across activities of fBodyBodyAccJerkMag-std() (see [here](#head1b))|[-1,1]|
|67         |average(fBodyBodyGyroMag-std())    |Numeric       |The average across activities of fBodyBodyGyroMag-std() (see [here](#head1b))|[-1,1]|
|68         |average(fBodyBodyGyroJerkMag-std())|Numeric       |The average across activities of fBodyBodyGyroJerkMag-std() (see [here](#head1b))|[-1,1]|