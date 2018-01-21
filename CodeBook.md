---
title: "Code Book"
author: "Jennifer Grab"
date: "1/21/2018"
output: html_document
---
## Source

Data is downloaded from [this website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The associated journal article is,  
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. *A Public Domain Dataset for Human Activity Recognition Using Smartphones.* 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

## Study Design

From the data source (features_info.txt) - 

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern.  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

## Raw Data

From the data source (README.txt) - 

"For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment."

From the data source (features_info.txt) - 

The features vector includes the following variables -  
"tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean"  

## Processed Data - Variable Descriptions

The included script outputs a 180 x 68 tidy data set with the following variables - 

subject (int) - ID number for each test subject in the study. There were 30 subjects total.

activity (factor) - physical activity performed by test subject during measurement.  There are six options - (1 - walking, 2 - walkingupstairs, 3 - walkingdownstairs, 4 - sitting, 5 - standing, and 6 - laying).  

The remaining 66 columns are average mean and standard deviation of each variable in the features vector as described above.  Features are normalized and bounded within [-1,1] and therefore have no units.  These variables are averaged for each subject / activity combination.  

AvgtBodyAccmeanX (dbl)  
AvgtBodyAccmeanY (dbl)             
AvgtBodyAccmeanZ (dbl)             
AvgtBodyAccstdX (dbl)             
AvgtBodyAccstdY (dbl)             
AvgtBodyAccstdZ (dbl)                         
AvgtGravityAccmeanX (dbl)             
AvgtGravityAccmeanY (dbl)             
AvgtGravityAccmeanZ (dbl)             
AvgtGravityAccstdX (dbl)                      
AvgtGravityAccstdY (dbl)             
AvgtGravityAccstdZ (dbl)             
AvgtBodyAccJerkmeanX (dbl)             
AvgtBodyAccJerkmeanY (dbl)                    
AvgtBodyAccJerkmeanZ (dbl)             
AvgtBodyAccJerkstdX (dbl)             
AvgtBodyAccJerkstdY (dbl)             
AvgtBodyAccJerkstdZ (dbl)                     
AvgtBodyGyromeanX (dbl)             
AvgtBodyGyromeanY (dbl)             
AvgtBodyGyromeanZ (dbl)             
AvgtBodyGyrostdX (dbl)                        
AvgtBodyGyrostdY (dbl)             
AvgtBodyGyrostdZ (dbl)             
AvgtBodyGyroJerkmeanX (dbl)             
AvgtBodyGyroJerkmeanY (dbl)                   
AvgtBodyGyroJerkmeanZ (dbl)             
AvgtBodyGyroJerkstdX (dbl)             
AvgtBodyGyroJerkstdY (dbl)             
AvgtBodyGyroJerkstdZ (dbl)                    
AvgtBodyAccMagmean (dbl)             
AvgtBodyAccMagstd (dbl)             
AvgtGravityAccMagmean (dbl)             
AvgtGravityAccMagstd (dbl)                    
AvgtBodyAccJerkMagmean (dbl)             
AvgtBodyAccJerkMagstd (dbl)             
AvgtBodyGyroMagmean (dbl)             
AvgtBodyGyroMagstd (dbl)                      
AvgtBodyGyroJerkMagmean (dbl)             
AvgtBodyGyroJerkMagstd (dbl)             
AvgfBodyAccmeanX (dbl)             
AvgfBodyAccmeanY (dbl)                        
AvgfBodyAccmeanZ (dbl)             
AvgfBodyAccstdX (dbl)             
AvgfBodyAccstdY (dbl)             
AvgfBodyAccstdZ (dbl)                         
AvgfBodyAccJerkmeanX (dbl)             
AvgfBodyAccJerkmeanY (dbl)             
AvgfBodyAccJerkmeanZ (dbl)             
AvgfBodyAccJerkstdX (dbl)                     
AvgfBodyAccJerkstdY (dbl)             
AvgfBodyAccJerkstdZ (dbl)             
AvgfBodyGyromeanX (dbl)             
AvgfBodyGyromeanY (dbl)                       
AvgfBodyGyromeanZ (dbl)             
AvgfBodyGyrostdX (dbl)             
AvgfBodyGyrostdY (dbl)             
AvgfBodyGyrostdZ (dbl)                        
AvgfBodyAccMagmean (dbl)             
AvgfBodyAccMagstd (dbl)             
AvgfBodyBodyAccJerkMagmean (dbl)             
AvgfBodyBodyAccJerkMagstd (dbl)               
AvgfBodyBodyGyroMagmean (dbl)             
AvgfBodyBodyGyroMagstd (dbl)             
AvgfBodyBodyGyroJerkMagmean (dbl)             
AvgfBodyBodyGyroJerkMagstd (dbl)              
