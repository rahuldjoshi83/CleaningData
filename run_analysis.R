#Assumption 1 - Samsung data is available in working directory
#Assumption 2 - dplyr package is already installed

library(dplyr)

#Reading required files from working directory
xTrainFilePath <- "./X_train.txt"
yTrainFilePath <- "./y_train.txt"
subjTrainFilePath <- "./subject_train.txt"

xTestFilePath <- "./X_test.txt"
yTestFilePath <- "./y_test.txt"
subjTestFilePath <- "./subject_test.txt"

featureFilePath <- "./features.txt"
activityPath <- "./activity_labels.txt"

xTrainData <- read.table(file = xTrainFilePath)
yTrainData <- read.table(file = yTrainFilePath)
subjTrainData <- read.table(file = subjTrainFilePath)

xTestData <- read.table(file = xTestFilePath)
yTestData <- read.table(file = yTestFilePath)
subjTestData <- read.table(file = subjTestFilePath)

colNamesFeatures <- read.table(featureFilePath, stringsAsFactors=FALSE)
#select just features
features <- colNamesFeatures[,2]

#Combine Train data into one data frame
fullTrainData <- cbind(subjTrainData, yTrainData, xTrainData)

#Combine Test data into one data frame
fullTestData <- cbind(subjTestData, yTestData, xTestData)

#Step 4- Rename Test data columns with descriptive variable names
colnames(fullTrainData)[1:2] <- c("Subject", "Activity")
colnames(fullTrainData)[3:563] <- features

#Step 4- Rename Test data columns with descriptive variable names
colnames(fullTestData)[1:2] <- c("Subject", "Activity")
colnames(fullTestData)[3:563] <- features

#Step 1- Merge Train and Test data to create one dataset
fullTrainTestData <- rbind(fullTrainData, fullTestData)

#Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
##creating  variable
colIndx <- which(grepl("mean\\(\\)", names(fullTrainTestData)) | grepl("std\\(\\)", names(fullTrainTestData)))

##Keep first 2 columns
colIndx <- c(1,2,colIndx)
selectedFullData <- fullTrainTestData[, colIndx]

#Step 3- Use descriptive names to Activities

## Read activity table
actLables <- read.table(activityPath, stringsAsFactors=FALSE)
## Assign col names
colnames(actLables) <- c("id", "Activity Description")
# Merge activity table with selectedFullData based on activity id
selectedFullDataActivity <- merge(selectedFullData, actLables, by.x = "Activity", by.y = "id")

## 'Activity Description' would be added as last column so just replace Activity column (1st)
## with Activity Description (last).
## Note: after merging by 'Activity', Activity becomes first column
selectedFullDataActivity[,1] = selectedFullDataActivity[,ncol(selectedFullDataActivity)]

## Remove redundant Activity Description column
selectedFullDataActivity = selectedFullDataActivity[,-ncol(selectedFullDataActivity)]

sprintf("Step 4: dims", dim(selectedFullDataActivity))
View(selectedFullDataActivity)

#Step 5
summarizedTidyData <- selectedFullDataActivity %>%group_by(Activity, Subject)%>%summarise_each(funs(mean))
sprintf("summarizedTidyData dim", dim(summarizedTidyData))
View(summarizedTidyData)
write.table(summarizedTidyData, file = "./tidyDataStep5.txt", row.names = FALSE)
