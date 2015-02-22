#Codebook for "merged_set_mean.txt"

this codebook goes with the run_analysis.R script and a README.md file.

This set contains 86 variables and 180 records

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
Factor w/ 6 levels LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS 

"2" "subject"
Integer 1..30 to identify the subject (test person) of the study

"3" "TimeBodyAccMeanX": Mean for variable tBodyAcc-mean()-X: range [-1..1]
"4" "TimeBodyAccMeanY": Mean for variable tBodyAcc-mean()-Y: range [-1..1]
"5" "TimeBodyAccMeanZ": Mean for variable tBodyAcc-mean()-Z: range [-1..1]
"6" "TimeBodyAccStdX": Mean for variable tBodyAcc-std()-X: range [-1..1]
"7" "TimeBodyAccStdY": Mean for variable tBodyAcc-std()-Y: range [-1..1]
"8" "TimeBodyAccStdZ": Mean for variable tBodyAcc-std()-Z: range [-1..1]
"9" "TimeGravityAccMeanX": Mean for variable tGravityAcc-mean()-X: range [-1..1]
"10" "TimeGravityAccMeanY": Mean for variable tGravityAcc-mean()-Y: range [-1..1]
"11" "TimeGravityAccMeanZ": Mean for variable tGravityAcc-mean()-Z: range [-1..1]
"12" "TimeGravityAccStdX": Mean for variable tGravityAcc-std()-X: range [-1..1]
"13" "TimeGravityAccStdY": Mean for variable tGravityAcc-std()-Y: range [-1..1]
"14" "TimeGravityAccStdZ": Mean for variable tGravityAcc-std()-Z: range [-1..1]
"15" "TimeBodyAccJerkMeanX"
"16" "TimeBodyAccJerkMeanY"
"17" "TimeBodyAccJerkMeanZ"
"18" "TimeBodyAccJerkStdX"
"19" "TimeBodyAccJerkStdY"
"20" "TimeBodyAccJerkStdZ"
"21" "TimeBodyGyroMeanX"
"22" "TimeBodyGyroMeanY"
"23" "TimeBodyGyroMeanZ"
"24" "TimeBodyGyroStdX"
"25" "TimeBodyGyroStdY"
"26" "TimeBodyGyroStdZ"
"27" "TimeBodyGyroJerkMeanX"
"28" "TimeBodyGyroJerkMeanY"
"29" "TimeBodyGyroJerkMeanZ"
"30" "TimeBodyGyroJerkStdX"
"31" "TimeBodyGyroJerkStdY"
"32" "TimeBodyGyroJerkStdZ"
"33" "TimeBodyAccMagMean"
"34" "TimeBodyAccMagStd"
"35" "TimeGravityAccMagMean"
"36" "TimeGravityAccMagStd"
"37" "TimeBodyAccJerkMagMean"
"38" "TimeBodyAccJerkMagStd"
"39" "TimeBodyGyroMagMean"
"40" "TimeBodyGyroMagStd"
"41" "TimeBodyGyroJerkMagMean"
"42" "TimeBodyGyroJerkMagStd"
"43" "FreqBodyAccMeanX"
"44" "FreqBodyAccMeanY"
"45" "FreqBodyAccMeanZ"
"46" "FreqBodyAccStdX"
"47" "FreqBodyAccStdY"
"48" "FreqBodyAccStdZ"
"49" "FreqBodyAccJerkMeanX"
"50" "FreqBodyAccJerkMeanY"
"51" "FreqBodyAccJerkMeanZ"
"52" "FreqBodyAccJerkStdX"
"53" "FreqBodyAccJerkStdY"
"54" "FreqBodyAccJerkStdZ"
"55" "FreqBodyGyroMeanX"
"56" "FreqBodyGyroMeanY"
"57" "FreqBodyGyroMeanZ"
"58" "FreqBodyGyroStdX"
"59" "FreqBodyGyroStdY"
"60" "FreqBodyGyroStdZ"
"61" "FreqBodyAccMagMean"
"62" "FreqBodyAccMagStd"
"63" "FreqBodyBodyAccJerkMagMean"
"64" "FreqBodyBodyAccJerkMagStd"
"65" "FreqBodyBodyGyroMagMean"
"66" "FreqBodyBodyGyroMagStd"
"67" "FreqBodyBodyGyroJerkMagMean"
"68" "FreqBodyBodyGyroJerkMagStd"


# From the description of the source data set

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