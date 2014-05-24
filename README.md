## Getting and Cleaning Data Course Project

### Introduction

The purpose of this project is to demonstrate the abilities to collect, work with and clean a data set.  The work involves getting and writting data, merging and subseting data, computing summary statistics. The goal is to prepare tidy data that can be used for later analysis.

### The row data

Here are [the raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for the project. The data was collected from the accelerometer and gyroscope from the Samsung Galaxy S smartphone. A full description is availabel at [this site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

There are 8 files we uses

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

* 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* 'features.txt': List of all 561 features.

* 'activity_labels.txt': Links the class labels with their activity name.

### How the script works

To obtain the final tidy data, the following work was performed:

* Read the train, train labels, train subjuct data into R, and then combined them into one data set named ctrain which contains 7352 observations and 563 variables.

* Read the test, test labels, test subjuct data into R, and then combined them into one data set named ctest which contains 2947 observations and 563 variables. 

* Merged data set ctrain and ctest to one big data set called alldata which contains 10299 observations and 563 variables.

* Read the feature data which has 561 observations into R and replace 561 variables' names of alldata.

* Found the variables which contains mean() or std() and subset alldata based on those 79 variables to mydata which contains 10299 observations and 81 variables. .

* Read the activity data into R and used it to name the value of activities in the data set mydata by changing 1-6 to WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

* Edited the variables of mydata by getting rid off all "-" and "()".

* Checked for missing values and found out there is no missing vale.

* Used aggregate function to compute the average of each variable for each activity and each subject. Put the result in a data set called tidydata which contains 180 observations and 81 variables

* Wrote the tidydata to a text file.
