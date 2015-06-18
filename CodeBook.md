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
  - We label each outcome number in the previously merged outcome file <i>y</i> with the corresponding activity coming from the <i>activity_labels</i> previously loaded.
  - From the previously merged observation data set <i>X</i>, we create a new data set that contains the average for each variable (column) and for each tuple activity/subject (row). This is our final tidy data set.

* Which intermediate variables did we use ?

* What are the characteristics of the tidy data set obtained ?


