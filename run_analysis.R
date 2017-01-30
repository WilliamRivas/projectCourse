# This function constructs a tidy data set from train and test data published on 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# The function do the following:
# STEP 1 Merges the training and the test sets to create one data set
# STEP 2 Extracts only the measurements on the mean and standard deviation for each measurement
# STEP 3 Puts a descriptive activity names to name the activities in the data set
# STEP 4 It labels the data set with descriptive variable names
# STEP 5 It creates a second, independent tidy data set with from dataset in STEP 4
# the average of each variable for each activity and each subject

# To use the function just download and descompress data in RStudio working directory 
#and then call getTidyData() at RStudio prompt

getTidyData <- function() {
# sTEP 1
#read features and name columns
  message("reading features and naming columns ..")
  
  features <- read.table("./UCI HAR Dataset/features.txt")
  names(features)<-c("feature_id","feature_name")

# Read train data and names columns
  
  message("reading train data and naming columns ..")
  
  x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
  names(x_train) <- features$feature_name
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  names(y_train)<-"activity_id"

# Read test data and names columns
  message("reading test data and nammings columns")

  x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  names(x_test) <- features$feature_name
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
  names(y_test)<-"activity_id"
  
# read the subject data 

  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  names(subject_test)="subject"
  
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  names(subject_train)<-"subject"

# Gather all the train data
  train <- cbind(subject_train, y_train, x_train)

# Gather all the test data
  test <- cbind(subject_test, y_test, x_test)
  
# Combine all the test data and the train data
  message("gathering data ..")
  
  combined <- rbind(train, test)

#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
  
  mean_std_cols <-grepl("mean|std", names(combined))
  # but we want to include first and second column
  mean_std_cols[1:2] <-TRUE
  combined <- combined[, mean_std_cols]

#Step 3: replace integers by strings of activities in the data set
  message("Reemplacing activity_id by labels")

  lbs <-c("walking","Walking Upstairs","Walking Downstairs","sitting","Standing","LAYING")
  #activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
  combined$activity_id <- factor(combined$activity_id, labels=lbs)

## STEP 4: Appropriately labels the data set with descriptive
## activity names. For this, we use the vector labels
#done in STEP 1 and variables names should be the same

# STEP 5: From the data set in step 4, we create a second independent tidy data setwith 
# the average of each variable for each activity and each subject 
 
 library(reshape2)
 melted_data <- melt(combined, id=c("subject","activity_id"))

# Apply mean function to dataset using dcast function 
 
  tidy <- dcast(melted_data, subject + activity_id ~ variable, mean)
  

# Finally we write a file with tidy data in the working directory
  message("creating tidy_data .txt file")
  write.table(tidy, file = "./tidy_data.txt")
}