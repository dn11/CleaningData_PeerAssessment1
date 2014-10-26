# Cook Book

## Raw Data
The *Human Activity Recognition Using Smartphones* data set [1,2], collected in
support of the research outlined in *Human Activity Recognition on Smartphones 
using a Multiclass Hardware-Friendly Support Vector Machine* [3], was obtained
from the UCI Machine Learning repository for use in this assignment.

### Data Collection: Study Design
Experiments were conducted on 30 volunteers within an age bracket of 19-48 years. 
Each volunteer performed six activities (walking, walking upstairs, walking 
downstairs, sitting, standing, and laying) wearing a smartphone (Samsung Galaxy S 
II) on their waist. The embedded smartphone sensors (namely the accelerometer and 
gyroscope) were used to capture 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. Experiments were video-recorded and data was 
labeled manually.

Experimental data was randomly partitioned into two sets, where 70% of the 
volunteers were selected for incluson in the "training" data set, and the 
remaining 30% for inclusion in the "test" data set.

### Preprocessing
Noise filters were applied to the sensor signals and then sampled in fixed-width 
sliding windows of 2.56 sec with 50% overlap (128 readings per window). Time 
domain signals were captured at a constant rate of 50 Hz. They were then 
filtered using a median filter and a 3rd order low pass Butterworth filter with 
a corner frequency of 20 Hz to remove noise. A Butterworth low-pass filter with a 
corner frequency of 0.3 Hz was used to separate the sensor acceleration signal 
into gravitational and body motion (acceleration) components. Jerk signals were 
derived from the body linear acceleration and angular velocity. The magnitude of 
these three-dimensional signals was calculated using the Euclidean norm. The Fast 
Fourier Transform (FFT) was then applied to a set of these time domain signals 
to obtain frequency domain signals.

### Feature Selection

The preprocessed signals were used to create variables of the feature vector for
pattern:  


* tBodyAcc-XYZ

* tGravityAcc-XYZ

* tBodyAccJerk-XYZ

* tBodyGyro-XYZ

* tBodyGyroJerk-XYZ

* tBodyAccMag

* tGravityAccMag

* tBodyAccJerkMag

* tBodyGyroMag

* tBodyGyroJerkMag

* fBodyAcc-XYZ

* fBodyAccJerk-XYZ

* fBodyGyro-XYZ

* fBodyAccMag

* fBodyAccJerkMag

* fBodyGyroMag

* fBodyGyroJerkMag

The 3-axial signals in the X, Y and Z directions are denoted with '-XYZ'.

Variables were estimated from these signals: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors were obtained by averaging the signals in a signal window sample. 
These were used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

All features were normalized (i.e., bounded between -1 and 1) 


## Data Transformation
A tidy data set [4] is created from the raw data [1][2] by running the R script 
"run_analysis.R", which proceeds through the following processing steps:


#### 1. Merge training and test sets
The raw data contains subject labels, activity class labels, and feature 
vectors  - for both training and testing - in separate files. Subject labels 
identify the subject who performed each activity. Activity class labels indicate 
the type of activity carried out by each subject and are linked to activity names 
(i.e.,  walking, walking upstairs, walking downstairs, sitting, standing, and 
laying) . The subject labels (subject_train.txt, subject_test.txt), the activity 
class labels (y_train.txt, y_test.txt), and features data sets (X_train.txt, 
X_test.txt) are merged for both the training and test data sets. The training and 
test sets are then merged to create a single data set. Variable names are initially 
assigned their original names (according to those found in features.txt). 


#### 2. Extract mean and standard deviation variables
The estimated mean and standard deviation variables (i.e., variables with labels 
that contain "mean" or "std" respectively) are extracted from the merged data set. 
Variables that contain "Mean" are excluded.


#### 3. Use descriptive activity names
A new column is added to the data set with the activity name. The activity 
class label is used to link the activity name with the activity class labels in
the merged data set (using the 'activity_labels.txt').


#### 4. Label variables appropriately
Labels given by the original data collectors are altered to create syntactically 
valid names in R and to provide a clearer description of the variable.


#### 5. Create tidy data set
As laid out in the work of Hadley Wickham [4], each variable measured appears in 
one column, each different observation of that variable appears in a different 
row, and there is a single "kind" of data in the tidy data output. 

Each row of the tidy data set contains the mean of all measurements for a 
particular subject and activity . Each column contains a different variable.

The tidy data set contains 180 observations (30 subjects doing 6 activities each) 
with 81 variables:

The columns are as follows:

1. **subjectLabel**: an identifier indicating the subject (1, 3, 5, 6, 7, 8, 11, 14, 
15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30) [int]

2. **activityName**: a label denoting the activity type (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) [factor w/6 levels]

3. **Columns 3-81** contain the means for each of the 79 feature vectors for a 
particular subject and activity [numeric, bounded between -1 and 1]:

3.  **timeDomain.BodyAcceleration.Mean.XYZ**: numeric [-1,1]
4.  **timeDomain.BodyAcceleration.StandardDeviation.XY**: numeric [-1,1]
5.  **timeDomain.GravityAcceleration.Mean.XYZ**: numeric [-1,1]
6.  **timeDomain.GravityAcceleration.StandardDeviation.XYZ**: numeric [-1,1]
7.  **timeDomain.BodyAccelerationJerk.Mean.XYZ**: numeric [-1,1]
8.  **timeDomain.BodyAccelerationJerk.StandardDeviation.XYZ**: numeric [-1,1]
9.  **timeDomain.BodyGyroscope.Mean.XYZ**: numeric [-1,1]
10.  **timeDomain.BodyGyroscope.StandardDeviation.XYZ**: numeric [-1,1]
11.  **timeDomain.BodyGyroscopeJerk.Mean.XYZ       **: numeric [-1,1]
12.  **timeDomain.BodyGyroscopeJerk.StandardDeviation.XYZ**: numeric [-1,1]
13.  **timeDomain.BodyAccelerationMagnitude.Mean**: numeric [-1,1]
14.  **timeDomain.BodyAccelerationMagnitude.StandardDeviation**: numeric [-1,1]
15.  **timeDomain.GravityAccelerationMagnitude.Mean**: numeric [-1,1]
16.  **timeDomain.GravityAccelerationMagnitude.StandardDeviation**: numeric [-1,1]
17.  **timeDomain.BodyAccelerationJerkMagnitude.Mean**: numeric [-1,1]
18.  **timeDomain.BodyAccelerationJerkMagnitude.StandardDeviation**: numeric [-1,1]
19.  **timeDomain.BodyGyroscopeMagnitude.Mean**: numeric [-1,1]
20.  **timeDomain.BodyGyroscopeMagnitude.StandardDeviation**: numeric [-1,1]
21.  **timeDomain.BodyGyroscopeJerkMagnitude.Mean**: numeric [-1,1]
22.  **timeDomain.BodyGyroscopeJerkMagnitude.StandardDeviation**: numeric [-1,1]
23.  **frequencyDomain.BodyAcceleration.Mean.XYZ**: numeric [-1,1]
24.  **frequencyDomain.BodyAcceleration.StandardDeviation.XYZ**: numeric [-1,1]
25.  **frequencyDomain.BodyAcceleration.MeanFrequency.XYZ**: numeric [-1,1]
26.  **frequencyDomain.BodyAccelerationJerk.Mean.XYZ**: numeric [-1,1]
27.  **frequencyDomain.BodyAccelerationJerk.StandardDeviation.XYZ**: numeric [-1,1]
28.  **frequencyDomain.BodyAccelerationJerk.MeanFrequency.XYZ**: numeric [-1,1]
29.  **frequencyDomain.BodyGyroscope.Mean.XYZ**: numeric [-1,1]
30.  **frequencyDomain.BodyGyroscope.StandardDeviation.XYZ**: numeric [-1,1]
31.  **frequencyDomain.BodyGyroscope.MeanFrequency.XYZ**: numeric [-1,1]
32.  **frequencyDomain.BodyAccelerationMagnitude.Mean**: numeric [-1,1]
33.  **frequencyDomain.BodyAccelerationMagnitude.StandardDeviation**: numeric [-1,1]
34.  **frequencyDomain.BodyAccelerationMagnitude.MeanFrequency**: numeric [-1,1]
35.  **frequencyDomain.BodyBodyAccelerationJerkMagnitude.Mean**: numeric [-1,1]
36.  **frequencyDomain.BodyBodyAccelerationJerkMagnitude.StandardDeviation**: numeric [-1,1]
37.  **frequencyDomain.BodyBodyAccelerationJerkMagnitude.MeanFrequency**: numeric [-1,1]
38.  **frequencyDomain.BodyBodyGyroscopeMagnitude.Mean**: numeric [-1,1]
39.  **frequencyDomain.BodyBodyGyroscopeMagnitude.StandardDeviation**: numeric [-1,1]
40.  **frequencyDomain.BodyBodyGyroscopeMagnitude.MeanFrequency**: numeric [-1,1]
41.  **frequencyDomain.BodyBodyGyroscopeJerkMagnitude.Mean**: numeric [-1,1]
42.  **frequencyDomain.BodyBodyGyroscopeJerkMagnitude.StandardDeviation**: numeric [-1,1]
43.  **frequencyDomain.BodyBodyGyroscopeJerkMagnitude.MeanFrequency**: numeric [-1,1]


The 3-axial signals in the X, Y and Z directions are denoted with '-XYZ'.

The tidy data set is written to the tidy.txt.

## References
1. Human Activity Recognition Using Smartphones Data Set. URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Accessed 2014-10-26

2. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. ESANN 2013 proceedings, European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning. Bruges (Belgium), 24-26 April 2013

3. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

4. Tidy data set. URL: https://github.com/jtleek/datasharing#the-tidy-data-set. Accessed 2014-10-29
