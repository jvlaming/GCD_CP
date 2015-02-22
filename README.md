# Getting and Cleaning Data - Programming Assignment

README.txt

Getting and Cleaning Data : Course Project

This readme file explains how to use and run the run_analysis.R script

##Purpose and source of data
The script is written for the Coursera "Getting and Cleaning Data" Course Project which uses data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Packages used
This script uses the following package(s):
- dplyr : install.packages("dplyr")
The script will load the relevant libraries but the user should make sure the package has been installed before running the script.

##Get started:

* download the source data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Unzip this to a folder  your R working dir. Rename this ("UCI HAR Dataset") folder to "GCDPA".

* Place the "run_analysis.R" script in your work directory.

* Run the script from RStudio by using the command:  source("run_analysis.R")

* The script will generate a text file name "merged_set_mean.txt" in the work directory.
This file contains 180 rows x 68 columns with mean values for variables grouped by subject and activity.

* The file can be read back into RStudio using 
df <- read.table("merged_set_mean.txt", header=TRUE)

##Explanation of the code

The script run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The script is commented in detail in the code. The main steps are explained below:

Note that this script selects the relevant columns (step 2) from both test and training sets before merging the sets (step 1) thus reducing the memory use of the script.

1) read the variable names from "features.txt"

2) use grep to select only the columns containing the 'mean()' or 'std()' strings and produces two vectors; one containing the column names and another containing the indices of the relevant columns.

3) create a vector of length 561 (original number of columns) that contains either the value 16 (width of a column to be read) or -16 (width of a column to be skipped). This is used when reading the "x_test/train.txt" data using fixed width format.

4) read the three training files (subject_train.txt, subject_train.txt, x_train.txt). The first two are read using read.csv, the last file is read using read.fwf (fixed width) where the vector from step 3 guides the reading and skipping of columns. Bind the three training sets using cbind and store as df_train.

5) read the three test files (subject_test.txt, subject_test.txt, x_test.txt). The first two are read using read.csv, the last file is read using read.fwf (fixed width) where the vector from step 3 guides the reading and skipping of columns. Bind the three test sets using cbind and store as df_test.

6) merge df_train and df_test using rbind into a single set name df_merge.

7) set the labels for df_merge and arrange by subject and activity_id.

8) read the activities from "activity_labels.txt" into "acts" and label the activities in df_merge by linking df_merge and acts using merge.

9) reorder the columns in df_merge (put activity in front) and remove the activity_id column.

10) clean up the column names for the merged set by removing dashes and brackets, putting in CamelCase and elaborating the prefixes t and f.

11) create the final tidy data set in wide format by calculing the mean of all variables in df_merge, grouped by subject and activity. This is done using the aggregate function and produces df_merge_mean.

12) write df_merge_mean to file "merged_set_mean.txt".




