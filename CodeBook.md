# Code Book for Tidy Data

The features selected in this database are derived from those in the original dataset:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Preface

The original variables created by the authors of the experiment:

They come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcc-XYZ and timeGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk-XYZ and timeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.)

- tBodyAcc-XYZ        
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

## Tidy dataset

In the new dataset we merge the test and train datasets to include all subjects, then we we reduce the data to 
only the mean and standard deviation variables derived in the initial experiment. Subsequently we group the data 
first by experimental subjects and second by activity and we calculate the mean of each variable. Therefore in the 
tidy dataset what we have are the means for each variable for each activity for each subject.

The resulting variables are:

| position | variable |description |
|----------|----------|------------|
|1	        |subject	|Subject id |
|2	|activity	|Activity performed by subject: walking, walking upstairs, walking downstairs, sitting, standing, laying|
|3	|timeBodyAccMeanX	|Mean of tBodyAcc-mean()-X|
|4	|timeBodyAccMeanY	|Mean of tBodyAcc-mean()-Y|
|5	|timeBodyAccMeanZ	|Mean of tBodyAcc-mean()-Z|
|6	|timeBodyAccStdX	|Mean of tBodyAcc-std()-X
|7	|timeBodyAccStdY	|Mean of tBodyAcc-std()-Y
|8	|timeBodyAccStdZ	|Mean of tBodyAcc-std()-Z
|9	|timeGravityAccMeanX	|Mean of tGravityAcc-mean()-X
|10	|timeGravityAccMeanY	|Mean of tGravityAcc-mean()-Y
|11	|timeGravityAccMeanZ	|Mean of tGravityAcc-mean()-Z
|12	|timeGravityAccStdX	|Mean of tGravityAcc-std()-X
|13	|timeGravityAccStdY	|Mean of tGravityAcc-std()-Y
|14	|timeGravityAccStdZ	|Mean of tGravityAcc-std()-Z
|15	|timeBodyAccJerkMeanX	|Mean of tBodyAccJerk-mean()-X
|16	|timeBodyAccJerkMeanY	|Mean of tBodyAccJerk-mean()-Y
|17	|timeBodyAccJerkMeanZ	|Mean of tBodyAccJerk-mean()-Z
|18	|timeBodyAccJerkStdX	|Mean of tBodyAccJerk-std()-X
|19	|timeBodyAccJerkStdY	|Mean of tBodyAccJerk-std()-Y
|20	|timeBodyAccJerkStdZ	|Mean of tBodyAccJerk-std()-Z
|21	|timeBodyGyroMeanX	|Mean of tBodyGyro-mean()-X
|22	|timeBodyGyroMeanY	|Mean of tBodyGyro-mean()-Y
|23	|timeBodyGyroMeanZ	|Mean of tBodyGyro-mean()-Z
|24	|timeBodyGyroStdX	|Mean of tBodyGyro-std()-X
|25	|timeBodyGyroStdY	|Mean of tBodyGyro-std()-Y
|26	|timeBodyGyroStdZ	|Mean of tBodyGyro-std()-Z
|27	|timeBodyGyroJerkMeanX	|Mean of tBodyGyroJerk-mean()-X|
|28	|timeBodyGyroJerkMeanY	|Mean of tBodyGyroJerk-mean()-Y|
|29	|timeBodyGyroJerkMeanZ	|Mean of tBodyGyroJerk-mean()-Z|
|30	|timeBodyGyroJerkStdX	|Mean of tBodyGyroJerk-std()-X|
|31	|timeBodyGyroJerkStdY	|Mean of tBodyGyroJerk-std()-Y|
|32	|timeBodyGyroJerkStdZ	|Mean of tBodyGyroJerk-std()-Z|
|33	|timeBodyAccMagMean	|Mean of tBodyAccMag-mean()|
|34	|timeBodyAccMagStd	|Mean of tBodyAccMag-std()|
|35	|timeGravityAccMagMean	|Mean of tGravityAccMag-mean()|
|36	|timeGravityAccMagStd	|Mean of tGravityAccMag-std()|
|37	|timeBodyAccJerkMagMean	|Mean of tBodyAccJerkMag-mean()|
|38	|timeBodyAccJerkMagStd	|Mean of tBodyAccJerkMag-std()|
|39	|timeBodyGyroMagMean	|Mean of tBodyGyroMag-mean()|
|40	|timeBodyGyroMagStd	|Mean of tBodyGyroMag-std()|
|41	|timeBodyGyroJerkMagMean	|Mean of tBodyGyroJerkMag-mean()|
|42	|timeBodyGyroJerkMagStd	|Mean of tBodyGyroJerkMag-std()|
|43	|fourierBodyAccMeanX	|Mean of fBodyAcc-mean()-X|
|44	|fourierBodyAccMeanY	|Mean of fBodyAcc-mean()-Y|
|45	|fourierBodyAccMeanZ	|Mean of fBodyAcc-mean()-Z|
|46	|fourierBodyAccStdX	|Mean of fBodyAcc-std()-X|
|47	|fourierBodyAccStdY	|Mean of fBodyAcc-std()-Y|
|48	|fourierBodyAccStdZ	|Mean of fBodyAcc-std()-Z|
|49	|fourierBodyAccJerkMeanX	|Mean of fBodyAccJerk-mean()-X|
|50	|fourierBodyAccJerkMeanY	|Mean of fBodyAccJerk-mean()-Y|
|51	|fourierBodyAccJerkMeanZ	|Mean of fBodyAccJerk-mean()-Z|
|52	|fourierBodyAccJerkStdX	|Mean of fBodyAccJerk-std()-X|
|53	|fourierBodyAccJerkStdY	|Mean of fBodyAccJerk-std()-Y|
|54	|fourierBodyAccJerkStdZ	|Mean of fBodyAccJerk-std()-Z|
|55	|fourierBodyGyroMeanX	|Mean of fBodyGyro-mean()-X|
|56	|fourierBodyGyroMeanY	|Mean of fBodyGyro-mean()-Y|
|57	|fourierBodyGyroMeanZ	|Mean of fBodyGyro-mean()-Z|
|58	|fourierBodyGyroStdX	|Mean of fBodyGyro-std()-X|
|59	|fourierBodyGyroStdY	|Mean of fBodyGyro-std()-Y|
|60	|fourierBodyGyroStdZ	|Mean of fBodyGyro-std()-Z|
|61	|fourierBodyAccMagMean	|Mean of fBodyAccMag-mean()|
|62	|fourierBodyAccMagStd	|Mean of fBodyAccMag-std()
|63	|fourierBodyAccJerkMagMean	|Mean of fBodyBodyAccJerkMag-mean()
|64	|fourierBodyAccJerkMagStd	|Mean of fBodyBodyAccJerkMag-std()
|65	|fourierBodyGyroMagMean	|Mean of fBodyBodyGyroMag-mean()
|66	|fourierBodyGyroMagStd	|Mean of fBodyBodyGyroMag-std()|
|67	|fourierBodyGyroJerkMagMean	|Mean of fBodyBodyGyroJerkMag-mean()|
|68	|fourierBodyGyroJerkMagStd	|Mean of fBodyBodyGyroJerkMag-std()|



## References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
