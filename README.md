# Getting_Cleaning_Data

For creating a tidy data set of wearable computing data originally from 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Files in this repo

You should create one R script called run_analysis.R that does the following.
1.
Merges the training and the test sets to create one data set.
2.
Extracts only the measurements on the mean and standard deviation for each measurement.
3.
Uses descriptive activity names to name the activities in the data set
4.
Appropriately labels the data set with descriptive activity names.
5.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Notes

Only variables containing mean() & std() are used.
Requires the plyr & reshape2 packages.
Assumes the dataset is unzipped in the current directory.
