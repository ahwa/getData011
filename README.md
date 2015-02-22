##what the script does

run_analysis.R combine the train and test data of the original dataset, select only the mean and std measurements, calculate the average of these measurements per actitivy per subject and write the result table into a text file output.txt.

##how to run

put run_analysis.R in the top directory for the dataset. ie. along side with features.txt and activity_labels.txt but outside of test or train subdirectory.

##output

the output of running the script is a txt file output.txt. It contains 66 rows that match the mean or std measurements and 180 columns. Each column corresponds to one activity of one subject. THe format is "subject_id"."activity name". For example. 2.Walking is the walking acitity of subject 2.