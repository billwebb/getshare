---
title: "Coursera - Getting and Cleaning Data - Class Project"
author: "Bill Webb"
date: "02/22/2015"
output: html_document
---

This file reads in the Human Activity Recognition Using Smartphones Data Set, then consoldates and labels all the data.  Only data columns that include mean and std data is stored.  The output is a tidy dataset that includes the mean of each of the data columns against both the Activity and Subject.

The steps are as follows -

1. Download data files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip
2. Read in the following files:
  * activity_labels.txt - Labels of activity types
  * features.txt - List of features that were measured
  * subject_test.txt - Subject ID for each test sample
  * X_test.txt - Observation data for each test sample
  * y_test.txt - Reference to test label
  * subject_train.txt - Subject ID for each training sample
  * X_train.txt - Observation data for each training sample
  * y_train.txt - Reference to training label   
3. Merge the training and test data using rbind().
4. Label all the columns using the features.txt data.
5. Filter out all data except mean and std fields.
6. Apply Activity.ID from y_* files, then apply Activity.Name to all observation rows.
7. Calculate mean of each column according to Activity and Subject and provide as new data set.
8. Write data set up a file called tidy.txt.

The script is executing with this function -

**runAnalysis(dlData = FALSE, rdData=FALSE)**

* dlData - TRUE if data files should be downloaded
* rdData - TRUE if data files should be read and stored in global variables
 

