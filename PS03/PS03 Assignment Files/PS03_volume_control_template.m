%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%replace this text with your program decription as a comment
%
% Assigment Information
%   Assignment:     PS 03, Problem 2
%   Author:         Ranjan Behl, rbehl@purdue.edu
%   Team ID:        014
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
Data = csvread('Data_volume_power.csv',2,0);% imports the given volume data
Power = Data(:,1);%creates a column vector that has the first column of data
DesignOEP4 = Data(:,2);% creates a column vector that has the second column of data
DesignIEP3 = Data(:,3);% creates a column vector that has the third column of data
%% ____________________
%% CALCULATIONS
VolumeOEP4 = (67.1 *log(Power) - 1.3);% calculating the predicted volumes for OEP4
VolumeIEP3 = (77.7 *log(Power) - 7.3);% calculating the predicted volumes for IEP3

%% ____________________
%% FORMATTED FIGURE
plot(Power,DesignOEP4 & DesignIEP3)


%% ____________________
%% ANALYSIS

%% -- Q1
% 

%% -- Q2
% 


%% -- Q3
% 


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The script I am submitting
% is my own original work.