#Code book describing each variable and its values in the tidy data set.
##Study Design section:
Data was collected is the "Human Activity Recognition Using Smartphones Dataset" from Smartlab
The observations were collected about 30 volunteers through sensor signals (accelerometer and gyroscope) as they performed an activity.

#Variable Summary
The code book contains 4 variables:
* Subject - ID for the subject
* Activity - Name of the physical activity performed
* Feature - Names of the mean and standard deviation features that include body linear acceleration and angular velocity
* Average - Average of the feature mean or standard deviation

###Subject
* Values range from 1 to 30
* Each number represents a subject in the experiment
* Unitless

###Activity
* Values range from WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, to LAYING
* Each name represents an activity that was performed by the subject
* Unitless
 
###Feature
* Contains the names of the features' mean and standard deviation
* There are 79 different feature names:
 tBodyAcc-mean()-X               
 tBodyAcc-mean()-Y              
 tBodyAcc-mean()-Z               
 tBodyAcc-std()-X               
 tBodyAcc-std()-Y                
 tBodyAcc-std()-Z               
 tGravityAcc-mean()-X            
 tGravityAcc-mean()-Y           
 tGravityAcc-mean()-Z            
 tGravityAcc-std()-X            
 tGravityAcc-std()-Y             
 tGravityAcc-std()-Z            
 tBodyAccJerk-mean()-X           
 tBodyAccJerk-mean()-Y          
 tBodyAccJerk-mean()-Z           
 tBodyAccJerk-std()-X           
 tBodyAccJerk-std()-Y            
 tBodyAccJerk-std()-Z           
 tBodyGyro-mean()-X              
 tBodyGyro-mean()-Y             
 tBodyGyro-mean()-Z              
 tBodyGyro-std()-X              
 tBodyGyro-std()-Y               
 tBodyGyro-std()-Z              
 tBodyGyroJerk-mean()-X          
 tBodyGyroJerk-mean()-Y         
 tBodyGyroJerk-mean()-Z          
 tBodyGyroJerk-std()-X          
 tBodyGyroJerk-std()-Y           
 tBodyGyroJerk-std()-Z          
 tBodyAccMag-mean()              
 tBodyAccMag-std()              
 tGravityAccMag-mean()           
 tGravityAccMag-std()           
 tBodyAccJerkMag-mean()          
 tBodyAccJerkMag-std()          
 tBodyGyroMag-mean()             
 tBodyGyroMag-std()             
 tBodyGyroJerkMag-mean()         
 tBodyGyroJerkMag-std()         
 fBodyAcc-mean()-X               
 fBodyAcc-mean()-Y              
 fBodyAcc-mean()-Z               
 fBodyAcc-std()-X               
 fBodyAcc-std()-Y                
 fBodyAcc-std()-Z               
 fBodyAcc-meanFreq()-X           
 fBodyAcc-meanFreq()-Y          
 fBodyAcc-meanFreq()-Z           
 fBodyAccJerk-mean()-X          
 fBodyAccJerk-mean()-Y           
 fBodyAccJerk-mean()-Z          
 fBodyAccJerk-std()-X            
 fBodyAccJerk-std()-Y           
 fBodyAccJerk-std()-Z            
 fBodyAccJerk-meanFreq()-X      
 fBodyAccJerk-meanFreq()-Y       
 fBodyAccJerk-meanFreq()-Z      
 fBodyGyro-mean()-X              
 fBodyGyro-mean()-Y             
 fBodyGyro-mean()-Z              
 fBodyGyro-std()-X              
 fBodyGyro-std()-Y               
 fBodyGyro-std()-Z              
 fBodyGyro-meanFreq()-X          
 fBodyGyro-meanFreq()-Y         
 fBodyGyro-meanFreq()-Z          
 fBodyAccMag-mean()             
 fBodyAccMag-std()               
 fBodyAccMag-meanFreq()         
 fBodyBodyAccJerkMag-mean()      
 fBodyBodyAccJerkMag-std()      
 fBodyBodyAccJerkMag-meanFreq()  
 fBodyBodyGyroMag-mean()        
 fBodyBodyGyroMag-std()          
 fBodyBodyGyroMag-meanFreq()    
 fBodyBodyGyroJerkMag-mean()     
 fBodyBodyGyroJerkMag-std()     
 fBodyBodyGyroJerkMag-meanFreq()
* Unitless

###Average
* Contains average observations of the features' mean and standard deviation. Is calculated by taking the average of the feature's mean and standard deviation
* There are 79 average observations for each feature performed by each subject for each activity
* Unitless