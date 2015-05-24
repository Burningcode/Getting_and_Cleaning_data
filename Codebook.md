**Source for the original data set:**
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

**The original description can be found here.**
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**The run_analysis does a couple different tasks.**
1. It will merge the training and test into a single data fram maintaining the subjects unique id.
2. It then reads the features.txt and extracts only the measurements on the mean and the standard deviation for each measurement. 
3. It then reads the activity labels and applies them to each category. These being walking, walkkingupstairs, walkingdownstairs, sitting, standing, laying. 
4. The script then appropriately labels the data set with all of the features names and acitivy names. This result is saved as merged_clean_data.txt. This is a 10,299 observations of 68 variable set.  
5. 
Lastly the script creates a 2nd, independent tidy data set with the average of each measuremen for each activity and subject. This set is saved as data_set_with_the_averages.txt. This is a 180 observations of 68 variables. 

