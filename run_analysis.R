library(plyr)

#Merge the training and the test sets to create one data set
X.train <- read.table("train/X_train.txt")
X.test <- read.table("test/X_test.txt")
X.df <- rbind(X.train, X.test)
y.train <- read.table("train/y_train.txt")
y.test <- read.table("test/y_test.txt")
y.df <- rbind(y.train, y.test)
names(y.df) <- "activity"
subject.train <- read.table("train/subject_train.txt")
subject.test <- read.table("test/subject_test.txt")
subject.df <- rbind(subject.train, subject.test)
names(subject.df) <- "subject"

#Extract the measurements on the mean and standard deviation for each measurement
features <- read.table("features.txt")
mean.std <- grep("mean|std", features[, 2])
X.df <- X.df[, mean.std]
names(X.df) <- features[mean.std, 2]

#Use descriptive activity names to name the activities in the data set
activity.labels <- read.table("activity_labels.txt")
y.df[, 1] <- activity.labels[y.df[, 1], 2]
y.df[, 1] <- as.factor(y.df[, 1])

#Appropriately label the data set with descriptive variable names
names(X.df) <- gsub("Acc", "Acceleration", names(X.df))
names(X.df) <- gsub("Freq", "Frequency", names(X.df))
names(X.df) <- gsub("Mag", "Magnitude", names(X.df))
names(X.df) <- gsub("mean", "Mean", names(X.df))
names(X.df) <- gsub("std", "Std", names(X.df))
names(X.df) <- gsub("^t","TimeDomain", names(X.df))
names(X.df) <- gsub("^f","FrequencyDomain", names(X.df))
names(X.df) <- gsub("[-()]", "", names(X.df))

#Create a tidy data set with the average of each variable for each activity and each subject
df <- cbind(X.df, y.df, subject.df)
tidy.df <- ddply(df, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(tidy.df, "tidydata.txt", row.name=FALSE)