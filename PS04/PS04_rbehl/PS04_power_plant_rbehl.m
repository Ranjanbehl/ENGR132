%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%Using the given data find a linear model using the least square method through the polyfit function and then find the SSE,SST and R^2 value of the model.
%
% Assigment Information
%   Assignment:     PS 04, Problem 2
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
data = csvread('Data_power_measurements.csv',1,0); % loading the data from excel
Ambtemp = data(:,1); % A vector has holds the Ambient temperature values
Electricaloutput = data(:,2); % a vector that holds the Net Hourly Electrial Output (MW) values

%% ____________________
%% CALCULATIONS
%Part A
Linearreg = polyfit(Ambtemp,Electricaloutput,1); % peforming linear regression on the data using the polyfit function
%Part B
EOupdated = Linearreg(1)* Ambtemp + Linearreg(2); % computing the predicted values(electrical ouput) of the linear model
%Part C
SSE = sum((Electricaloutput - EOupdated).^2); % caculating the SSE
SST = sum((Electricaloutput - mean(Electricaloutput)).^2);% caculating the SST
rsqaured = (1-(SSE/SST));% caculating the r^2 value 
%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
%Part D
fprintf("\n The equation of the linear model is Electricaloutput = %f * AmbTemp + %f",Linearreg(1),Linearreg(2)); % printing the linear model equation
fprintf("\n The SSE is %f",SSE); % printing the SSE value
fprintf("\n The SST is %f",SST); % printing the SST  value
fprintf("\n The r^2 value is %f",rsqaured); % printing the r^2 value
%Part E
plot(Ambtemp,Electricaloutput,'o');% ploting the given data
hold on
plot(Ambtemp,EOupdated); % ploting the linear model over the given data
ylabel("Ambient Temperature(deg C)"); %labeling the y axis
xlabel("Net Hourly Electrial Output (MW)"); % labeling the x-axis
title("Net Hourly Electrical Output vs. Ambient Temperature"); % labeling the title
%% ____________________
%% ANALYSIS

%% -- Q1
%  Based on my observations there is no difference between the excel and
%  matlab least square model in terms of percison, however the matlab
%  version is much easier to implement than the excel version.


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The script I am submitting
% is my own original work.