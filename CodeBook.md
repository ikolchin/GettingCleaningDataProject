#Getting and Cleaning Data Course Project Codebook

###Transformations performed with raw data
It was assumed that source files are located in the working directory. The following five steps summarize transformations performed in the script run_analyis.R to obtain a tidy dataset.

####1. Merging the training and test sets
Text files containing training and test data were read into R dataframes and merged.

####2. Extracting standard deviation measurements
Feature names were filtered to leave only those containing "mean" or "std" in their names which corresponds to the measurements on the mean and standard deviation.

####3. Adding descriptive activity names
Descriptive activity labels were read from the corresponding source file and added to the dataset.

####4. Labeling the data set with descriptive variable names
Abbreviations were replaced with full words (e.g. "Magnitude" instead of "Mag"), special characters removed, variable names transformed to UpperCamelCase to make them more readable.

####5. Creating an independent tidy data set
The final dataset was created by taking average values of each variable for each activity and each subject. The dataset was then written into a text file.
