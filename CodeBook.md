a code book that describes the variables, the data, and any transformations or work that 
you performed to clean up the data called CodeBook.md.

This is the R script for the project of getting and cleanning data class.
The data is collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

what does the script do:

1. load all data from the above data set
2. take the train (or test) data set X_train.txt
3. add column names from the features.txt
4. add three columns at the beginging of X_train.txt
	subject: data from subject_train.txt 
	labels: data from y_train.txt
	sets: "train" for training data set and "test" for test data set
5. add each vector data (for exsample body_acc_x_train.txt) as a matrix at the right side 
   to the table.
6. merge the train data set and test data set to form allData table.
7. Extracts the measurements on the mean and standard deviation for each measurement by seaching
   the column name of the allData table for mean or std into a new table call meanAndStd
8. Uses descriptive activity names to name the activities in the data set
9. creates a second, independent tidy data set with the average of each variable for each 
   activity and each subject using the aggregate function
