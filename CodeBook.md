# Tidy Dataset Codebook

This codebook decribes the data stored in the TidyDataSet.txt file in this repository

## Presentation of the data 

The data contained in the TidyDataSet file is base on data coming from wearable computing experiments performed with accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Experimental study

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals (XYZ). These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals . Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals (FREQ). 

### Tidy Data compilation

The Tidy Data was built, by extracting means and standard deviation of the above mentioned data.
The extracted data were then averaged (mean calculation) for each of the 6 activities perfomed by the 30 volunteers

## Description of the data

The TidyDataSet.txt files contains 180 obesrvations (6 activities by 30 volunteer) of 68 variables summarising the results of the experimental studies.

### Variable meaning

Apart form the "PersonId" and "Activity" variables that describes respectively the volunteer number and the activity performed, all other variable describe the average outcome for the experiments by aggregation of the following patterns:

* XYZ: direction of the measured signal 
* Body/Gravity: acceleration component of the measured signal
* Acceleration/AngularVelocity: sensor used for the measured signal (accelerometer or gyroscope)
* RawSignal/JerkSignal: nature of the mesaure (raw or derived)
* Magnitude: magnitude of the 3 dimensional signal
* Time/Freq: representation of the measure in time or frequency domain
* Mean/Stdev: mean value and standard deviation of the measurments

### Variable list

Name | Type | Description
------------ | ------------- | ------------- 
PersonId | integer | Identification number of the volunteers
Activity | text | Name of the Activity performed
TimeBodyAccelerationRawSignalMeanX | numeric | Average value of the X dimension body acceleration raw signal measures means 
TimeBodyAccelerationRawSignalMeanY | numeric | Average value of the Y dimension body acceleration raw signal measures means 
TimeBodyAccelerationRawSignalMeanZ | numeric | Average value of the Z dimension body acceleration raw signal measures means 
TimeBodyAccelerationRawSignalStdevX | numeric | Average value of the X dimension body acceleration raw signal measures standard deviations
TimeBodyAccelerationRawSignalStdevY | numeric | Average value of the Y dimension body acceleration raw signal measures standard deviations
TimeBodyAccelerationRawSignalStdevZ | numeric | Average value of the Z dimension body acceleration raw signal measures standard deviations
TimeGravityAccelerationRawSignalMeanX | numeric | Average value of the X dimension gravitational acceleration raw signal measures means
TimeGravityAccelerationRawSignalMeanY | numeric | Average value of the Y dimension gravitational acceleration raw signal measures means
TimeGravityAccelerationRawSignalMeanZ | numeric | Average value of the Z dimension gravitational acceleration raw signal measures means
... | ... | ...
TimeBodyAngularVelocityJerkSignalStdevX | numeric | Average value of the X dimension body angular velocity jerk signal measures standard deviations
TimeBodyAngularVelocityJerkSignalStdevY | numeric | Average value of the Y dimension body angular velocity jerk signal measures standard deviations
TimeBodyAngularVelocityJerkSignalStdevZ | numeric | Average value of the Z dimension body angular velocity jerk signal measures standard deviations
... | ... | ...
FreqBodyAccelerationRawSignalMeanX | numeric | Average value of the X dimension body acceleration raw signal measures means in the frequency domain
FreqBodyAccelerationRawSignalMeanY | numeric | Average value of the Y dimension body acceleration raw signal measures means in the frequency domain
FreqBodyAccelerationRawSignalMeanZ | numeric | Average value of the Z dimension body acceleration raw signal measures means in the frequency domain
... | ... | ...
FreqBodyAccelerationJerkSignalMagnitudeStdev  | numeric | Average value of the dimension body acceleration jerk signal measures magnitude standard deviations in the frequency domain
... | ... | ...

The full variable list can be derived based on the variable meaning