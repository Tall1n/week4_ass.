# This ReadMe File explains how I proceeded with the given task of merging and summarizing the data.

The provided Data contains 2 major datasets containing the same variables, a training and a test dataset. 
Each goes with a file containing information about the testsubject that generated the data
and the activity that it was doing. 
The Datasets consists of 561 Variables each. A file with descriptive names corresponding to the variables is provided
as well as a file with the names of the activities that were conducted.

1. In the 1st and 2nd steps of the code I read and merged the files described above.

1.1. "activitylabels" and "features" contain the activity names and the variable names respectively.

1.2. the "test" and "train" datasets contain the observed variables.
	Each goes with a "test/train -label" and -subject" file.

1.3. In the "testcomplete" and "traincomplete" files I combined the information described in 1.2 into two datasets
	that are merged in the next step into the "datamerged" . I used cbind() instead of merge() cause both datasets 
	have the same variables with the same content and cbind() is much faster than merge()

1.4. The "datamerged" file is already given the descriptive variable names from the "features" file.

2. To filter the data for all the mean and standard deviations of the respective variables 
	I created a "subsetindex" file containing only the variables with mean() or std() in their name.
	Then the "subset" file was created with this subsetindex to identify the columns. 

3. Then the activities variable got proper names from the "activitylabels" file from the beginning.

		The results was a subset with properly named columns for the mean and std as well as the
		activitys that occured when the data was collected. 
	
8. From the properly labeled subset a "groupedmean" file was created that contains the average of each
	variable for each activity and each testsubject.
	
9. Then this clean and tidy dataset is written into the "tidydata.csv2" file in the working directory.

	
