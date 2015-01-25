# Introduction

The script `run_analysis.R` performs the 5 steps described in the course project's requirement.

* 1st: all the similar data is merged using the `rbind()` function.
* 2nd: extract only those columns with the mean and standard deviation measures from the whole dataset. Then the column names are corrected based on information in `features.txt`.
* 3rd: Because we just only consider the activity data which value from 1 to 6, based on the information in `activity_labels.txt`, activity names are extracted and they are substituted in dataset.
* 4th: On the whole dataset, those columns with vague column names are corrected.
* Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called `tidy_averages_data.txt`, and uploaded to this repository.

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_std_features`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activities` variable.
* `all_data` merges `x_data`, `y_data` and `subject_data` in a big dataset.
* Finally, `averages_data` contains the relevant averages which will be later stored in a `.txt` file.

# Notes
`ddply()` from the plyr package is used to apply `colMeans()` and ease the development.