# run_analysis.R
# script for Getting and Cleaning Data - Course Project
# 
# uses data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# see instructions in README.md
# by J. Vlaming, february 2015


## preparation
    # remove all existing stuff from memory
    rm(list=ls())

    # load the required libraries
    library(dplyr) 
    library(tidyr)

    
# 1. Merges the training and the test sets to create one data set. 
    # note; merging is done after extracting the relevant colums to reduce memory use.  
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

    # read features.txt to decide on which (mean and standard deviation) colums to load into memory
    cols <- read.table("data/features.txt", header=FALSE, sep=" ")
    
    # find fields with either mean() or std() in name
      # note, use double backslashes to escape the brackets in grep
    cols_sub_idx <- grep("mean\\(\\)|std\\(\\)", cols$V2) # indices of those columns
    cols_sub_names <- grep("mean\\(\\)|std\\(\\)", cols$V2, value=TRUE) # names of those columns 
    
    # prepare column-with vector that reads the marked columns (of width 16) but ignores the other columns (i.e. width = -16)
     # set column width for reading the data files
    default_col_width = 16
    col_widths <- rep(-1 * default_col_width, nrow(cols)) # vector of 561 values -16 (i.e. ignore column of that width) 
    col_widths[cols_sub_idx] <- default_col_width # then set those contain "mean" or "std" to 16 (i.e. will be read)
    
    # read the training set
    s <- read.csv("data/train/subject_train.txt", header=FALSE) # read the subject data: explicitly set header to false for csv
    y <- read.csv("data/train/y_train.txt", header=FALSE) # read the y data (activity id): explicitly set header to false for csv
    x <- read.fwf("data/train/x_train.txt", widths=col_widths, header=FALSE, buffersize=500)
    df_train <- cbind(s,y,x)
    
    # read the test set
    s <- read.csv("data/test/subject_test.txt", header=FALSE) # read the subject data: explicitly set header to false for csv
    y <- read.csv("data/test/y_test.txt", header=FALSE) # read the y data (activity id): explicitly set header to false for csv
    x <- read.fwf("data/test/x_test.txt", widths=col_widths, header=FALSE, buffersize=500)
    df_test <- cbind(s,y,x)
    
    
# 1. Merges the training and the test sets to create one data set.    
    # merge the two and set column names
    df_merge <- rbind(df_train, df_test)
    # remove the old sets from memory
    ##  OPTIONAL rm(df_train); rm(df_test)    
    
    # set the df_merge names (note that activity will be added in next step)
    colnames(df_merge) <- c("subject", "activity_id", cols_sub_names)
    
    # order rows by activity and subject
    #df_merge <- arrange(df_merge, subject, activity_id)
    
    
# 3. Uses descriptive activity names to name the activities in the data set
    # read the activity label file and label columns "id" and "label" 
    acts <- read.fwf("data/activity_labels.txt", widths=c(2,20), header=FALSE, col.names=c("id","activity"))     
    # lookup the activity labels    
    df_merge <- merge(df_merge, acts, by.x="activity_id", by.y="id", all=TRUE)
        
    # reorder columns: move "activity" to position 1 and remove "activity_id"
    df_merge <- df_merge[,c(69, 2:68)]
    
    df_merge <- arrange(df_merge, subject, activity)
    
    
# 4. Appropriately label the data set with descriptive variable names
    
    # tidy the column names: 
    # Remove non-alfabet characters : 1) remove - (dashes), 2) remove () (brackets), 
#    cols_sub_names <- gsub("-","",cols_sub_names)        # 1) use gsub to replace all occurences
#    cols_sub_names <- sub("\\(\\)","",cols_sub_names)    # 2)
    # Camel-case the variable names
    # 3) change mean to Mean and 4) std to Std
#    cols_sub_names <- sub("mean","Mean",cols_sub_names)  # 3)
#    cols_sub_names <- sub("std","Std",cols_sub_names)    # 4)
    # Clarify the pre-fixes t and f
    # 5) change t to Time and 6) change f to Freq
#    cols_sub_names <- sub("^t","Time",cols_sub_names)    # 5)
#    cols_sub_names <- sub("^f","Freq",cols_sub_names)    # 6)
    
    # set the tidy df_merge column names
    colnames(df_merge) <- c("activity", "subject", cols_sub_names)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.    
    
    # summarize the columns in df_merge. Take mean and group by subject and activity
    # note: set the column names for the 'group by' fields explicitly otherwise these will default to Group.1, Group.2 etc
    
    # this is the WIDE format: each original measurement variable hs its own column
    df_mean_wide <- aggregate(x=df_merge[3:68], by=list(subject = df_merge$subject, activity=df_merge$activity), FUN=mean)
    
    # convert to a tidier format with 4 columns: subject and activity as-is; 
    # column measurement contains the original measurement variable name; 
    # column average_value is the average for that measurement over subject and activity
    df_mean_tall <- gather(df_mean_wide, measurement, average_value, -subject, -activity) 
    
    

# write results to file for verifications
    # note: set row.name=FALSE otherwise extra column will be written at start of file
    
    # wide format set
    write.table(df_mean_wide, "merged_mean_wide.txt", row.name=FALSE)
    
    # narrow tidy format
    write.table(df_mean_tall, "merged_mean_tall.txt", row.name=FALSE)
    
    
    # end of script
    
