#Final Variables:  
data - 10299 row data frame that has the means/SDs for every measurement  
tidy - second data set that has the averages for each activity and subject  

#Initial data set before cleaning:  
Comes from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
- represents data collected from the accelerometers from the Samsung Galaxy S smartphone  
- full description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

#Steps: 
1. Read all the necessary files
2. Extract the mean & standard deviation for each record
3. Merge the training & test sets to create one data set with 4 columns
4. Use descriptive activity names to name the activities in the set
5. Find the averages of each variable for each activity and subject
6. Create a second tidy, independent data set with 180 rows and 4 columns
7. Output a text file of the second data set