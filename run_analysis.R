#load table
#   file<-file.path(directory, sprintf("%03d.csv", i)) 
#C:\Users\zirong\Documents\R_class\geting and cleaning data\proj1\getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset\train
#x<-read.fwf("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", width=c(10,9,4,9,4,9,4,9,4), skip=4)
#colSums(x[,2:9])
#x_train<-read.csv("C:/Users/zirong/Documents/R_class/geting and cleaning data/proj1/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_Train.txt",sep=" ", header=FALSE)

#read files



activity_labels<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", header=FALSE)
features<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", header=FALSE)

X_Train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_Train.txt", header=FALSE)
subject_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
y_Train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_Train.txt", header=FALSE)

body_acc_x_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", header=FALSE)
body_acc_y_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", header=FALSE)
body_acc_z_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", header=FALSE)
body_gyro_x_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", header=FALSE)
body_gyro_y_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", header=FALSE)
body_gyro_z_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", header=FALSE)
total_acc_x_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", header=FALSE)
total_acc_y_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", header=FALSE)
total_acc_z_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", header=FALSE)

X_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", header=FALSE)
subject_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", header=FALSE)
y_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", header=FALSE)

body_acc_x_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", header=FALSE)
body_acc_y_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", header=FALSE)
body_acc_z_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", header=FALSE)
body_gyro_x_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", header=FALSE)
body_gyro_y_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", header=FALSE)
body_gyro_z_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", header=FALSE)
total_acc_x_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", header=FALSE)
total_acc_y_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", header=FALSE)
total_acc_z_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", header=FALSE)


#add cloumn names

#remove () , - in names

cnames<-features[,2]

goodFeatures<-gsub("\\(", "", cnames)
goodFeatures<-gsub("\\)", "", goodFeatures)
goodFeatures<-gsub(",", "_", goodFeatures)
goodFeatures<-gsub("-", "_", goodFeatures)



colnames(X_Train) <- goodFeatures

colnames(subject_train) <- "subject"
colnames(y_Train) <- "labels"

#add subject, set, labels
Train<-cbind(subject_train,y_Train)
Train$sets<-"train"
Train<-cbind(Train,X_Train)

#add vectors
#rbind does not work for list feature.
Train$body_acc_x<-as.matrix(body_acc_x_train)
Train$body_acc_y<-as.matrix(body_acc_y_train)
Train$body_acc_z<-as.matrix(body_acc_z_train)

Train$body_gyro_x<-as.matrix(body_gyro_x_train)
Train$body_gyro_y<-as.matrix(body_gyro_y_train)
Train$body_gyro_z<-as.matrix(body_gyro_z_train)

Train$total_acc_x<-as.matrix(total_acc_x_train)
Train$total_acc_y<-as.matrix(total_acc_y_train)
Train$total_acc_z<-as.matrix(total_acc_z_train)


#test data set: same as train set
colnames(X_test) <- goodFeatures
colnames(subject_test) <- "subject"
colnames(y_test) <- "labels"


test<-cbind(subject_test,y_test)
test$sets<-"test"
test<-cbind(test,X_test)

test$body_acc_x<-as.matrix(body_acc_x_test)
test$body_acc_y<-as.matrix(body_acc_y_test)
test$body_acc_z<-as.matrix(body_acc_z_test)



test$body_gyro_x<-as.matrix(body_gyro_x_test)
test$body_gyro_y<-as.matrix(body_gyro_y_test)
test$body_gyro_z<-as.matrix(body_gyro_z_test)


test$total_acc_x<-as.matrix(total_acc_x_test)
test$total_acc_y<-as.matrix(total_acc_y_test)
test$total_acc_z<-as.matrix(total_acc_z_test)



#combind train and test data set

allData<-rbind(Train, test)
write.table(allData, "allData.txt", row.name=TRUE)

#get mean and std data


good<-grepl("_mean", colnames(allData))|grepl("_std", colnames(allData))
meanAndStd<-allData[,good]
meanAndStd<-cbind(allData[,1:3],meanAndStd)
meanAndStd$labels<-activity_labels[meanAndStd$labels,2]

write.table(meanAndStd, "meanAndStd.txt", row.name=TRUE)

#summary

secData<-aggregate(meanAndStd[,4:82], by=list(meanAndStd$subject, meanAndStd$labels), mean)
write.table(secData, "secData.txt", row.name=FALSE)