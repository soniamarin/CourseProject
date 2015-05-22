Code Book - Human Activity Recognition using smartphones dataset 
=================================================================
Original data "UCI HAR Dataset" file by:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
Preprocessed data for Course Project - Getting and Cleanning Data
Id: getdata-014 - Script: run_analysis.R
==================================================================
1. DATA COLLECTION DESCRIPTION
-------------------------------
The features selected for the dataset were described in 
'features_info.txt'.
In summary, the original data was colected from
30 people, through experiments with 6 activities: 
		1 WALKING
		2 WALKING_UPSTAIRS
		3 WALKING_DOWNSTAIRS
		4 SITTING
		5 STANDING
		6 LAYING
The measures were made through an accelerometer and a gyroscope.The
experiments have been carried out with a group of 30 volunteers 
within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone
(Samsung Galaxy S II) on the waist. Using its embedded 
accelerometer and gyroscope, they captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 
50Hz. The experiments have been video-recorded to label the data 
manually. The obtained dataset has been randomly partitioned into
two sets, where 70% of the volunteers was selected for generating 
the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed
by applying noise filters and then sampled in fixed-width sliding
windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and 
body motion components, was separated using a Butterworth low-pass 
filter into body acceleration and gravity. The gravitational force
is assumed to have only low frequency components, therefore a 
filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from 
the time and frequency domain. 
For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
The dataset provided includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent:
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

2. OBJECTIVE OF THE SCRIPT
----------------------------
The objective of the script run_analysis.R is create a dataset called tidydata.txt, from the data provided as the 
"UCI HAR Dataset" file. This new data set must be created as a second,independent tidy dataset, with the average of each variable for
each activity and each subject.


3. DESCRIPTION OF VARIABLES (COLUMNS) IN 'tidydata.txt'
------------------------------------------------------
The dimension of the dataset in 'tidydata.txt' are 180x67, that
means 67 columns or variables names.

VARIABLES NAMES: the variables names are the names of the columns. 
This names are shown in the 'variablesnames.txt' file.

The variable called 'keyname' is the last column and
identify with a character string, indicating the value cells, in each of the variables
named in the columns, are the average of all the measures registered
for that variable, for the kind of activity and subject described in 
the keyname column. 

The name of the columns 1 to 66 are shown in the "variablesnames.txt" file. The first
36 are for the mean calculation and the following 36 are for std calculation, over the measures.
The provided names were getting and cleaning by three actions taken over the names provided
in the features.txt file of the "UCI HAR Dataset" file:
a. Converting to lower case
b. Deleting "-" signal
c. Deleting "()" signal

The meaning of the variables names are as follow:
3.1. The variables name is structured as follow:
     "the name of the variable" "the name of stat function aplied" "the axe"
     No signals or space among them.
3.2. The acceleration signal was separated into body and gravity acceleration signals
in the provided data set, with values for each axe(x,y,z) and when it is apply the 
mean statiscal function, the variable name is (prefix 't' to denote time):
	Column Name		Column N°
    	tbodyaccmeanx		1	
    	tbodyaccmeany		2
    	tbodyaccmeanz		3
    	tgravityaccmeanx	4
    	tgravityaccmeany	5
    	tgravityaccmeanz	6

3.3. The body linear acceleration and angular velocity were derived in time to obtain Jerk signals,
with the same structure described in point 3.1.:
    	Column Name		Column N°
	tbodyaccjerkmeanx 	7
	tbodyaccjerkmeany	8
	tbodyaccjerkmeanz	9
        tbodygyromeanx		10
	tbodygyromeany		11
	tbodygyromeanz		12
    	tbodygyrojerkmeanx	13
	tbodygyrojerkmeany	14
	tbodygyrojerkmeanz	15

3.4. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm:
	Column Name		Column N°
	tbodyaccmagmean		16
	tgravityaccmagmean 	17
	tbodyaccjerkmagmean 	18
	tbodygyromagmean 	19
	tbodygyrojerkmagmean	20

3.5. A Fast Fourier Transform (FFT) was applied to some of these signals producing,
     (the 'f' to indicate frequency domain signals):
	Column Name		Column N°
	fbodyaccmeanx		21
 	fbodyaccmeany		22
	fbodyaccmeanz		23
	fbodyaccjerkmeanx 	24
	fbodyaccjerkmeany	25
	fbodyaccjerkmeanz	26
	fbodygyromeanx 		27
	fbodygyromeany		28
	fbodygyromeanz		29
        fbodyaccmagmean		30
	fbodybodyaccjerkmagmean	31
	fbodybodygyromagmean 	32
	fbodybodygyrojerkmagmean33
 
3.6. Then you have the whole set of variables from points 3.2. to 3.5., for std instead of mean. 
     That means another 33 variables names for std.

4. DESCRIPTION OF OBSERVATIONS (ROWS) IN 'tidydata.txt'
---------------------------------------------------

The dimension of the dataset in 'tidydata.txt' are 216x67, that
means 180 rows or observations.

OBSERVATIONS NAMES: the observations names are the names under the last column (67th column)
called 'keyname'. The labels of each row can be found in file "rowlabels.txt".

For example: "average subject 1 activity 2"
means that for each variable like "tbodyaccmeanx", the corresponding
value in the "tidydata.txt" is the average (mean) of all measures of this variable 
registered for the subject number 1 during his activity 2". According to point 1 of this
Code Book, Activity 2 is WALKING_UPSTAIRS.
Another example: "average subject 10 activity 6" means that for each variable like
"tbodyaccmeanx", the corresponding value in the "tidydata.txt" is the 
average (mean) of all measures of this variable registered for the subject number 10
during his activity 6".According to point 1 of this
Code Book, Activity 6 is LAYING.


5. TRANSFORMACION USED IN DATA PROVIDED "UCI HAR Dataset" TO GET THE 'tidydata.txt'
-------------------------------------------------------------------------------
For getting the tidydata.txt, it was created a script called run_analysis.R. This script 
was created in the working directory. The "UCI HAR Dataset" file has to be as well in the
working directory. The script run_analysis.R check if the data is in the working directory,
and if it is not, print the following message "download the UCI HAR Dataset to your working directory".

5.1. Reading the data:

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

5.2 Merging the data

Then the unified dataset, was getting from row binding the training and 
testing set. Additionally, using column binding two adittional column were
created with the numbers that identify subjects that
made the experiment (30 people) and activities evaluated (6 activities).
This merger dataset was called "mymergerdata" and the dimension was 10299 x 563.

5.3 Extracting only the measurements on the mean and standard deviation for each measurement

A new data frame was created to subset the mergered dataset selecting only
those columns with the word "mean" and with the word "std" using grep. In the 
particular case of mean, the columns with "meanfreq" were supressed, since
that measurement is a different measure according to the definition: 
"Weighted average of the frequency components to obtain a mean frequency"
given in features_info.txt.
Then to the new data frame it was added two new columns for subject and activity
to ended up with the data frame "mysub1" with a dimension of 10299 x 68.

5.4 Using descriptive activity names to name the activities in the data set

To describe the activities in the "mysub1" dataframe, it was added a new column
called "activityname" with the description of each activity, according to 
the file "activity_labels.txt". This labels are self-explicatives. In this way, now
"mysub1" dataframe has a dimension of 10299 x 69.


5.5 Appropriately labels the data set with descriptive variable names

The name of the variables are in the "variablesnames.txt" file. 
The provided names in the "UCI HAR Dataset" file  were getting and cleaning 
by three actions taken over the names in the features.txt file:
a. Converting the string characters in the column names to lower case
b. Deleting "-" signal
c. Deleting "()" signal
The above action help the users to reduced typing errors.

5.6 From the data set in step 5.5, creates a second, independent tidy data set 
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
  
LICENSE ORIGINAL DATA SET:
----------------------------
Use of this dataset in publications must be acknowledged by referencing the following publication [1]
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the
authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.




  





