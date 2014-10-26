# Getting and Cleaning Data - Peer Assessment 1

describe how the script works

characteristics of a tidy dataset
reference the paper

code book describing the variables

## Raw Data

### Collection

### Signals

### Data Transformation

#### Merge training and test sets

#### Extract mean and standard deviation variables

#### Use descriptive activity names

#### Label variables appropriately


## Tidy Data
As laid out in the work of Hadley Wickham, each variable measured appears in one
column, each different observation of that variable appears in a different row, 
there is a single "kind" of so there is only one tidy data output. 

Each row of the tidy data set contains the mean of all measurements for a 
particular subject and activity. Each column contains a different variable. All


## Code Book

There are 6 classes of activity:

Activity Class Labels, Names, and Descriptions
  classLabel       activityName     description
1          1            WALKING     
2          2   WALKING_UPSTAIRS
3          3 WALKING_DOWNSTAIRS
4          4            SITTING
5          5           STANDING
6          6             LAYING

## References
1. Human Activity Recognition Using Smartphones Data Set. URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Accessed 2014-10-26

2. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. ESANN 2013 proceedings, European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning. Bruges (Belgium), 24-26 April 2013

3. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

4. Tidy data set. URL: https://github.com/jtleek/datasharing#the-tidy-data-set. Accessed 2014-10-29
