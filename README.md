# Getting-And-Cleaning-Data-Course-Project

My project contains three files: README.md, Codebook.md and run_analysis.R.
* CodeBook.md 

>A markdown file that a code book that describes the variables, the data, and the transformations and work that I performed to clean up the data.

* README.md

>This file. It explains how the scripts work, contents of the repository, and how the contents are connected. 



###Details on the `run_analysis.R` script

The `run_analysis.R` script is a well-commented R script that does the analysis and creates the tidy data set by doing the following:

>1.  Merges the training and the test sets to create one data set. 
>2.  Extracts only the measurements on the mean and standard deviation for each measurement.
>3.  Uses descriptive activity names to name the activities in the data set
>4.  Appropriately labels the data set with descriptive variable names.
>5.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The `run_analysis.R` script assumes the contents of the provided zip file have all been placed in the working directory at the outset. The specific files and directories from the instructor-provided zip file placed in the working directory:  
a) README.txt;  
b) activity_labels.txt;  
c) features_info.txt;  
d) features.txt;  
e) train directory; and  
f) test directory.

The `run_analysis.R` script requires the `reshape2` package for running. 
> That package will need to be install if issuing the command `library(reshape2)` causes issues.
