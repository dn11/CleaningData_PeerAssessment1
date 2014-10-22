
#===============================================================================
# Environment Settup
#===============================================================================

#-------------------------------------------------------------------------------
# Package management
#-------------------------------------------------------------------------------
installPackages<- function(x){
    if(x %in% rownames(installed.packages())==FALSE) {
        if(x %in% rownames(available.packages())==FALSE) {
            paste(x,"is not a valid package - please check again...")
        } else {
            install.packages(x)           
        }
        
    } else {
        paste(x,": package already installed...")
    }
}

# set the list of required packages
required_packages  <- c("reshape")

# check for the required packages and install missing packages
lapply(required_packages,installPackages)

# set the working directory
setwd("/Users/dgn2/Documents/RStudio/work/Getting and Cleaning Data")

# create the data 
if(!file.exists("./data")){dir.create("./data")}
fileUrl1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# download the .zip data from the internet if it does not exist
dataFile<-"./data/HumanActivityRecognitionUsingSmartphonesData.zip"
if(!file.exists(dataFile)){ 
    download.file(fileUrl1,destfile=dataFile,method="curl") }
# get the file names of the .zip
fileNames<-unzip(dataFile,
                 list=TRUE)

# unzip the files
unzip(dataFile,exdir="./data")

#===============================================================================
# 1. Merge the training and the test sets to create one data set
#===============================================================================

# read in the list of all feature names ('features.txt')
features <- read.table("./data/UCI HAR Dataset/features.txt",header=FALSE,
                       col.names=c("columnNumber","featureName"))

# read in the activity labels ('activity_labels.txt') which link class labels
# with corresponding activity names
activity_labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt",
                            header=FALSE,col.names=c("classLabel","activityName"))

#-------------------------------------------------------------------------------
# read the test data files
#-------------------------------------------------------------------------------

# read the test subject labels (which identify the subject who performed each 
# activity)
subject_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt",
                         header=FALSE,col.names="subjectLabel")

# read the test class labels (which are linked to activity names)
Y_test<-read.table("./data/UCI HAR Dataset/test/y_test.txt",header=FALSE,
                   col.names="classLabel")

# read the test features data set (labeling the columns using the feature 
# data frame)
X_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt",header=FALSE)

# add the feature names
names(X_test) <- features$featureName

#-------------------------------------------------------------------------------
# read the training data files
#-------------------------------------------------------------------------------
# read the training subject labels (which identify the subject who performed 
# each activity)
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",
                            header=FALSE,col.names="subjectLabel")

# read the training class labels (which are linked to activity names)
Y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt",header=FALSE,
                      col.names="classLabel")

# read the training features data set
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt",header=FALSE)
# add the feature names
names(X_train) <- features$featureName

# bind the subject labels, class labels, and features data sets (training)
df_train<-cbind(subject_train,Y_train)
df_train<-cbind(df_train,X_train)

# bind the subject labels, class labels, and features data sets (test)
df_test<-cbind(subject_test,Y_test)
df_test<-cbind(df_test,X_test)

df_all<-rbind(df_train,df_test)
#===============================================================================
# 2. Extract only the measurements on the mean and standard deviation for each
# measurement. 
#===============================================================================
# find all of the variable names that contain "mean","Mean" or "std"
subsetColumnsIndex<-grep("mean|Mean|std",names(df_all))
# extract the subset data
df_subset<-df_all[,c(1:2,subsetColumnsIndex)]

#===============================================================================
# 3. Uses descriptive activity names to name the activities in the data set
#===============================================================================
# add the activity names (note that column labels will be truncated by this 
# step so we clean them up in the next step)
df_subset_activity_names<-merge(df_subset,activity_labels,by.x="classLabel",
                                by.y="classLabel",all=TRUE,sort=FALSE)

#===============================================================================
# 4. Appropriately labels the data set with descriptive variable names. 
#===============================================================================

# This step was done as part of the data loading to make extraction of mean and
# standard deviation variable simpler

#===============================================================================
# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
#===============================================================================

# convert the data from "wide" form into "long" form
test<-melt(df_subset_activity_names,id.vars = c("subjectLabel","activityName"))
# take the mean
tidy<-cast(subjectLabel + activityName ~ variable,data=test,fun=mean)

# write txt file with no row names for upload
write.table(tidy,file = "Tidy.txt",row.name=FALSE)