## Code Book


This code book describes the data used in this project.
The base data is decribed at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Detailed information of data set are provided by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto.

#Project
We intend to practice how to get and clean data for analisys in R.

### DATA INPUT

Data consist of 10299 observations, particioned as 30% for test and 70% for train. 
That is, 2947 rows for test and 7352 rows for train.
The observations came from 30 subjects which did five activities: Walking, Walking Upstairs, Walking Downstair, Sitting
and Standing.
Files used:
* features
* activity_labels	
* X_train, y_train , subject_train
* y_test, X_test, subject_test

### OUTPUT

The output of of the analysis script is a data set with no NAs, and with the following columns:
*subjectID: an integer numeric field corresponding to the 30 volunters.
*activity: the activity string performed by the volunteers.
*and 61 columns or variables of media() and standard deviation() calculated from the original data, for each activity and each subject. 

