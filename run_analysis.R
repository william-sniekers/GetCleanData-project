# 0. Get dataset and unzip files
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("dataset.zip")) {
        download.file(fileURL, destfile = "./dataset.zip")
}
if (!file.exists("UCI HAR Dataset")) {
        unzip("dataset.zip")
}

# 1. Merges the training and the test sets to create one data set.
if (!exists("X_train")) {
        X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
}
if (!exists("y_train")) {
        y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
}
if (!exists("subject_train")) {
        subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
}
if (!exists("X_test")) {
        X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
}
if (!exists("y_test")) {
        y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
}
if (!exists("subject_test")) {
        subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
}

X <- rbind(X_train, X_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_test, subject_train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
if (!exists("features")) {
        features <- read.table("./UCI HAR Dataset/features.txt")
}
# Keep the features containing "-mean()" or "-std()".
# Filtering on "mean" or "std" does not behave as expected
# because that also hits on "fBodyAcc-meanFreq()-X" for example.
mask <- grep("-mean\\(\\)|-std\\(\\)", features[,2])
X <- X[,mask]

# 3. Uses descriptive activity names to name the activities in the data set
if (!exists("activity_labels")) {
        activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
}
Y[,1] <- activity_labels[Y[,1],2]

# 4. Appropriately labels the data set with descriptive variable names.
names(X) <- features[mask,2]
names(Y) <- "Activity"
names(Subject) <- "Subject"

CleanDataSet <- cbind(Subject, Y, X)
write.table(CleanDataSet, "CleanDataSet.txt")

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
# melt() will use all non id vars as measure if measure.vars is not specified.
MeltedDataSet <- melt(CleanDataSet,id.vars=c("Subject","Activity"))
Averages <- dcast(MeltedDataSet,Subject ~ Activity,mean)
write.table(Averages, "Averages.txt")

