
# Read all the necessary files

strain <- read.table("train/subject_train.txt")
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
stest <- read.table("test/subject_test.txt")
xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")

# Extract the mean for each record
    
trainmean <- rowMeans(xtrain)
testmean <- rowMeans(xtest)
    
# Extract the standard deviation for each record

trainsd <- apply(xtrain, 1, sd)
testsd <- apply(xtest, 1, sd)

# Merge the training and the test sets to create one data set

train <- cbind(strain, ytrain, trainmean, trainsd)
test <- cbind(stest, ytest, testmean, testsd)
names(train) <- c("Subject", "Activity", "Mean", "SD")
names(test) <- c("Subject", "Activity", "Mean", "SD")
data <- rbind(train, test)

# Use descriptive activity names to name the activities in the data set

data$Activity <- cut(data$Activity, breaks = c(0, 1, 2, 3, 4, 5, 6), labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# Average of each variable for each activity and subject

## Means

meanwalking <- c()
for (i in 1:30) {
    x <- mean(data[data$Subject == i & data$Activity == "WALKING", 3])
    meanwalking <- append(meanwalking, x)
}

meanupstairs<- c()
for (i in 1:30) {
    x <- mean(data[data$Subject == i & data$Activity == "WALKING_UPSTAIRS", 3])
    meanupstairs<- append(meanupstairs, x)
}

meandownstairs <- c()
for (i in 1:30) {
    x <- mean(data[data$Subject == i & data$Activity == "WALKING_DOWNSTAIRS", 3])
    meandownstairs <- append(meandownstairs, x)
}

meansitting <- c()
for (i in 1:30) {
    x <- mean(data[data$Subject == i & data$Activity == "SITTING", 3])
    meansitting <- append(meansitting, x)
}

meanstanding <- c()
for (i in 1:30) {
    x <- mean(data[data$Subject == i & data$Activity == "STANDING", 3])
    meanstanding <- append(meanstanding, x)
}

meanlaying <- c()
for (i in 1:30) {
    x <- mean(data[data$Subject == i & data$Activity == "LAYING", 3])
    meanlaying <- append(meanlaying, x)
}

means <- c(meanwalking, meanupstairs, meandownstairs, meansitting, meanstanding, meanlaying)

## Activity sds

sdwalking <- c()
for (i in 1:30) {
    x <- sd(data[data$Subject == i & data$Activity == "WALKING", 4])
    sdwalking <- append(sdwalking, x)
}

sdupstairs<- c()
for (i in 1:30) {
    x <- sd(data[data$Subject == i & data$Activity == "WALKING_UPSTAIRS", 4])
    sdupstairs<- append(sdupstairs, x)
}

sddownstairs <- c()
for (i in 1:30) {
    x <- sd(data[data$Subject == i & data$Activity == "WALKING_DOWNSTAIRS", 4])
    sddownstairs <- append(sddownstairs, x)
}

sdsitting <- c()
for (i in 1:30) {
    x <- sd(data[data$Subject == i & data$Activity == "SITTING", 4])
    sdsitting <- append(sdsitting, x)
}

sdstanding <- c()
for (i in 1:30) {
    x <- sd(data[data$Subject == i & data$Activity == "STANDING", 4])
    sdstanding <- append(sdstanding, x)
}

sdlaying <- c()
for (i in 1:30) {
    x <- sd(data[data$Subject == i & data$Activity == "LAYING", 4])
    sdlaying <- append(sdlaying, x)
}

sds <- c(sdwalking, sdupstairs, sddownstairs, sdsitting, sdstanding, sdlaying)


# Second tidy, independent data set

Subject <- rep(1:30, times = 6)
Activity <- rep(c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"), each = 30)
Mean <- means
SD <- sds
tidy <- cbind(Activity, Subject)
tidy <- cbind(tidy, Mean)
tidy <- cbind(tidy, SD)

# Create a txt file
write.table(tidy, "tidy.txt")