Code Book
===================

This is the code book describing how we obtain the tidy data set required. We describe the process we use to transform the data, the intermediate variables that we use and the characteristics of the final tidy data set.

* How do we obtain the final tidy data set ?
  - First, we downloaded the raw data from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
  - We unziped the data downloaded previously on our local machine. We copied the folder <i>UCI HAR Dataset</i> into a new empty folder called <i>datasciencecoursera</i> on our machine.
  - We then run an R script called "run_analysis.R" that will perform the following operations to produce the tidy data set.
  - The script will first read the raw input data <i>X_test.txt</i>, <i>X_train.txt</i>, <i>y_train.txt</i>, <i>y_test.txt</i> which are made of the observations and the outcome for both the training set and the test set.
  - We merge the two observations sets (<i>X_test.txt</i>, <i>X_train.txt</i>) and outcome sets (<i>y_train.txt</i>, <i>y_test.txt</i>) into one data frame for each.
  - We read the file <i>features.txt</i> and name the columns of the previously merged observation set made of <i>X_test.txt</i> and <i>X_train.txt</i>.
  - We extract the columns containing the keywords "mean()" or "std()" in their name from the merged observation data set <i>X</i>.
  - We read the activity labels from the file <i>activity_labels.txt</i>. There are 6 possible activities.
  - We label each outcome number in the previously merged outcome vector <i>y</i> with the corresponding activity coming from the <i>activity_labels</i> previously loaded.
  - We now read the files "subject_test.txt" and "subject_train.txt" so that we can know for each row who is correponding subject (there are 30 subjects in total). We merged these two vectors into one like we did for <i>X</i> and <i>y</i>
  - We append the subject id vector created previously along with the activity vector <i>y</i> to the matrix <i>X</i>.
  - From the previously merged large data set <i>X</i>, we create a new data set that contains the average for each variable (column) and for each tuple activity/subject (row). This is our final tidy data set.

* Which intermediate variables did we use ?

  - We used the variables <i>df_X_test</i>, <i>df_X_train</i>, <i>df_y_test</i>, <i>df_y_train</i> to store the test and training in <i>X_test.txt</i>, <i>X_train.txt</i>, <i>y_train.txt</i>, <i>y_test.txt</i>.
  - The merged observations and outcome data were stored in the variables <i>df_X</i> and <i>df_y</i>.
  - The new data set containing a subset of the columns of <i>df_X</i> with just the names "mean()" and "std()" in them is stored in the variable <i>df_X_new</i>.
  - The new data set containing activities instead of numbers for the outcomes vector <i>y</i> is named <i>df_y_new</i> in the code.
  - <i>df_X_new</i> and <i>df_y_new</i> are merged into one single dataframe called <i>df</i>.
  - We used the variables <i>df_subject_test</i>, <i>df_subject_train</i> to store the test and training data representing the subject id for each row. We merged these two vectors in a variable called <i>df_subject</i>.
  - The dataframe <i>df_subject</i> is appended to the dataframe <i>df</i>. This gives us one big dataframe containing for each row all the 68 observations that we need on the mean and std for each variable along with the activity and the subject id for each row.
  - The previous step has prepared the data <i>df</i> we needed to create the tidy data set that will be stored in the variable $df2$.


* What are the characteristics of the tidy data set obtained ?

Our final tiday data set contains 68 columns and 180 rows where each row corresponds to one possible activity for one subject. As we have 30 subjects and 6 possible activities we can see that the number of rows in our tidy data set is correct.

 [1] "tBodyAcc-mean()-X"          
 [2] "tBodyAcc-mean()-Y"          
 [3] "tBodyAcc-mean()-Z"          
 [4] "tGravityAcc-mean()-X"       
 [5] "tGravityAcc-mean()-Y"       
 [6] "tGravityAcc-mean()-Z"       
 [7] "tBodyAccJerk-mean()-X"      
 [8] "tBodyAccJerk-mean()-Y"      
 [9] "tBodyAccJerk-mean()-Z"      
[10] "tBodyGyro-mean()-X"         
[11] "tBodyGyro-mean()-Y"         
[12] "tBodyGyro-mean()-Z"         
[13] "tBodyGyroJerk-mean()-X"     
[14] "tBodyGyroJerk-mean()-Y"     
[15] "tBodyGyroJerk-mean()-Z"     
[16] "tBodyAccMag-mean()"         
[17] "tGravityAccMag-mean()"      
[18] "tBodyAccJerkMag-mean()"     
[19] "tBodyGyroMag-mean()"        
[20] "tBodyGyroJerkMag-mean()"    
[21] "fBodyAcc-mean()-X"          
[22] "fBodyAcc-mean()-Y"          
[23] "fBodyAcc-mean()-Z"          
[24] "fBodyAccJerk-mean()-X"      
[25] "fBodyAccJerk-mean()-Y"      
[26] "fBodyAccJerk-mean()-Z"      
[27] "fBodyGyro-mean()-X"         
[28] "fBodyGyro-mean()-Y"         
[29] "fBodyGyro-mean()-Z"         
[30] "fBodyAccMag-mean()"         
[31] "fBodyBodyAccJerkMag-mean()" 

[32] "fBodyBodyGyroMag-mean()"    
[33] "fBodyBodyGyroJerkMag-mean()"

[34] "tBodyAcc-std()-X"           
[35] "tBodyAcc-std()-Y"           
[36] "tBodyAcc-std()-Z"           
[37] "tGravityAcc-std()-X"        
[38] "tGravityAcc-std()-Y"        
[39] "tGravityAcc-std()-Z"        
[40] "tBodyAccJerk-std()-X"       
[41] "tBodyAccJerk-std()-Y"       
[42] "tBodyAccJerk-std()-Z"       
[43] "tBodyGyro-std()-X"          
[44] "tBodyGyro-std()-Y"          
[45] "tBodyGyro-std()-Z"          
[46] "tBodyGyroJerk-std()-X"      
[47] "tBodyGyroJerk-std()-Y"      
[48] "tBodyGyroJerk-std()-Z"      
[49] "tBodyAccMag-std()"          
[50] "tGravityAccMag-std()"       
[51] "tBodyAccJerkMag-std()"      
[52] "tBodyGyroMag-std()"         
[53] "tBodyGyroJerkMag-std()"     
[54] "fBodyAcc-std()-X"           
[55] "fBodyAcc-std()-Y"           
[56] "fBodyAcc-std()-Z"           
[57] "fBodyAccJerk-std()-X"       
[58] "fBodyAccJerk-std()-Y"       
[59] "fBodyAccJerk-std()-Z"       
[60] "fBodyGyro-std()-X"          
[61] "fBodyGyro-std()-Y"          
[62] "fBodyGyro-std()-Z"          
[63] "fBodyAccMag-std()"          
[64] "fBodyBodyAccJerkMag-std()"  
[65] "fBodyBodyGyroMag-std()"     
[66] "fBodyBodyGyroJerkMag-std()" 
[67] "activity"                   
[68] "subjects"               


