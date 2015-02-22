#Codebook for "merged_mean_long.txt"

this codebook goes with the run_analysis.R script and a README.md file.

This set contains 11880 obs. of  4 variables:

For a description of the variables in the original data set, see files feature_info.txt and features.txt from file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following modifications were made on the original data

1) test and training sets were merged

2) subject and activity columns were added to the values and the activity_id's were converted to activity labels

3) a header row (column names) was provided

4) a sub-selection of columns was made; only the 66 variables with Standard Deviation ("Std()") or Mean ("Mean()") values of the original signals were selected.

5) variable names were tidied up: a) removing dashes and brackets, b) putting in CamelCase, c) elaborating the prefixes t and f to Time and Freq respectively

6) an aggregated (this) set was created by calculating the Mean value for each of the 66 variables while grouping on subject and activity.

The exact steps take to get to this data set are detailed in the README.md file


##Data dictionary

"1" "activity" 
Type: Factor w/ 6 levels LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS 
Explanation: One of six different activities for which measurements are taken.

"2" "subject"
Type: Integer 1..30 
Explanation: id number to identify the subject (test person) of the study. Labels unknown.

"3" "measurement"
Type: Factor w/ 66 Levels: TimeBodyAccMeanX TimeBodyAccMeanY TimeBodyAccMeanZ TimeBodyAccStdX TimeBodyAccStdY ... FreqBodyBodyGyroJerkMagStd
Actual values: 
 TimeBodyAccMeanX            TimeBodyAccMeanY            TimeBodyAccMeanZ            TimeBodyAccStdX            
 TimeBodyAccStdY             TimeBodyAccStdZ             TimeGravityAccMeanX         TimeGravityAccMeanY        
 TimeGravityAccMeanZ         TimeGravityAccStdX          TimeGravityAccStdY          TimeGravityAccStdZ         
 TimeBodyAccJerkMeanX        TimeBodyAccJerkMeanY        TimeBodyAccJerkMeanZ        TimeBodyAccJerkStdX        
 TimeBodyAccJerkStdY         TimeBodyAccJerkStdZ         TimeBodyGyroMeanX           TimeBodyGyroMeanY          
 TimeBodyGyroMeanZ           TimeBodyGyroStdX            TimeBodyGyroStdY            TimeBodyGyroStdZ           
 TimeBodyGyroJerkMeanX       TimeBodyGyroJerkMeanY       TimeBodyGyroJerkMeanZ       TimeBodyGyroJerkStdX       
 TimeBodyGyroJerkStdY        TimeBodyGyroJerkStdZ        TimeBodyAccMagMean          TimeBodyAccMagStd          
 TimeGravityAccMagMean       TimeGravityAccMagStd        TimeBodyAccJerkMagMean      TimeBodyAccJerkMagStd      
 TimeBodyGyroMagMean         TimeBodyGyroMagStd          TimeBodyGyroJerkMagMean     TimeBodyGyroJerkMagStd     
 FreqBodyAccMeanX            FreqBodyAccMeanY            FreqBodyAccMeanZ            FreqBodyAccStdX            
 FreqBodyAccStdY             FreqBodyAccStdZ             FreqBodyAccJerkMeanX        FreqBodyAccJerkMeanY       
 FreqBodyAccJerkMeanZ        FreqBodyAccJerkStdX         FreqBodyAccJerkStdY         FreqBodyAccJerkStdZ        
 FreqBodyGyroMeanX           FreqBodyGyroMeanY           FreqBodyGyroMeanZ           FreqBodyGyroStdX           
 FreqBodyGyroStdY            FreqBodyGyroStdZ            FreqBodyAccMagMean          FreqBodyAccMagStd          
 FreqBodyBodyAccJerkMagMean  FreqBodyBodyAccJerkMagStd   FreqBodyBodyGyroMagMean     FreqBodyBodyGyroMagStd     
 FreqBodyBodyGyroJerkMagMean FreqBodyBodyGyroJerkMagStd 

Explanation: 
	- The values for Measurement are derived from the original measurement variable names as provided in (source files) features_info.txt and features.txt.
	Part of features_info.txt is echoed at the bottom of this codebook.
	- The orginal Measurement variable names are tidied up for better readability as descrivbed in step 5) above.
 
 
"4" "average_value"
Type: Numeric -0.99767 .. 0.97451 
Explanation: The Calculated average for each group of subject x activity x measurement

-- end of data dictionary --



# From the description of the source data set in file "features_info.txt"

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation


 -- end of file --
 
