Code Book
===================

This is the code book describing how we obtain the tidy data set required. We describe the process we use to transform the data, the intermediate variables that we use and the characteristics of the final tidy data set.

* How do we obtain the final tidy data set ?
  - First, we downloaded the raw data from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
  - We unziped the data downloaded previously on our local machine. We copied the folder "UCI HAR Dataset" into a new empty folder called "datasciencecoursera" on our machine.
  - We then run an R script called d"run_analysis.R" that will perform the following operations to produce the tidy data set.
  - The script will first read the raw input data <i>X_test.txt</i>, <i>X_train.txt</i>, <i>y_train.txt</i>, <i>y_test.txt</i> which are made of the observations and the outcome for both the training set and the test set.
  - We merge the two observations sets (<i>X_test.txt</i>, <i>X_train.txt</i>) and outcome sets (<i>y_train.txt</i>, <i>y_test.txt</i>) into one data frame for each.
  - We extract only the columns containing the keywords "mean()" or "std()" in their name

* Which intermediate variables did we use ?

* What are the characteristics of the tidy data set obtained ?


