# Getting and Cleaning Data: Week 3 Project

## CODEBOOK.md

### Study Design

The raw data consists of data collected from the accelerometers from the Samsung Galaxy S smartphone. Description of the raw data can be found at the following URL:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The following files from the raw data set were used in this study:

* _features_info.txt:_ information about the variables in the feature vector.

* _features.txt:_ list of all features.

* _activity_labels.txt:_ links the class labels with their activity names.

* _train/X_train.txt:_ training set.

* _train/y_train.txt:_ training labels.

* _test/X_test.txt:_ test set.

* _test/y_test.txt:_ test labels.

* _train/subject_train.txt:_ the training subject who performed the activity for each window sample.

* _test/subject_test.txt:_ the test subject who performed the activity for each window sample.

The features used in this study were the features that included the string ‘mean()’ or ‘std()’ in the name of the feature. These features were extracted by passing a regular expression to ‘grep’:

    features_to_keep <- grep("mean\\(\\)|std\\(\\)", features)

where ‘features’ is a list of all feature names from the ‘features.txt’ file.

The training feature vectors and testing feature vectors were read from the raw data files. These were combined into a single table of vectors using ‘rbind.’ This table was filtered to retain just the columns representing means and standard deviations. The list of training subjects and test subjects was combined into a single list. The list of training labels and test labels was also combined into a single list.The numeric labels in the ‘activity’ list were converted to strings using the mapping in the file ‘activity_labels.txt’.

### Code Book

<br>
**Column 1:   subject**		
* description: identifiers for human subjects
* type: integer, range 1 to 30

**Column 2: activity**		
* description: six activity labels
* type: character strings from the list LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

**Column 3-68: means of features**
* description: mean values for 66 features measured for each of the 30 subjects
* type: floating-point number 