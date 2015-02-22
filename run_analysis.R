#load the train data X, y and subject id
trainx <- read.table("train/X_train.txt")
trainy <- read.table("train/y_train.txt")
trains <- read.table("train/subject_train.txt")

#load the test data X, y and subject id
testx <- read.table("test/X_test.txt")
testy <- read.table("test/y_test.txt")
tests <- read.table("test/subject_test.txt")

#load labels and features
labels <- read.table("activity_labels.txt", col.names=c("activity_label", "activity"))
feats <- read.table("features.txt", col.names=c("feature_id", "feature") )

#select the mean and std features
meanfeat <- which(grepl("mean()", feats$feature, fixed = T ))
stdfeat <- which(grepl("std()", feats$feature, fixed = T ))

meanstd <- sort(c(meanfeat, stdfeat))
meanstdfeats <- feats[meanstd,c(2)]

#combine the train and test data set
allfeats <- cbind(rbind(trainx, testx),rbind(trainy, testy), rbind(trains, tests))

#get the feature description
names(allfeats)<-c(as.character(feats$feature),"activity_label", "subject_label")

msfeats <- allfeats[,c(meanstd,562, 563)]

#merge to get activity description
alldata <- merge(msfeats, labels, by.x = "activity_label", by.y = "activity_label" )

#split by activity and get the mean 
splitdata <- split(alldata[,as.character(meanstdfeats)], list(alldata$subject_label,alldata$activity))
result <- sapply(splitdata, colMeans)


#write data to output.txt
write.table(t(result), "output.txt" )
