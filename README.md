# CleaningData - CourseProject

## Assumptions
1. Samsung data is available in working directory
2. dplyr package is already installed

## Steps
1. Using X_train.txt, y_train.txt and subject_train.txt files, create full data set of Train data (fullTrainData) where first column would be subject, second column would be Activities from y_train file and rest would be 561 columns about measurements from X_train.txt file
2. Follow the same procedure for Test data and created single data set of Test data (fullTestData) from X_test.txt, y_test.txt, subject_test.txt files
3. Create the column names for both Train and Test data

```
colnames(fullTrainData)[1:2] <- c("Subject", "Activity")
colnames(fullTrainData)[3:563] <- features

colnames(fullTestData)[1:2] <- c("Subject", "Activity")
colnames(fullTestData)[3:563] <- features
```
4. rbind() test and train data to create full dataset (fullTrainTestData)
5. Selection - we are mainly interested in mean() and std() measurements so select the column indices which match the condition

```
colIndx <- which(grepl("mean\\(\\)", names(fullTrainTestData)) | grepl("std\\(\\)", names(fullTrainTestData)))
```
6. Subset the fulldata with required columns - selectedFullData
7. Read the activity table (actLables) and then merge with selectedFullData keyed on Activity in selectedFullData and id in actLables
8. 'Activity Description' would be added as last column so just replace Activity column (1st) with Activity Description (last).
   Note: after merging by 'Activity', Activity becomes first column
9. Remove the redundant 'Activity Description' column as now Activity column has all real values than just id
10. Creating tidy data for step 5 - grouping on (Activity and Subject) summarize table to calculate mean() of each column

## Running Script
```
source("run_analysis.R")
```

##Output
You will see tidyDataStep5.txt is being created in your working dir and clean View of tidy data.

##Justification: 
Final dataset is of dim 180 X 68. As we know there were 30 subjects and 6 activities involed which measured mean() and std() variables. 
180 rows represent all unique observations with respect to Subject and Activity and 68 variables in each columns  which satisfies tidy data properties (Each variable you measure should be in one column, Each different observation of that variable should be in a different row)