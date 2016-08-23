library(data.table)


#Accessing working directory
mypath <- getwd()

#Getting the names of files in setting directory
list.files(mypath, recursive = TRUE)

#For reading the subject files
dtb_SubjectTrain <- fread(file.path(mypath, "train", "subject_train.txt"))
dtb_SubjectTest <- fread(file.path(mypath, "test", "subject_test.txt"))

#For reading the activities files.  
dtb_ActivityTrain <- fread(file.path(mypath, "train", "Y_train.txt"))
dtb_ActivityTest <- fread(file.path(mypath, "test", "Y_test.txt"))

#For reading the training dataset and  the test dataset files
df1 <- read.table(file.path(mypath, "train", "X_train.txt"))
df2 <- read.table(file.path(mypath, "test", "X_test.txt"))
dtb_SetTraining <- data.table(df1)
dtb_SetTest <- data.table(df2)

#Reading features and activity_labels files
dtb_features <- fread(file.path(mypath, "features.txt"))
dtb_ActivityLabels <- fread(file.path(mypath, "activity_labels.txt"))

#Combine the data tables by raws. Example : dtb_SubjectTrain and dtb_SubjectTest.
dtb_Subject <- rbind(dtb_SubjectTrain, dtb_SubjectTest)
dtb_Activity <- rbind(dtb_ActivityTrain, dtb_ActivityTest)
dtb_set <- rbind(dtb_SetTraining , dtb_SetTest)

#Cleaning memory
rm(dtb_SetTraining, dtb_SetTest, dtb_SubjectTest, dtb_SubjectTrain, dtb_ActivityTrain, dtb_ActivityTest)

#Extraction the row numbers containing mean and std recording
meanANDstd_Rows <- grep("-(mean|std)\\(\\)", dtb_features[,V2])

#Extraction of desired columns in dataset
dtb_set <- dtb_set[, meanANDstd_Rows, with=FALSE]
dtb_Activity[, V1] <- dtb_ActivityLabels[dtb_Activity[, V1], V2]

# Changing column names by reference without loading copying the whole dataset. 
setnames(dtb_set, dtb_features[meanANDstd_Rows, V2])
setnames(dtb_Activity, "V1", "Activity_")
setnames(dtb_Subject, "V1", "Subject_")

#Combine all "training" and "test sets" data to a single data set.
data_new <- cbind(dtb_set, dtb_Activity, dtb_Subject)

#Creating tidy data containing the average value of each variable for each activity and each subject
library(plyr)
tidy_data <- ddply(data_new, .(Subject_, Activity_), function(x) colMeans(x[, 1:66]))

#Write tidy_data txt file.
write.table(tidy_data, "tidy_data.txt", row.name=FALSE) 
 

 








