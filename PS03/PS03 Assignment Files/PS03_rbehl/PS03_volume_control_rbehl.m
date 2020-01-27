%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Using the given data, we were asked to plot the IEP3 vs power and OEP4 vs
% power. Then plot the predicted volume v. power for each design and then
% compare them to ask the given questions.
%
% Assigment Information
%   Assignment:     PS 03, Problem 2
%   Author:         Ranjan Behl, rbehl@purdue.edu
%   Team ID:        008-14
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
%a & b
plot(Power,DesignOEP4,'-or');% ploting the original data for the OEP4 headphone design
hold on
plot(Power,DesignIEP3,'-.pb');% ploting the original data for the IEP3 headphone design
hold on
plot(Power,VolumeOEP4,':xg');% ploting the model prediction for the OEP4 design
hold on
plot(Power,VolumeIEP3,'--+k');%ploting the model predication for the IEP3 design
grid on
%c
title("Volume of the OEP4 and IEP3 designs vs Power input");% creating a descriptive title
xlabel("Power(mW)");% labeling the x axis
ylabel("Volume(dB)");% labeling the y axis
legend("DesignOEP4","DesignIEP3","VolumeOEP4","VolumeIEP3");% creating a legend
legend('location','northeastoutside'); % changing the legend location so it doesnt cover up the graph
%% ____________________
%% ANALYSIS


%% -- Q1
% The IEP3 design is the better model as it contantly produces more volume
% than the OEP4 design as shown by the graphs.

%% -- Q2
% The IEP3 design is the most sensitive because it has the largest
% increase on volume with a increase in power. This can be seen on the
% plot where the IEP3 line value is greater than around 30 when relating
% to the the OEP4 line, this occurs at a power value of 40 mW.

%% -- Q3
% At 60db the IEP3 design will have the better battery life as seen in the
% graph where the IEP3 Design graph is higher than the OEP4 design. At 30db
% both designs are good as the will have a similar battery life as seen
% graphs in which at 30db both designs overlap.


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The script I am submitting
% is my own original work.