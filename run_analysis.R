## downloads the data from the internet and unzip it
## makes the data files are now available in the "UCI HAR Dataset" folder

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,"DataSet.zip",method = "curl")
unzip("DataSet.zip")

## Merges the training and the test sets to create one data set nemd merged.
dir.create("UCI HAR Dataset/merged")
dir.create("UCI HAR Dataset/merged/Inertial Signals")

FileList_train <- paste("UCI HAR Dataset/train/",list.files("UCI HAR Dataset/train/",recursive = TRUE),sep = "")
FileList_test <- paste("UCI HAR Dataset/test/",list.files("UCI HAR Dataset/test/",recursive = TRUE),sep = "")
FileList_merged <- cbind(FileList_train, FileList_test)

for(n in 1:nrow(FileList_merged)){
        train_data <- read.table(FileList_merged[n,1])
        test_data <- read.table(FileList_merged[n,2])
        
        merged_data <- rbind(read.table(FileList_merged[n,1]),read.table(FileList_merged[n,2]))
        write.table(merged_data, gsub("train","merged",FileList_merged[n,1]))
}

## Extracts only the measurements on the mean and standard deviation for each measurement. 
featuresData <- read.table("UCI HAR Dataset/features.txt")
featuresDataFilters <- grep("mean\\(\\)|std\\(\\)",featuresData[,2])

X_mergedData <- read.table("UCI HAR Dataset/merged/X_merged.txt")
X_mergedData_filtered <- X_mergedData[,featuresDataFilters]

## Using descriptive activity names to name the activities in the data set
featuresDataRenamed <- featuresData[featuresDataFilters,2]
featuresDataRenamed <- gsub("-","",featuresDataRenamed)
featuresDataRenamed <- gsub("mean\\(\\)",".Mean.",featuresDataRenamed)
featuresDataRenamed <- gsub("std\\(\\)",".Stdev.",featuresDataRenamed)
featuresDataRenamed <- gsub("Acc",".Acceleration.RawSignal",featuresDataRenamed)
featuresDataRenamed <- gsub("Acceleration.RawSignalJerk","Acceleration.JerkSignal",featuresDataRenamed)
featuresDataRenamed <- gsub("Gyro",".AngularVelocity.RawSignal",featuresDataRenamed)
featuresDataRenamed <- gsub("AngularVelocity.RawSignalJerk","AngularVelocity.JerkSignal",featuresDataRenamed)
featuresDataRenamed <- gsub("BodyBody","Body",featuresDataRenamed)
featuresDataRenamed <- gsub("Mag",".Magnitude",featuresDataRenamed)
featuresDataRenamed <- sub("^f","Freq.",featuresDataRenamed)
featuresDataRenamed <- sub("^t","Time.",featuresDataRenamed)
featuresDataRenamed <- sub("\\.$","",featuresDataRenamed)

##Appropriately labels the data set with descriptive variable names.
colnames(X_mergedData_filtered) <- featuresDataRenamed

##creates a second, independent tidy data set with the average of each variable for each activity and each subject.
PersonId <- read.table("UCI HAR Dataset/merged/subject_merged.txt")
Activity <- read.table("UCI HAR Dataset/merged/y_merged.txt")
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

colnames(PersonId) <- "PersonId"
colnames(Activity) <- "ActivityId"
colnames(ActivityLabels) <- c("ActivityId","Activity")

TidyData <- cbind(PersonId,Activity,X_mergedData_filtered)
TidyData <- merge(TidyData,ActivityLabels,by.x = "ActivityId",by.y = "ActivityId")
TidyData <- TidyData[c(2,69,3:68)]

library(data.table)
TidyData_table <- data.table(TidyData)

library(dplyr)
TidyData_table_avg <- TidyData_table[,lapply(.SD,mean),by="PersonId,Activity",.SDcols=3:68]
TidyData_table_avg <- arrange(TidyData_table_avg,PersonId)

write.table(TidyData_table_avg,"TidyDataSet.txt",row.names = FALSE)