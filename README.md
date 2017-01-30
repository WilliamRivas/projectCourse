##Getting and Cleaning Data Project


The project has one function named run_analysis.R

This function constructs a tidy data set from train and test data published on
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* The function do the following:
* Merges the training and the test sets to create one data set
* Extracts only the measurements of the mean() and std() for each measurement
* Puts a descriptive string for the activityID and activity
* Calculate the average of each variable mean() and std() for each activity and each subject

To run the function, please first download input data and descompress it in your RStudio working directory. 
Then call getTidyData() at RStudio prompt.

Credits for coursera.org and Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory. DITEN - Università degli Studi di Genova.