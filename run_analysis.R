##Set working directory to folder containing measured data
#setwd("C:\\Users\\krodriguez\\Documents\\Coursera\\GettingCleaningData\\Project\\UCI HAR Dataset")

##read in test data
test_data = read.table("C:\\Users\\krodriguez\\Documents\\Coursera\\GettingCleaningData\\Project\\UCI HAR Dataset\\test\\X_test.txt")
##read in test data activity information AND add descriptive column name
test_activity = read.table("C:\\Users\\krodriguez\\Documents\\Coursera\\GettingCleaningData\\Project\\UCI HAR Dataset\\test\\y_test.txt")
colnames(test_activity) = "activity_num"
##read in test subject information AND add descriptive column name
test_subjects = read.table("C:\\Users\\krodriguez\\Documents\\Coursera\\GettingCleaningData\\Project\\UCI HAR Dataset\\test\\subject_test.txt")
colnames(test_subjects) = "subject_num"

##read in training data
training_data = read.table("C:\\Users\\krodriguez\\Documents\\Coursera\\GettingCleaningData\\Project\\UCI HAR Dataset\\train\\X_train.txt")
##read in training data activity information AND add descriptive column name
training_activity = read.table("C:\\Users\\krodriguez\\Documents\\Coursera\\GettingCleaningData\\Project\\UCI HAR Dataset\\train\\y_train.txt")
colnames(training_activity) = "activity_num"
##read in training subject information AND add descriptive column name
training_subjects = read.table("C:\\Users\\krodriguez\\Documents\\Coursera\\GettingCleaningData\\Project\\UCI HAR Dataset\\train\\subject_train.txt")
colnames(training_subjects) = "subject_num"

##read in features
features = read.table("C:\\Users\\krodriguez\\Documents\\Coursera\\GettingCleaningData\\Project\\UCI HAR Dataset\\features.txt")

##Apply feature names as column names for test and training data sets
colnames(test_data) = features[,2]
colnames(training_data) = features[,2]

##read in activity labels
activity_labels = read.table("C:\\Users\\krodriguez\\Documents\\Coursera\\GettingCleaningData\\Project\\UCI HAR Dataset\\activity_labels.txt")

##modify activity data frames to contain descriptive activities AND add descriptive column names
test_activity = as.data.frame(activity_labels$V2[test_activity$activity_num])
colnames(test_activity) = "Activity"
training_activity = as.data.frame(activity_labels$V2[training_activity$activity_num])
colnames(training_activity) = "Activity"

##add activity column to data sets
test_data = cbind(test_data,test_activity)
training_data = cbind(training_data,training_activity)

##add subject column to data sets
test_data = cbind(test_data,test_subjects)
training_data = cbind(training_data,training_subjects)

##merge training data and test data into one set
one_set = rbind(training_data,test_data)

##keep only columns with mean, std, Activity, or subject_num
one_set = one_set[, grep("mean|std|Activity|subject_num", names(one_set))]

##create data.table from one set data frame
one_dataTable = data.table(one_set)

##create new data set of average of every variable by subject and activity
one_dataTable = one_dataTable[,lapply(.SD,mean), by = c("Activity","subject_num"), .SDcols=1:79]

##export data as text file
write.table(one_dataTable, "C:\\Users\\krodriguez\\Documents\\Coursera\\GettingCleaningData\\Project\\tidy_data.txt", row.names = F)
