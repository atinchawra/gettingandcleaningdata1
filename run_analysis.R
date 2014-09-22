#read all the datasets of training and test
test_is_bodyaccx<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
test_is_bodyaccy<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
test_is_bodyaccz<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
test_is_bodygyrox<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
test_is_bodygyroy<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
test_is_bodygyroz<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
test_is_totalaccx<-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
test_is_totalaccy<-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
test_is_totalaccz<-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")
test_subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
test_x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
test_y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")


train_is_bodyaccx<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
train_is_bodyaccy<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
train_is_bodyaccz<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
train_is_bodygyrox<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
train_is_bodygyroy<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
train_is_bodygyroz<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
train_is_totalaccx<-read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
train_is_totalaccy<-read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
train_is_totalaccz<-read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
train_subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
train_x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
train_y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")

#merge all the datasets
is_bodyaccx<-rbind(test_is_bodyaccx,train_is_bodyaccx)
is_bodyaccy<-rbind(test_is_bodyaccy,train_is_bodyaccy)
is_bodyaccz<-rbind(test_is_bodyaccz,train_is_bodyaccz)
is_bodygyrox<-rbind(test_is_bodygyrox,train_is_bodygyrox)
is_bodygyroy<-rbind(test_is_bodygyroy,train_is_bodygyroy)
is_bodygyroz<-rbind(test_is_bodygyroz,train_is_bodygyroz)
is_totalaccx<-rbind(test_is_totalaccx,train_is_totalaccx)
is_totalaccy<-rbind(test_is_totalaccy,train_is_totalaccy)
is_totalaccz<-rbind(test_is_totalaccz,train_is_totalaccz)
subject<-rbind(test_subject_test,train_subject_train)
x<-rbind(test_x_test,train_x_train)
y<-rbind(test_y_test,train_y_train)

#Uses descriptive activity names to name the activities in the data set
y$activityname<-ifelse(y$V1==1,"WALKING",ifelse(y$V1==2,"WALKING_UPSTAIRS",ifelse(y$V1==3,"WALKING_DOWNSTAIRS",ifelse(y$V1==4,"SITTING",ifelse(y$V1==5,"STANDING",ifelse(y$V1==6,"LAYING","NOTHING"))))))

names(subject)<-"mysubject"

#Extracts only the measurements on the mean and standard deviation for each measurement. 
#this needs package psych
#install.packages("psych")
#library(psych)

describe(is_bodyaccx)
describe(is_bodyaccy)
describe(is_bodyaccz)
describe(is_bodygyrox)
describe(is_bodygyroy)
describe(is_bodygyroz)
describe(is_totalaccx)
describe(is_totalaccy)
describe(is_totalaccz)
describe(subject)
describe(x)
describe(y)


is_bodyaccx2<-cbind(is_bodyaccx,subject$mysubject,y$activityname)
is_bodyaccy2<-cbind(is_bodyaccy,subject$mysubject,y$activityname)
is_bodyaccz2<-cbind(is_bodyaccz,subject$mysubject,y$activityname)
is_bodygyrox2<-cbind(is_bodygyrox,subject$mysubject,y$activityname)
is_bodygyroy2<-cbind(is_bodygyroy,subject$mysubject,y$activityname)
is_bodygyroz2<-cbind(is_bodygyroz,subject$mysubject,y$activityname)
is_totalaccx2<-cbind(is_totalaccx,subject$mysubject,y$activityname)
is_totalaccy2<-cbind(is_totalaccy,subject$mysubject,y$activityname)
is_totalaccz2<-cbind(is_totalaccz,subject$mysubject,y$activityname)
#subject2<-cbind(subject,x,y$activityname)


#all average/mean per activity per subject
avg_is_bodyaccx2<-ddply(is_bodyaccx2,.(subject$mysubject,y$activityname),numcolwise(mean))
avg_is_bodyaccy2<-ddply(is_bodyaccy2,.(subject$mysubject,y$activityname),numcolwise(mean))
avg_is_bodyaccz2<-ddply(is_bodyaccz2,.(subject$mysubject,y$activityname),numcolwise(mean))
avg_is_bodygyrox2<-ddply(is_bodygyrox2,.(subject$mysubject,y$activityname),numcolwise(mean))
avg_is_bodygyroy2<-ddply(is_bodygyroy2,.(subject$mysubject,y$activityname),numcolwise(mean))
avg_is_bodygyroz2<-ddply(is_bodygyroz2,.(subject$mysubject,y$activityname),numcolwise(mean))
avg_is_totalaccx2<-ddply(is_totalaccx2,.(subject$mysubject,y$activityname),numcolwise(mean))
avg_is_totalaccy2<-ddply(is_totalaccy2,.(subject$mysubject,y$activityname),numcolwise(mean))
avg_is_totalaccz2<-ddply(is_totalaccz2,.(subject$mysubject,y$activityname),numcolwise(mean))





