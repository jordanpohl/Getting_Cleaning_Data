Library(dplyr)
library(reshape2)

## Task #1
## Read in all of the data
test.labels <- read.table("/test/y_test.txt", col.names="label")
test.subjects <- read.table("test/subject_test.txt", col.names="subject")
test.data <- read.table("test/X_test.txt")
train.labels <- read.table("train/y_train.txt", col.names="label")
train.subjects <- read.table("train/subject_train.txt", col.names="subject")
train.data <- read.table("train/X_train.txt")

## Merge the two data sets together by labels, subjects, and data
data_set <- rbind(cbind(test.labels, test.subjects, test.data), cbind(train.labels, train.subjects, train.data))

## Task#2
## Load the column names
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)

## Retain only the mean and standard deviation for each measurement
extract_features <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

# select the means and standard deviations from the data and increment by 2
data_mean_std <- data_set[, c(1, 2, extract_features$V1+2)]

## Task#3
## reads the descriptive activiy labels
label <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
## renames the activities in the dataset
data_mean_std$label <- labels[data_mean_std$label, 2]

## Task#4
## makes a list of the current column names and feature names
clean_colnames <- c("subject", "label", extract_features$V2)

## cleans that list by removing every non-alphabetic character and converting to 
## lowercase
clean_colnames <- tolower(gsub("[^[:alpha:]]", "", clean_colnames))

## uses the list as column names for the data
colnames(data_mean_std) <- clean_colnames

## Task 5
## creates a second dataset with the average of each variable
## for each activity and each subject
avg_data <- aggregate(data_mean_std[, 3:ncol(data_mean_std)],
                       by=list(subject = data_mean_std$subject, 
                               label = data_mean_std$label), mean)
                       
# write the data for course upload
write.table(format(avg_data, scientific=T), "tidy2.txt",
            row.names=F, col.names=F, quote=2)
