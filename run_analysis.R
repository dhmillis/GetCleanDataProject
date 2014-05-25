# 05-25-2014
# Getting and Cleaning Data - Project

# Read in the activity labels.

activity_labels_file <- "./activity_labels.txt"
activity_labels <- read.table(activity_labels_file, colClasses="character")

# read features.txt file;
# convert factors to character;
# save second column as a list
features_file <- "./features.txt"
features <- read.table(features_file, colClasses="character")[,2]

# Which features to keep?
# We want just features that have 'mean()' or 'std()' in the name.
# Use a simple regular expression passed to 'grep'.
# Include parentheses in the regular expression so that we drop
#   features with 'meanFreq' in the name.

features_to_keep <- grep("mean\\(\\)|std\\(\\)", features)
features_to_keep_names <- features[features_to_keep]

# Read in the training data.

train_vectors_file <- "./train/X_train.txt"
train_vectors <- data.frame(read.table(train_vectors_file))

train_subjects_file <- "./train/subject_train.txt"
train_subjects <- read.table(train_subjects_file)[,1]

train_labels_file <- "./train/y_train.txt"
train_labels <- read.table(train_labels_file)[,1]

# Read in the testing data.

test_vectors_file <- "./test/X_test.txt"
test_vectors <- data.frame(read.table(test_vectors_file))

test_subjects_file <- "./test/subject_test.txt"
test_subjects <- read.table(test_subjects_file)[,1]

test_labels_file <- "./test/y_test.txt"
test_labels <- read.table(test_labels_file)[,1]

# Combine train and test vectors.
all_vectors <- rbind(train_vectors, test_vectors)

# Save just the columns representing means and standard deviations.
mean_std_vectors <- all_vectors[, features_to_keep]

# Change column headers to meaningful names.
names(mean_std_vectors) <- features[features_to_keep]

# Combine train and test labels.
all_labels <- c(train_labels, test_labels)

# Convert activity labels to meaningful names.
named_labels <- activity_labels[all_labels, 2]

# Combine train and test subjects.
all_subjects <- c(train_subjects, test_subjects)

# Create a merged data set.

merged_data <- cbind(mean_std_vectors, "subject" = all_subjects, "activity" = named_labels)

# Create new data set: average of each variable for each activity and each subject.

averaged_data <- aggregate(merged_data[, 1:66], by = list(subject=merged_data$subject, activity=merged_data$activity), mean)

# Saved the merged data set to a file.

tidy_data <- write.table(averaged_data, file = "./tidy_data.txt", col.names=TRUE, row.names=FALSE)


