#Merging the training and test data into single data sets. 

tmp1 <- read.table("train/X_train.txt")
tmp2 <- read.table("test/X_test.txt")
X <- rbind(tmp1, tmp2)

tmp1 <- read.table("train/subject_train.txt")
tmp2 <- read.table("test/subject_test.txt")
Z <- rbind(tmp1, tmp2)

tmp1 <- read.table("train/y_train.txt")
tmp2 <- read.table("test/y_test.txt")
Y <- rbind(tmp1, tmp2)

# Extracting the measurments on the mean and standard deviation for each measurement 
features <- read.table("features.txt")
sigfeatures <-  grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, sigfeatures]
names(X) <- features[sigfeatures, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# Uses descriptive activity names to name the activity in the set

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# Labels the data set with descriptive names 

names(Z) <- "subject"
cleaned <- cbind(Z, Y, X)
write.table(cleaned, "merged_clean_data.txt")

#  Creates a tidy data set with the average of each variable for each activity 
uniqueSubjects = unique(Z)[,1]
numSubjects = length(unique(Z)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
        for (a in 1:numActivities) {
                result[row, 1] = uniqueSubjects[s]
                result[row, 2] = activities[a, 2]
                tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
                result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
                row = row+1
        }
}
write.table(result, "data_set_with_the_averages.txt", row.name=FALSE)