# CourseProject
Getting and Cleaning Data - Course Project
==================================================================
Human Activity Recognition Using Smartphones Dataset - 
tidydata for Project Course in Getting and Cleaning Data
run_analysis.R 
==================================================================
Original data "UCI HAR Dataset" file by:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
DESCRIPTION OF DATA COLLECTION:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities

(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its 

embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, 

where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows

 of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, 

was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low 

frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating 

variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

For more information about this dataset contact: activityrecognition@smartlab.ws

==================================================================
DESCRIPTION FOR INSTALLING AND RUNNING THE SCRIPT : run_analysis.R

To run the script run_analysis.R, the following files must be copied in the working directory:

- run_analysis.R

- README.md: shows how to use the script

Additionally, in the working directory must be copied the dataset provided, "UCI HAR Dataset", 

including the following files:
 
- '.UCI HAR Dataset/README.txt'

- '.UCI HAR Dataset/features_info.txt': Shows information about the variables used on the feature vector.

- '.UCI HAR Dataset/features.txt': List of all features.

- '.UCI HAR Dataset/activity_labels.txt': Links the class labels with their activity name.

- '.UCI HAR Dataset/train/X_train.txt': Training set.

- '.UCI HAR Dataset/train/y_train.txt': Training labels.

- '.UCI HAR Dataset/test/X_test.txt': Test set.

- '.UCI HAR Dataset/test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- '.UCI HAR Dataset/train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- '.UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 

Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- '.UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- '.UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For running the script use RStudio. 


==================================================================

TRANSFORMACION USED IN DATA PROVIDED "UCI HAR Dataset" TO GET THE 'tidydata.txt'
-------------------------------------------------------------------------------
For getting the tidydata.txt, it was created a script called run_analysis.R. This script 

was created in the working directory. The "UCI HAR Dataset" file has to be as well in the

working directory. The script run_analysis.R check if the data is in the working directory,

and if it is not, print the following message "download the UCI HAR Dataset to your working directory".

1. Reading the data:

The script read the data set and create datatables with the train set, the

test set and the subject set of data. The reading is made from the following files

from the working directory:

            PATH
  "./UCI HAR Dataset/train/train/X_train.txt" 
  "./UCI HAR Dataset/test/X_test.txt"
  "./UCI HAR Dataset/train/Y_train.txt"
  "./UCI HAR Dataset/test/Y_test.txt"
  "./UCI HAR Dataset/train/subject_train.txt"
  "./UCI HAR Dataset/test/subject_test.txt"
  "./UCI HAR Dataset/features.txt"
  "./UCI HAR Dataset/activity_labels.txt"

The features names and activity labels were used to give the column name

to each set, train and test.After reading, the columns names are setting, 

using the names given in the file features.txt.

2. Merging the data

Then the unified dataset, was getting from row binding the training and 

testing set. Additionally, using column binding two adittional column were

created with the numbers that identify subjects that

made the experiment (30 people) and activities evaluated (6 activities).

This merger dataset was called "mymergerdata" and the dimension was 10299 x 563.

3. Extracting only the measurements on the mean and standard deviation for each measurement

A new data frame was created to subset the mergered dataset selecting only

those columns with the word "mean" and with the word "std" using grep. In the 

particular case of mean, the columns with "meanfreq" were supressed, since

that measurement is a different measure according to the definition:
 
"Weighted average of the frequency components to obtain a mean frequency"

given in features_info.txt.

Then to the new data frame it was added two new columns for subject and activity

to ended up with the data frame "mysub1" with a dimension of 10299 x 68.


4. Using descriptive activity names to name the activities in the data set

To describe the activities in the "mysub1" dataframe, it was added a new column

called "activityname" with the description of each activity, according to 

the file "activity_labels.txt". This labels are self-explicatives. In this way, now

"mysub1" dataframe has a dimension of 10299 x 69.


5. Appropriately labels the data set with descriptive variable names

The name of the variables are in the "variablesnames.txt" file.
 
The provided names in the "UCI HAR Dataset" file  were getting and cleaning 

by three actions taken over the names in the features.txt file:

a. Converting the string characters in the column names to lower case

b. Deleting "-" signal

c. Deleting "()" signal

The above action help the users to reduced typing errors.


6. From the data set in step 5.5, creates a second, independent tidy data set 

    with the average of each variable for each activity and each subject

The average of each activity was calculated for combination of subjects with activities.

So, there are 30 subjects and 6 activities, for 180 rows of observations. 

For calculations of the average amount of each variable was used, lapply with the function mean

to subset or grouping the data by to variables : subject and activity, creating

mysub8. This data tabe is then reordered, using arrange by the two variables:

subject and activity. The last column with names of activities was dropped, before lapply, so, 

after ordering the data table, a new column is added to describe that the values correspond to

the average calcultions of the variable for the subject "x" and the activity "y". For

example: "average for subject 1 activity 1".

The tidy data is writing in a file called tidydata.txt


License for original Dataset UCI HAR Dataset:
=============================================
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones 

using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. 

Any commercial use is prohibited. Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
