## Getting and Cleaning Data - Coursera
## February 2015
## Class Project

## This file reads in the Human Activity Recognition Using Smartphones Data Set, then
## consoldates and labels all the data.  Only data columns that include mean and std
## data is stored.  The output is a tidy dataset that includes the mean of each of the 
## data columns against both the Activity and Subject.


## getData() - Downloads and extracts the raw dataset.

getData <- function() {
    # Location of data the use
    dataSource <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    
    # If data directory doesn't exist, create it then make it 
    # the working directory.
    dir.create(file.path(getwd(), "data"), showWarnings = FALSE)
    
    # Download data
    download.file(dataSource, "./data/data.zip", method="curl")
    
    # Unzip data
    unzip("data/data.zip", exdir="./data")    
}

## readData() - Reads the necessary raw data files and stores in 
## several gobal data frames.

readData <- function() {
    # Read in all of the raw data from the various files.  Save in global variables.
    activity_labels <<- read.table("./data/UCI HAR Dataset/activity_labels.txt")
    features <<- read.table("./data/UCI HAR Dataset/features.txt")
    features <<- read.table("./data/UCI HAR Dataset/features.txt")
    subject_test <<- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
    X_test <<- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    y_test <<- read.table("./data/UCI HAR Dataset/test/y_test.txt")
    subject_train <<- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
    X_train <<- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    y_train <<- read.table("./data/UCI HAR Dataset/train/y_train.txt")   
}    

## runAnalysis()
## Input:
##    dlData = FALSE - specifies whether data should be downloaded
##    rdData = FALSE - specifies whether data should be read from file
##  This is the main function that will first download and read in the needed data.
##  The mean and std columns are kept, but the rest of the data is dropped.
##  Then, it will merge the data and label all the columns.  The aggregate means
##  are calculated for all data columns across Subject and Activity.  The tidy
##  data is then returned and also written to a file.

runAnalysis <- function(dlData = FALSE, rdData=FALSE) {
    # Download data only if we're told to
    if (dlData) {
        getData()
    }
    
    # Read data only if we're told to
    if (rdData) {
        readData()
    }
    
    # Merge the data.
    all_X <<- rbind(X_test, X_train)
    all_y <<- rbind(y_test, y_train)
    all_subject <<- rbind(subject_test, subject_train)
    
    # Label the columns from the features data.
    colnames(all_X) <<- features[,2]
    
    # Extract only mean and std data.
    stdMean_X <<- all_X[, grep("std|mean", features[,2], ignore.case=TRUE)]
    
    # Label Subject column and bind with data.
    colnames(all_subject) <<- c("Subject")
    stdMean_X <<- cbind(all_subject, stdMean_X)
    
    # Label Activity-ID column and bind with data.
    colnames(all_y) <<- c("Activity.ID")
    stdMean_X <<- cbind(all_y, stdMean_X)
    
    # Label activity label columns and merge with data.
    colnames(activity_labels) <<- c("Activity.ID", "Activity.Name")
    stdMean_X <<- merge(activity_labels, stdMean_X, by="Activity.ID")
    
    # Calculate mean of columns by subject and activity.
    aggData <<- aggregate(as.matrix(stdMean_X[,4:ncol(stdMean_X)]), as.list(stdMean_X[,2:3]), FUN=mean)
    aggData <<- aggData[,c(2,1,3:ncol(aggData))]
    
    # Rename columns
    nam <- names(aggData)
    names(aggData) <<- ifelse(nam %in% c("Subject", "Activity.Name"), 
                          nam, str_c(nam, '.mean'))
    
    # Write aggregated data to file
    write.table(aggData, file="./tidy.txt", row.name=FALSE)
    aggData
}

tidyData <- runAnalysis(TRUE,TRUE)