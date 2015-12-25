Raw data:
The data corresponds to the results of an experiment carried out with a group of 30 subjects. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a Samsung Galaxy S II. For each record it is provided:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.
The activity label.
An identifier of the subject.

The available files are the following:

'features_info.txt': Shows information about the variables used on the feature vector.
'features.txt': List of all features.
'activity_labels.txt': Links the class labels with the activity codes.
'train/X_train.txt': Training set.
'train/y_train.txt': Training labels.
'test/X_test.txt': Test set.
'test/y_test.txt': Test labels.
And for both the train and test data the following files are given:

'subject_train.txt': Each row identifies the subject who performed the activity. It is a number from 1 to 30.
'Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
'Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
'Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
Additional descriptions regarding the physical meaning of the data can be found in README.txt within the data folder "UCI HAR Dataset".

Cleaned data

Following the instrucions of the project the following variables were created and transformed:

'core_data': Contains the merged data of 'X_train.txt' and 'X_test'.
'subjects': Contains the merged data of 'subject_train.txt' and 'subject_test.txt'.
'labels': Contains the merged data of 'y_train.txt' and 'y_test.txt'.
'features': Contains all the features of 'features.txt'.
'idx_selected_features': Contains the indices of the desired features to process (measurements on the mean and standard deviation).
'selected_data': Contains the data only for the desired features.
'activities': Contains the six performed activities.

The R script run_analysis.R generates the following two data files:

'Cleaned Data.txt': Contains the desired data (10,299 observations of the 68 variables). The first two variables contain the subject ID number and the specific activity. The other 66 variables correspond to the different values of the mean and standard deviation obtained for the different features.
'Tidy Averages.txt': Contains the desired data of averages (180 observations of the 68 variables). The first two variables contain the subject ID number and the specific activity. The other 66 variables correspond to the average of each variable for each subject and each activity.
