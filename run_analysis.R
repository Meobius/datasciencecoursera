
# 1. Merges the training and the test sets to create one data set.
# Read data
df_X_test<-read.table("test/X_test.txt")
df_y_test<-read.table("test/y_test.txt")
df_X_train<-read.table("train/X_train.txt")
df_y_train<-read.table("train/y_train.txt")

# Merge training and test sets
df_X<-rbind(df_X_train, df_X_test)
df_y<-rbind(df_y_train, df_y_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Affect column names to merged training set (question 4 done here also)
colnames<-read.table("features.txt")
colnames<-as.character(colnames$V2)
names(df_X)<-colnames

# Select only columns containing keyword 'mean()' and 'std()'
col_mean<-grep('-mean()\\b', colnames, value=TRUE)
col_std<-grep('-std()\\b', colnames, value=TRUE)
col_mean_std<-c(col_mean,col_std)
df_X_new<-df_X[,col_mean_std]

# 3. Uses descriptive activity names to name the activities in the data set 
# Map values to labels in y data set
df_labels<-read.table("activity_labels.txt")
df_y_new<-df_y
for (i in 1:nrow(df_labels))
{
  df_y_new[df_y_new$V1==as.numeric(df_labels$V1[i]),]<-as.character(df_labels$V2[i])
}
names(df_y_new)<-c("activity")

# 4. Appropriately labels the data set with descriptive variable names. 
df<-cbind(df_X_new, df_y_new)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
df_subject_test<-read.table("test/subject_test.txt")
df_subject_train<-read.table("train/subject_train.txt")
df_subject<-rbind(df_subject_train, df_subject_test)
names(df_subject)<-c("subjects")
df<-cbind(df, df_subject)
df$activity<-df_y$V1
df2<-aggregate(df, by=list(df$activity, df$subjects), FUN=mean, na.rm=TRUE)
for (i in 1:nrow(df_labels))
{
  df2$activity[df2$activity==as.numeric(df_labels$V1[i])]<-as.character(df_labels$V2[i])
}
df2$Group.1<-NULL
df2$Group.2<-NULL

write.table(df2, "tidyDataSet.txt", row.names=FALSE)