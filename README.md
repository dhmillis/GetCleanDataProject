# Getting and Cleaning Data: Week 3 Project

## README.md

The script _run_analysis.R_ reads the data file and generates a summary file, 'tidy_data.txt'. This file shows, for each subject and for each activity, the mean value for each of the 66 features that include 'mean()' or 'std()' in the name of the feature. 

The script reads raw data from the UCI Human Activity Recognition dataset, found at the following URL:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

To set up your environment so the script can load the data:
1. Download the data archive from the above URL.
2. Extract the data to a folder on your local computer.
3. Copy the script run_analysis.R to the folder you just created.
4. In R, set this folder as the working directory:

```
> setwd("C:/path/to/data/folder/")
```

You can now run the script from the R prompt:
```
> source("run_analysis.R")
```

The summary data will be saved in a file named 'tidy_data.txt' in the directory you created.