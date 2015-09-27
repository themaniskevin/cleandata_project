File Name: CodeBook.md
Title : Code Book for run_analysis.R
Created by : Kevin Rodriguez
Date : 09/26/2015

run_analysis.R is a script that manipulates test and training data from UCI HAR Dataset.

The main functions of the script are to :
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Apply descriptive activity names to name the activities in the data set
4. Label the data set with descriptive variable names. 
5. Create a secondary data set of the average of each variable for each activity and each subject.

The script's workflow and variables are as follows : 
1. Read in test data as a data frame named test_data
2. Read in test data activity information as a data frame named test_activity
3. Apply a descriptive column name to test_activity data frame - "activity_num"
4. Read in test data subject information as a data frame named test_subjects
5. Apply a descriptive column name to test_subject data frame - "subject_num"
6. Read in training data as a data frame named training_data
7. Read in training data activity information as a data frame named training_activity
8. Apply a descriptive column name to training_activity data frame - "activity_num"
9. Read in training data subject information as a data frame named training_subjects
10. Apply a descriptive column name to training_subject data frame - "subject_num"
11. Read in features data as a data frame named features
12. Apply feature names as column names for test and training data sets
	This labels the data sets with descriptive variable names
13. Read in activity labels as data frame named activity_labels
14. Modify activity data frames to contain descriptive activities.
	Additionally, add descriptive column names - "Activity"
15. Add activity column to data sets
16. Add subject column to data sets
17. Merge training data and test data into one data frame named one_set
18. Subset one_set data fraame to include only columns with mean, std, Activity, or subject_num in column names
19. Create data.table from one_set data frame named one_dataTable
20. Modify one_dataTable to contain average of each variable by for each activity and subject

run_analysis.R creates two data frames  - "one_set" and "one_dataTable"
one_set contains both training and test data sets
one_dataTable contains the average of each variable in one_set for each activity and each subject.
