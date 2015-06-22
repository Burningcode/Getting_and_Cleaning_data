# Getting_and_Cleaning_data
This is a repo for the course project associated with the getting and cleaning data course for the John Hopkins University Data Science Specialization through Coursera. 

**Course Project**

1. The data soure to be used withe the run_analysis code can be found here. (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
2. After unziping this data simply set this UCI HAR dataset as your working directory.
3. Then soure the run_anaylsis.R code from its saved location. 
It should be noted that there were 180 observations of 68 variables of the 24 surveyed individuals.


**The run_analysis does a couple different tasks.**

It will merge the training and test into a single data fram maintaining the subjects unique id.

It then reads the features.txt and extracts only the measurements on the mean and the standard deviation for each measurement.

It then reads the activity labels and applies them to each category. These being walking, walkkingupstairs, walkingdownstairs, sitting, standing, laying.

The script then appropriately labels the data set with all of the features names and acitivy names. This result is saved as merged_clean_data.txt. This is a 10,299 observations of 68 variable set.

Lastly the script creates a 2nd, independent tidy data set with the average of each measuremen for each activity and subject. This set is saved as data_set_with_the_averages.txt. This is a 180 observations of 68 variables.


