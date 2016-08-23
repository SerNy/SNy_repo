The aim is to bring together in one data file a set of files and other data files from their descriptfis variables.

to do this, after downloading and reading of data files with the help of data.table package, the same kind of data is collected horizontally with the rbind () function.
Then the data were cleaned to retain only those that contain the desired lines, ie, those on average and standard deviations of different data types.

Then, the data is combined with the vertically cbind () function while correctly renaming the different columns using the files "features.txt" and "activity_labels.txt". The new data set is data_new.

Finally, the project is led by the creation of a "tidy data" contains the averages of each variable for each activity and for each subject with the aid package "plyr". In total, the 6 activities of 30 subjects are the lines of this file. In addition, the function "write.data" has created a file in .txt format, "tidy_data.txt" locally on your computer.

The variables used are:

1. Variables containing Training

dtb_SubjectTrain : corresponding of the "subject_train.txt"  loaded and read;  
dtb_ActivityTrain : corresponding of the "Y_train.txt" loaded and read;
dtb_SetTraining : corresponding of the  "X_train.txt" loaded and read;

2. Variables containing Test

dtb_SubjectTest : corresponding of the  "subject_test.txt"  loaded and read;
dtb_ActivityTest : corresponding of the  "Y_test.txt"  loaded and read;  
dtb_SetTest : corresponding of the  "test", "X_test.txt"  loaded and read;

3.  Variables reading features and activity_labels files
dtb_features  : corresponding of the  ""features.txt"  loaded and read; 
dtb_ActivityLabels : corresponding of the  "activity_labels.txt"  loaded and read; 

4. Variables containing the Combine the data tables 
dtb_Subject : combined dtb_SubjectTrain and dtb_SubjectTest;
dtb_Activity : combined dtb_ActivityTrain and dtb_ActivityTest;
dtb_set : combined  dtb_SetTraining and dtb_SetTest;

5. Variables containing the numbers of desired rows containing mean and std recording
meanANDstd_Rows  

6.  Variables containing the extracted and desired subset of data
dtb_set : clean data set

7. Final data sets 
data_new : combinec all "training" and "test sets" data to a single data set.
tidy_data : created tidy data






