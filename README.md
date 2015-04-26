#How the script works

##Folder includes the following files:
*README.md
*CodeBook - description of the variables
*run_analysis.R - The R script containing all the commands used to creat the tidy dataset

##Summary of Steps taken to produce the tidy dataset
1 Merge the different training tables into one training dataset, provide activity names, and give column descriptive names 
2 Merge the different testing tables into one testing dataset, provide activity names, and give column descriptive names
3 Combine the training and testing datasets
4 Extract only columns with the words "mean" or "std" in the names to get the measurements. 
5 Convert data set from wide to long (author preference), obtain the average, and output the tidy data into a text file

##1 Merge the different training tables into one training dataset, provide activity names, and give column descriptive names
*Need to combine all information about training data which is separated into 4 files: subject_train.txt, X_train.txt, y_train.txt, and features.txt
*Read in the required files. "sTrain" contains training subject number data. "xTrain" contains the measurements. "yTrain" contains the activity codes. "features" contains the feature names.
*Use the information from the "activity_labels.txt" file as names of the activities in the "yTrain" dataset. These labels are descriptive for the activities because they are action words for the physical activity performed by the subject. (Example, convert code 1 to its respective activity which is "WALKING")
*Use the information from "features.txt" as names for "xTrain" dataset because each feature is currently stored as a column in the xTrain dataset. These are appropriate names because they say what denote what feature is measured in each column
*Combine files together using cbind. Each row of the "trainFull" data set has subject, activity and feature information.

##2 Merge the different testing tables into one testing dataset, provide activity names, and give column descriptive names
*Perform similar steps taken from above but on the testing data.
*Need to combine all information about testing data which is separated into 4 files: subject_test.txt, X_test.txt, y_test.txt, and features.txt
*Read in the required files. "sTest" contains testing subject number data. "xTest" contains the measurements. "yTest" contains the activity codes. "features" contains the feature names.
*Use the information from the "activity_labels.txt" file as names of the activities in the "yTest" dataset. These labels are descriptive for the activities because they are action words for the physical activity performed by the subject. (Example, convert code 1 to its respective activity which is "WALKING")
*Use the information from "features.txt" as names for "xTest" dataset because each feature is currently stored as a column in the xTest dataset. These are appropriate names because they say what denote what feature is measured in each column
*Combine files together using cbind. Each row of the "testFull" data set has subject, activity and feature information.

##3 Combine the training and testing datasets
*Combine the "trainFull" and "testFull" dataframes using the rBind command because the columns names for each dataframe have the same names. The data frame with all the information is called "allData". 

##4 Extract only columns with the words "mean" or "std" in the names to get the measurements. 
*Use the grep function to get a vector "v" of all the column names that contain "mean" or "std"
*Include column positions 1 and 2 in the vector v which contain Subject and Activity information.
*Use the "v" vector to get a subset from the "allData" that include strings "mean" and "std" in the column names.
*Remove any columns related "angle" in its name as it does not have mean and std observations

##5 Convert data set from wide to long (author preference), obtain the average, and output the tidy data into a text file
*Use the melt fuction to convert the dataset from wide to long. Converts the dataset from 10299 rows by 81 columns, to 14220 rows by 4 columns
*Use the group_by and summarise functions to obtain the average by subject, activity and feature.
*Rename the names to match the long data set; "Subject", "Activity", "Feature", and "Average"

The tidy data set that is produced is in the long form. It is tidy because each variable measured is in one column with each different observation of that variable in a different row. 






##License about the dataset:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.