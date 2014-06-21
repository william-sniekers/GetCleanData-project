CodeBook 
========================================================
This CodeBook describes the actions taken on the input data
to obtain a tidy dataset following the requirements as
specified in the course project on:
* https://class.coursera.org/getdata-004/human_grading/view/courses/972137/assessments/3/submissions

For information about the input data please refer to:
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

At the time of the assignment the input data was downloadable at:
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Transformation steps:
The script run.analysis.R performs the following steps on the input data:
* 0. Gets input data and unzips the files.

Only download and unip if it is nessesary.

* 1. Merges the training and the test sets to create one data set.

Open the train and test data files and combine them to one dataframe (X).
Open the train and test activity files and combine them to one dataframe (Y).
Open the train and test subject files and combine them to one dataframe (subject).
Each of the above dataframes has 10299 rows - equal to the number of instances reported for the source data.

* 2. Extracts only the measurements on the mean and standard deviation for each measurement

Select the right colums from X (with mean and standard deviation info). 

* 3. Uses descriptive activity names to name the activities in the data set

Assign the descriptive names to the data set in stead of the numbers in the original data.

* 4. Appropriately labels the data set with descriptive variable names.

.

* 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Step 4 creates a tidy dataset and writes it to disk. Step 5 creates anonther tidy dataset.
This CodeBook describes Both.

## DataSet description
### CleanDataSet.txt
Columns:
* Subject - the number (0:30) indicating the person testing
* Activity - the activity for this measurement
* tBodyAcc-mean()-X - this measurement and all following see specs input data
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* BodyAccJerk-std()-
* BodyAccJerk-std()-Z
* BodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()

### Averages.txt
The run.analysis.R script also produces the file Averages.txt answering the last question in the assignment. This file contains 30 rows (one for each voluntair) and 7 columns (each for one actitivy). The values are the means of the 66 numeric variables.

Columns:
* Subject - the number (0:30) indicating the person testing
* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS