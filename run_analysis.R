library(data.table)
## Getting and cleaning the data: Course Project

## Step 0: Verify the existence of the data:

work_dir <- "C:\\Users\\a.ferrante\\Desktop\\Project Assignement\\UCI HAR Dataset"
## Does it exist?
if (!dir.exists(work_dir)){
    filename <- "C:\\Users\\a.ferrante\\Desktop\\Project Assignement\\dataset.zip"
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
    download.file(fileURL, filename)
    unzip(filename) 
}  
setwd(work_dir)

## Step 0 bis: Load the data:
training_data <- read.table("train/X_train.txt")
test_data <- read.table("test/X_test.txt")
subjects_train <- read.table("train/subject_train.txt")
subjects_test <- read.table("test/subject_test.txt")
training_labels <- read.table("train/y_train.txt")
test_labels <- read.table("test/y_test.txt")

## Step 1: Merging data
core_data <- rbind(training_data,test_data)
subjects <- rbind(subjects_train,subjects_test)
labels <- rbind(training_labels,test_labels)
rm(training_data,test_data,subjects_train,subjects_test,training_labels,test_labels)

## Step 2: Extract features of interest
features <- read.table("features.txt")
idx_selected_features <- grep(pattern = "-(mean|std)\\(\\)", features[,2])
selected_data <- core_data[,idx_selected_features]

## Step 3: Rename activities
activities <- read.table("activity_labels.txt")
activities[,2] <- gsub("_", " ", activities[,2])
activities[,2] <- tolower(activities[,2])
activities[,2] <- gsub("wa", "Wa", activities[,2])
activities[,2] <- gsub("up", "Up", activities[,2])
activities[,2] <- gsub("do", "Do", activities[,2])
activities[,2] <- gsub("si", "Si", activities[,2])
activities[,2] <- gsub("stan", "Stan", activities[,2])
activities[,2] <- gsub("la", "La", activities[,2])

## Step 4: Rename variables
labels[,1] <- activities[labels[,1],2]
names(subjects) <- "Subject"
names(labels) <- "Activity"
names(selected_data) <- features[idx_selected_features,2]
names(selected_data) <- gsub("\\(\\)","",names(selected_data))

cleaned_data <- cbind(subjects,labels,selected_data)
write.table(cleaned_data,"Cleaned Data.txt")

## Step 5: Create average tidy data
tmp <- data.table(cleaned_data)
tidy_averaged <- tmp[, lapply(.SD,mean),by=c("Subject","Activity")]
write.table(tidy_averaged,"Tidy Averages.txt")


