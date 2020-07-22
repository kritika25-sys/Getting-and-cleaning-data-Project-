CODE BOOK
Course Project: Getting and Cleaning Data 
Submitted by: Kritika Gulati
-------------------------------------------------------------------------------------------------------------------

DATA FILES USED 
features.txt - contains the names of all the 561 variables
x_train.txt - contains training set
y_train.txt - contains trainig labels
x_test - contains test set
y_test - contains test labels
subject_train - contains the order of the subjects in the which the measurements were stored in x_train 
subject_test - contains the order of the subjects in the which the measurements were stored in x_test 


VARIABLES USED

Step 1:
X_test : storing data values from the data set x_test.txt
X_train : storing data values from the data set x_train.txt
Y_test : storing data values from the data set y_test.txt
Y_train : storing data values from the data set y_train.tx
test1 : dataframe combining dataframes X_test and Y_test
train1: dataframe combining dataframes X_train and Y_train
dt1 : dataframe merging the two data sets ( train 1 and test 1)  
Step 2:
res : storing data values from the data set features.txt
res1: extracting the names of the columns corresponding to 'mean'
res2:  extracting the names of the columns corresponding to'standard deviation'
dd: storing names of all the columns in data set dt1
dd2: vector of length of total columns corresponding to mean and standard deviation together
res3: a data frame to add indices to all the coumns of dd2
res4: a tidy data set corrresponding to all the measurements containing mean and standard deviation of each measurement
Step 5:
subject_train: reading all the values from data set subject_train.txt
subject_test: reading all the values from data set subject_test.txt
subject: a new column combining the values of subject_train and subject_test
y1: a vector containig all the unique activities of actvity column of dt1
b1: a variable storing all the filtered out rows corresponding to subject i and activity j
c1: a list containig mean of all variables corresponding ro subject i and activity j
d1: a vector that keeps on combining the values of c1 vectors with each iteration
a1: a matrix obtained from values of d1 to create a tidy data set
rnames: a vector storing names of all the rows of a1 matrix
cnames: a vector storing names of all the columns of a1 matrix


DATA SETS CREATED

dt1
The data frame dt1 created in step 1 and modified along the other steps contains the following columns:
1) subject: corresponding to the subject/volunteer the measurements were obtained from
2) activity: corresponding to the activity the measurements of the student from column one was obtained from 
3) columns 3-563 beginning from "tBodyAcc-mean()-X" to "angle(Z,gravityMean)" enlist all the various measurements calculated from subject in column 1 while performing activity in column 2.

res4
The data frame res4 contains only those columns of dt1 data frame that correspond to mean and standard deviation for each measurement.    

a1
The data frame a1 created in step 5 contains average of each variable (total 561) corresponding to every combination of activity and subject (total 180 combinations)

STEPS FOLLOWED TO OBTAIN THE DATASETS

PART1
- reading data from the training and test data sets and checking the dimensions of both the data sets
- adding a column to both the test and training data sets corresponding to the activities 
- merging the two data sets obtained using rbind command to obtain a tidy data set (dt1) combining the test and training sets
 
PART2
- reading the file features.txt that enlists the names of all the 561 columns of dt1
- extracting all the columns on mean and standard deviation for each measurement and storing it in res4

PART3
- assigning descriptive activity names to name the activities in the data sets using for and if else statements.

PART4
- assiging interpretable names to all the variables of dt1 dataset using res3 data frame

PART5
- using nested for loops to choose every combination of subject and activity (total 180) and calculate mean for each variable in dt1 (total 561). 
- converting the list created to a matrix a1 with rows corresponding to every combination and columns coresponding to every variable. 
- using row.names and colnames command to assign descriptive names to all the columns and rows of data set a1. 
  


  
 

















