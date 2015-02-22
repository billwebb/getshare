---
title: "Codebook - Coursera - Getting and Cleaning Data - Class Project"
author: "Bill Webb"
date: "02/22/2015"
output: html_document
---

This file reads in the Human Activity Recognition Using Smartphones Data Set, then consoldates and labels all the data.  Only data columns that include mean and std data is stored.  The output is a tidy dataset that includes the mean of each of the data columns against both the Activity and Subject.

The tidy data set includes the following fields -

* *Subject* - Factor indicating Subject ID of observation
* *Activity.Name* - Factor indicating Name of Activity of observation
* *Mean* values of each observation by *Subject* and *Activity.Name* for only the mean() and std() of this fields (all fields Real numbers) -
    - BodyAcc-XYZ
    - tGravityAcc-XYZ
    - tBodyAccJerk-XYZ
    - tBodyGyro-XYZ
    - tBodyGyroJerk-XYZ
    - tBodyAccMag
    - tGravityAccMag
    - tBodyAccJerkMag
    - tBodyGyroMag
    - tBodyGyroJerkMag
    - fBodyAcc-XYZ
    - fBodyAccJerk-XYZ
    - fBodyGyro-XYZ
    - fBodyAccMag
    - fBodyAccJerkMag
    - fBodyGyroMag
    - fBodyGyroJerkMag
