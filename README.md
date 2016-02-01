# GetAndCleanData_Assignment4
This repo holds the files to assignment 4 of the Data Science Class: Getting and Cleaning Data

This document will describe what data files are needed and the operations done on those data files to produce the output desired. This document will be broken into the following sections:

BACKGROUND: what the project is about
FILES: list of necessary files
SCRIPT(S): the name of the analysis/code scripts and what they do
INSTRUCTIONS: what to do

BACKGROUND
        The original experiments were carried out on 30 subjects and a random group was selected to be the "training" group and the rest were by default part of the "test" group. The data was supplied as a .zip file that contain two folders: train and test which contain the file of importance. The strategy will be to require the user/tester to unzip the zip archive, rename the folder to "smartphonedata" and copy it to the working directory of R. From that point the scripts will combine the two data sets that had been separated into "test" and "train" and then selecting the variables of interest for later tidying and analysis.

FILES
        smartphonedata/test/
                subject_test.txt
                y_test.txt
                X_test.txt
        
        smartphonedata/train/
                subject_train.txt
                y_train.txt
                X_train.txt

SCRIPT
        run_analysis.R

INSTRUCTIONS
        1. unzip the data archive file: getdata-projectfiles-UCI HAR Dataset.zip
        2. rename the resulting unzipped folder to: "smartphonedata"
        3. copy this folder into the working directory of R
        4. copy the script file "run_analysis.R" to the working directory of R