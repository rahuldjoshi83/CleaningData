DataScience : Getting and cleaning data - course project Code Book
====================================================

##Raw Data - Introduction
For this course project I am using Human Activity Recognition Using Smartphones [Dataset][1] in which experiment was carried out on 30 people (Subjects) to permorm various activities. Original data set had actual raw data with 561 measurements over 6 activities and 30 people.
[1]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Aim is to create tidy compact dataset which can be used for further analysis


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed 
six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables on original raw datasets: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

##Data cleaning and transformation
1. Using X_train.txt, y_train.txt and subject_train.txt files, I created full data set of Train data where first column would be subject, second column would be Activities from y_train file and rest would be 561 columns about measurements from X_train.txt file
2. Follow the same procedure for Test data and created single data set of Test data from X_test.txt, y_test.txt, subject_test.txt files
3. rbind() Train and Test data to construct combined data set of Train and Test data
4. For this assignment we were interested in mean() and std() - standard deviation functions across all measurements so extracted out only those columns from combined data set
5. Using merge() function, replaced Activities with the Activity Description (by activity id)
6. Finally created tidy dataset by perfoming summarizing mean on each column after grouping data by (activity and subject)


##Output variables
* Subject: Integer value of the Subject
* Activity: one of following values
  1: WALKING
  2: WALKING_UPSTAIRS
  3: WALKING_DOWNSTAIRS
  4: SITTING
  5: STANDING
  6: LAYING
* tBodyAcc-mean()-X: Average value of the tBodyAcc-mean()-X for the indicated subject and activity
* tBodyAcc-mean()-Y: Average value of the tBodyAcc-mean()-Y for the indicated subject and activity
* tBodyAcc-mean()-Z: Average value of the tBodyAcc-mean()-Z for the indicated subject and activity
* tGravityAcc-mean()-X: Average value of the tGravityAcc-mean()-X for the indicated subject and activity
* tGravityAcc-mean()-Y: Average value of the tGravityAcc-mean()-Y for the indicated subject and activity
* tGravityAcc-mean()-Z: Average value of the tGravityAcc-mean()-Z for the indicated subject and activity
* tBodyAccJerk-mean()-X: Average value of the tBodyAccJerk-mean()-X for the indicated subject and activity
* tBodyAccJerk-mean()-Y: Average value of the tBodyAccJerk-mean()-Y for the indicated subject and activity
* tBodyAccJerk-mean()-Z: Average value of the tBodyAccJerk-mean()-Z for the indicated subject and activity
* tBodyGyro-mean()-X: Average value of the tBodyGyro-mean()-X for the indicated subject and activity
* tBodyGyro-mean()-Y: Average value of the tBodyGyro-mean()-Y for the indicated subject and activity
* tBodyGyro-mean()-Z: Average value of the tBodyGyro-mean()-Z for the indicated subject and activity
* tBodyGyroJerk-mean()-X: Average value of the tBodyGyroJerk-mean()-X for the indicated subject and activity
* tBodyGyroJerk-mean()-Y: Average value of the tBodyGyroJerk-mean()-Y for the indicated subject and activity
* tBodyGyroJerk-mean()-Z: Average value of the tBodyGyroJerk-mean()-Z for the indicated subject and activity
* tBodyAccMag-mean(): Average value of the tBodyAccMag-mean() for the indicated subject and activity
* tGravityAccMag-mean(): Average value of the tGravityAccMag-mean() for the indicated subject and activity
* tBodyAccJerkMag-mean(): Average value of the tBodyAccJerkMag-mean() for the indicated subject and activity
* tBodyGyroMag-mean(): Average value of the tBodyGyroMag-mean() for the indicated subject and activity
* tBodyGyroJerkMag-mean(): Average value of the tBodyGyroJerkMag-mean() for the indicated subject and activity
* fBodyAcc-mean()-X: Average value of the fBodyAcc-mean()-X for the indicated subject and activity
* fBodyAcc-mean()-Y: Average value of the fBodyAcc-mean()-Y for the indicated subject and activity
* fBodyAcc-mean()-Z: Average value of the fBodyAcc-mean()-Z for the indicated subject and activity
* fBodyAccJerk-mean()-X: Average value of the fBodyAccJerk-mean()-X for the indicated subject and activity
* fBodyAccJerk-mean()-Y: Average value of the fBodyAccJerk-mean()-Y for the indicated subject and activity
* fBodyAccJerk-mean()-Z: Average value of the fBodyAccJerk-mean()-Z for the indicated subject and activity
* fBodyGyro-mean()-X: Average value of the fBodyGyro-mean()-X for the indicated subject and activity
* fBodyGyro-mean()-Y: Average value of the fBodyGyro-mean()-Y for the indicated subject and activity
* fBodyGyro-mean()-Z: Average value of the fBodyGyro-mean()-Z for the indicated subject and activity
* fBodyAccMag-mean(): Average value of the fBodyAccMag-mean() for the indicated subject and activity
* fBodyAccJerkMag-mean(): Average value of the fBodyBodyAccJerkMag-mean() for the indicated subject and activity
* fBodyGyroMag-mean(): Average value of the fBodyBodyGyroMag-mean() for the indicated subject and activity
* fBodyGyroJerkMag-mean(): Average value of the fBodyBodyGyroJerkMag-mean() for the indicated subject and activity
* tBodyAcc-std()-X: Average value of the tBodyAcc-std()-X for the indicated subject and activity
* tBodyAcc-std()-Y: Average value of the tBodyAcc-std()-Y for the indicated subject and activity
* tBodyAcc-std()-Z: Average value of the tBodyAcc-std()-Z for the indicated subject and activity
* tGravityAcc-std()-X: Average value of the tGravityAcc-std()-X for the indicated subject and activity
* tGravityAcc-std()-Y: Average value of the tGravityAcc-std()-Y for the indicated subject and activity
* tGravityAcc-std()-Z: Average value of the tGravityAcc-std()-Z for the indicated subject and activity
* tBodyAccJerk-std()-X: Average value of the tBodyAccJerk-std()-X for the indicated subject and activity
* tBodyAccJerk-std()-Y: Average value of the tBodyAccJerk-std()-Y for the indicated subject and activity
* tBodyAccJerk-std()-Z: Average value of the tBodyAccJerk-std()-Z for the indicated subject and activity
* tBodyGyro-std()-X: Average value of the tBodyGyro-std()-X for the indicated subject and activity
* tBodyGyro-std()-Y: Average value of the tBodyGyro-std()-Y for the indicated subject and activity
* tBodyGyro-std()-Z: Average value of the tBodyGyro-std()-Z for the indicated subject and activity
* tBodyGyroJerk-std()-X: Average value of the tBodyGyroJerk-std()-X for the indicated subject and activity
* tBodyGyroJerk-std()-Y: Average value of the tBodyGyroJerk-std()-Y for the indicated subject and activity
* tBodyGyroJerk-std()-Z: Average value of the tBodyGyroJerk-std()-Z for the indicated subject and activity
* tBodyAccMag-std(): Average value of the tBodyAccMag-std() for the indicated subject and activity
* tGravityAccMag-std(): Average value of the tGravityAccMag-std() for the indicated subject and activity
* tBodyAccJerkMag-std(): Average value of the tBodyAccJerkMag-std() for the indicated subject and activity
* tBodyGyroMag-std(): Average value of the tBodyGyroMag-std() for the indicated subject and activity
* tBodyGyroJerkMag-std(): Average value of the tBodyGyroJerkMag-std() for the indicated subject and activity
* fBodyAcc-std()-X: Average value of the fBodyAcc-std()-X for the indicated subject and activity
* fBodyAcc-std()-Y: Average value of the fBodyAcc-std()-Y for the indicated subject and activity
* fBodyAcc-std()-Z: Average value of the fBodyAcc-std()-Z for the indicated subject and activity
* fBodyAccJerk-std()-X: Average value of the fBodyAccJerk-std()-X for the indicated subject and activity
* fBodyAccJerk-std()-Y: Average value of the fBodyAccJerk-std()-Y for the indicated subject and activity
* fBodyAccJerk-std()-Z: Average value of the fBodyAccJerk-std()-Z for the indicated subject and activity
* fBodyGyro-std()-X: Average value of the fBodyGyro-std()-X for the indicated subject and activity
* fBodyGyro-std()-Y: Average value of the fBodyGyro-std()-Y for the indicated subject and activity
* fBodyGyro-std()-Z: Average value of the fBodyGyro-std()-Z for the indicated subject and activity
* fBodyAccMag-std(): Average value of the fBodyAccMag-std() for the indicated subject and activity
* fBodyAccJerkMag-std(): Average value of the fBodyBodyAccJerkMag-std() for the indicated subject and activity
* fBodyGyroMag-std(): Average value of the fBodyBodyGyroMag-std() for the indicated subject and activity
* fBodyGyroJerkMag-std(): Average value of the fBodyBodyGyroJerkMag-std() for the indicated subject and activity

