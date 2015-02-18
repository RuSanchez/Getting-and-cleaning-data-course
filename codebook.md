Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones     
The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* The run_analysis.R script performs the following steps to clean the data: 
 1. Download zip file to temporal folder
 2. Unzip file in working directory.
 3. Read features.txt from the ".\\UCI HAR Dataset" folder and store it in *feat* variable
 4. Read X_train.txt, y_train.txt and subject_train.txt from the ".\\UCI HAR Dataset" folder and store them in *Xtrain*, *Ytrain* and *Subjecttrain* variables respectively.       
 5. Read X_test.txt, y_test.txt and subject_test.txt from the ".\\UCI HAR Dataset" folder and store them in *XTest*, *YTest* and *SubjectTest* variables respectively.
 6. Read activity_labels.txt from the ".\\UCI HAR Dataset" folder and store them in *Activity_names*.
 7. Concatenate *XTest* to *Xtrain* to generate a 10299x561 data frame, *X*; concatenate *YTest* to *Ytrain* to generate a 10299x1 data frame, *Y*; concatenate *SubjectTest* to *Subjecttrain* to generate a 10299x1 data frame, *Subject*.  
 8. Rename columns in data frame *X* with second column of *feat*.
 9. Rename columns in data frames *Y* & *Subject*.
 10. Join the tables *Subject*, *Y* & *X* creating *TidyData*.
 11. Merge *TidyData* & *Activity_names* in order to add activity names, create *Final*.
 12. Extracts only the measurements on the mean and standard deviation for each measurement,*Point2*.
 13. Prepare data for second tidy data set,*P5*.
 14. Save table in working directory, "Tidy data set.txt".
 
