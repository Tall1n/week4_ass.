

###################### 1. Reading in the Data and the label files ######################

activitylabels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
           
test <- read.table("test/X_test.txt")
testlabel <- read.table("test/y_test.txt")
testsubject <-  read.table("test/subject_test.txt")

train <- read.table("train/X_train.txt")
trainlabel <- read.table("train/y_train.txt")
trainsubject <-  read.table("train/subject_train.txt")



###################### 2. Merging and properly naming the Data ######################

#       2.1) Joining the test and training datasets with the respective activity labels and the subjects

testcomplete <- cbind(test,testlabel,testsubject)
names(testcomplete)[562:563] <- c("activity","subject")         #giving the attached columns proper names
names(testcomplete)

traincomplete <- cbind(train,trainlabel,trainsubject)
names(traincomplete)[562:563] <- c("activity","subject")        #giving the attached columns proper names
names(traincomplete)

#       2.2) Merging the complete test and train datasets and naming the columns properly
#       with the features.txt file.
datamerged <- rbind(testcomplete,traincomplete) # takes some time...
names(datamerged) <- features$V2
names(datamerged)[562:563] <- c("activity","subject")
names(datamerged)



###################### 3. Subsetting the data so only the Mean and std columns remain ######################

subsetindex <- grep("mean()|std()", names(datamerged))          # identifying the columns with either mean() or std() in them

subset <- datamerged[,c(subsetindex,562,563)]                   # creating the subset with the chosen columns



###################### 4. Giving the activities proper names from the activity_labels.txt file and saving it as a factor ######################

subset$activity <- as.factor(subset$activity)
levels(subset$activity) <- activitylabels$V2
levels(subset$activity)

table(subset$activity)



###################### 5. Creates a second, independent tidy data set with the average of 
#                         each variable for each activity and each subject from the Data ######################

groupedmean <- aggregate(subset[, 1:79], list(subset$subject,subset$activity), mean) 
# the aggregate function splits the data into subsets and computes the mean for each of them.  


names(groupedmean)[1:2] <- c("subject","activity") # naming the grouping columns to keep it recognizable.

write.csv2(groupedmean,"tidydata.csv2") # writing the tidy data into a csv file





