%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Using the given data martix, I was tasked to anylaze the data and find things such the
% minimum GPA of the students who indicated an interest in both ECE and CE
% but not ME, or how many students failed to select any school.
%
% Assigment Information
%   Assignment:     PS 02, Problem 1
%   Author:         Ranjan Behl, rbehl@purdue.edu
%   Team ID:        008
%  	Contributor:    Name, login@purdue [repeat for each]
%   My contributor(s) helped me:	
%     [ ] understand the assignment expectations without
%         telling me how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping me plan my solution.
%     [ ] think through the meaning of a specific error or
%         bug present in my code without looking at my code.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
PESData = csvread('Data_PES_survey_record.csv',1,0); % load the suvery data 

%% ____________________
%% CALCULATIONS

%Part A 
A = PESData(:,2:4); % a smaller martix that is just the school selection
Row_selection_sum = sum(A,2); % sum of each row
RowIndices_failedselection = find(Row_selection_sum==0); %finding the rows whoose sum is equal to zero

%Part B
numstudents_failed = numel(RowIndices_failedselection); % the total number of students who failed to select any school

%Part C
numstudents_singleschool = numel(find(Row_selection_sum == 1)); % the number of students that only indicated a single school as a interest

%Part D
GPA = PESData(:,5); % The GPA column from the given data as a column vector
studentsindices_ECE_CE = find(PESData(:,2) ~= 0 & PESData(:,3)== 0 & PESData(:,4)~= 0); %finding the students who expressed a interest in both ECE and CE but not ME
minGPA = min(GPA(studentsindices_ECE_CE)); % finding the minimum gpa of the students who expressed a interest in both ECE and CE but not ME

%Part E
Suvery = PESData(:,1); % The suvery identifcation number column from the given data as a colum vector
RowIndices_all = find(Row_selection_sum == 6); % Finding the rows in which the student expressed interest in all 3 majors
Suverynum = Suvery(RowIndices_all); % Listing the student identifcation numbers of the students who expressed a interest in all 3 majors

%Part F
studentsindices_CE_ME = find(PESData(:,3) == 1 & PESData(:,2) == 3); % finding the rows in which the student expressed CE as their first choice and ME as their third
numstudents_CE_ME = numel(studentsindices_CE_ME); % finding the total number of students who expressed CE as thier first and ME as their third choice

%Part G
studentinterestECE = PESData(:,2);
studentsindices_ECE = find(PESData(:,2)~=0); % Finding the students who expressed a interest in ECE
studentinterestlv = mean(studentinterestECE(studentsindices_ECE)); % Finding the average interest level among the students who expressed a interest in ECE

%Part H
students_highgpa_ECE_ME = find((PESData(:,2) == 1 | PESData(:,3) == 1) & GPA > 3.5); % finding the students who had ECE or ME as their first choice and whose GPA was higher than a 3.5
averageGPA = mean(GPA(students_highgpa_ECE_ME)); % finding the average among the students who meet the condications

%%% ____________________
%% FORMATTED TEXT DISPLAYS
fprintf('%.2f Students failed to select any school\n',numstudents_failed);
fprintf('%.2f Students incdicated an interest in only one school\n',numstudents_singleschool);
fprintf('%.2f is the minimum GPA of the students who indicated an interest in both ECE and CE but not ME\n',minGPA);
fprintf('%.2f was  the average level of interest in ECE\n',studentinterestlv);







%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The code I am submitting
% is my own original work.