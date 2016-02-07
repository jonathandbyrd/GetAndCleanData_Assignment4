run_analysis <- function() {
        ## load the dplyr package
        library(dplyr)
        
        ## load the feature list
        featureData <- read.delim("./UCI HAR Dataset/features.txt", sep = " ", header = FALSE, stringsAsFactors = FALSE)
        featureRaw <- featureData[,"V2"]
        
        ## load the activity labels
        activityData <- read.delim("./UCI HAR Dataset/activity_labels.txt", sep = " ", header = FALSE, stringsAsFactors = FALSE)
        
        ## load and combine the test data
        testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
        testActivity <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activitytested")
        
        ## need to add the activity label as factors
        ## we'll do so by joining the two data frames (an inner join)
        testActivityLabels <- merge(testActivity, activityData, by.x = "activitytested", by.y = "V1", all = FALSE)
        
        testdata <- read.fwf("./UCI HAR Dataset/test/X_test.txt", widths = rep(c(16), length(featureRaw)), col.names = featureRaw)
        
        ##select the important columns
        subsetTestData <- select(testdata, grep("(mean|std)", featureRaw))
        
        combinedtest <- cbind(testSubjects, activity = testActivityLabels$V2, subsetTestData)
        
        ## load and combine the training data
        trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
        trainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activitytested")
        
        ## need to add the activity label as factors
        ## we'll do so by joining the two data frames (an inner join)
        trainActivityLabels <- merge(trainActivity, activityData, by.x = "activitytested", by.y = "V1", all = FALSE)
        
        ##traindata <- read.fwf("./UCI HAR Dataset/train/X_train.txt", widths = rep(c(16), length(featureRaw)), col.names = featureRaw)
        traindata <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = featureRaw)
        
        ##select the important columns
        subsetTrainData <- select(traindata, grep("(mean|std)", featureRaw))
        
        combinedtrain <- cbind(trainSubjects, activity = trainActivityLabels$V2, subsetTrainData)
        
        ## merge the training and test data
        ## we'll rowbind here to combine
        meanstddata <- rbind(combinedtest, combinedtrain)
        
        ## group by subject and activity
        bySubjectByActivity <- group_by(meanstddata, subject, activity)
        
        ## apply the mean over each column/variable of the grouped data
        avgs <- summarize_each(bySubjectByActivity, funs(mean))
       
        avgs        
}