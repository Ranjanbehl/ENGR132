%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Using the two given data sets, find the linear model of each data
% collection from the years 1993 to 2013. Then plot the given data with
% thel best fit equation based of the linear model for both the tide gauge
% and the satellite model.
%
% Assigment Information
%   Assignment:     PS 04, Problem 03
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
%Part A
Data_CSIRO = csvread('Data_CSIRO_gmsl_mo_2013.csv',1,0); % loading the CSIRO data 
Data_altimeter = load('Data_NASA_altimeter_gmsl_meas.txt'); %loading the altimeter data
CSIRO_year = Data_CSIRO(:,1); % The years info from the CSIRO data as a column vector
CSIRO_gmsl = Data_CSIRO(:,2); % The GMSL info(the units are mm) from the CSIRO data as a column vector
altimeter_year = Data_altimeter(:,2); %loading the years info from the NASA alitimeter data
altimeter_gmsl = Data_altimeter(:,5); %loading the gmsl(the units are mm) info from the NASA alitimeter data



%% ____________________
%% CALCULATIONS
%Part B
Data_CSIRO_1993_2013 = [CSIRO_year(find(CSIRO_year >= 1993 & CSIRO_year <=2013)),CSIRO_gmsl(find(CSIRO_year >= 1993 & CSIRO_year <=2013))]; % filtering the CSIRO data so the data from 1993 to 2013 is taken and put into its own martix
Data_altimeter_1993_2013 = [altimeter_year(find(altimeter_year >= 1993 & altimeter_year <= 2013)),altimeter_gmsl(find(altimeter_year >= 1993 & altimeter_year <= 2013))]; % filtering the altimeter data so the data from 1993 to 2013 is taken and put into its own martix
%Part C
Linearreg_CSIRO = polyfit(Data_CSIRO_1993_2013(:,1), Data_CSIRO_1993_2013(:,2),1);
GMSL_CSIRO = Linearreg_CSIRO(1) *Data_CSIRO_1993_2013(:,1) + Linearreg_CSIRO(2);  % finding the best fit equation for the CSIRO data
Linearreg_altimeter = polyfit(Data_altimeter_1993_2013(:,1),Data_altimeter_1993_2013(:,2),1);
GMSL_altimeter = Linearreg_altimeter(1) * Data_altimeter_1993_2013(:,1) + Linearreg_altimeter(2); % finding the best fit equation for the altimeter data
%Part D
SSE_CSIRO = sum((Data_CSIRO_1993_2013(:,2) - GMSL_CSIRO).^2); % caculating the SSE for the CSIRO data
SST_CSIRO = sum((Data_CSIRO_1993_2013(:,2) - mean(Data_CSIRO_1993_2013(:,2))).^2);% caculating the SST of the CSIRO data
rsqaured_CSIRO = (1-(SSE_CSIRO/SST_CSIRO));% caculating the r^2 value of the CSIRO data
SSE_altimeter = sum((Data_altimeter_1993_2013(:,2) - GMSL_altimeter).^2); % caculating the SSE for the altimeter data
SST_altimeter = sum((Data_altimeter_1993_2013(:,2) - mean(Data_altimeter_1993_2013(:,2))).^2);% caculating the SST of the altimeter data
rsqaured_altimeter = (1-(SSE_altimeter/SST_altimeter));% caculating the r^2 value of the altimeter data
%% ____________________
%% FIGURE DISPLAY
%Part f
subplot(2,1,2);
plot(Data_CSIRO_1993_2013(:,1),Data_CSIRO_1993_2013(:,2)); % ploting the tide guage data's GMSL over the years
hold on
plot(Data_CSIRO_1993_2013(:,1),GMSL_CSIRO); % ploting the linear regression over the data
title("Global Mean Sea Level Over Time Using Tide Gauge Data"); %labeling the title
xlabel("Year"); % labeling the x axis
ylabel("GMSL(mm)");% labeing the y axis
subplot(2,1,1);
plot(Data_altimeter_1993_2013(:,1),Data_altimeter_1993_2013(:,2));% ploting the altimeter data's GMSL over the years
hold on
plot(Data_altimeter_1993_2013(:,1),GMSL_altimeter); % ploting the linear regression over the data
title("Global Mean Sea Level Over Time Using Satellite Altimeter Data"); %labeling the title
xlabel("Year"); % labeling the x axis
ylabel("GMSL(mm)");% labeing the y axis




%% ____________________
%% TEXT DISPLAY
%part e
fprintf("\n The equation of the linear model for the tide gauge data is GMSL = %f * Year + %f",Linearreg_CSIRO(1),Linearreg_CSIRO(2)); % printing the linear model equation
fprintf("\n The SSE of the tide gauge model is %f",SSE_CSIRO); % printing the SSE value
fprintf("\n The SST of the tide gauge model is %f",SST_CSIRO); % printing the SST  value
fprintf("\n The r^2 value of the tide gauge model is %f",rsqaured_CSIRO); % printing the r^2 value

fprintf("\n The equation of the linear model for the satellite altimeter model is GMSL = %f * Year + %f",Linearreg_altimeter(1),Linearreg_altimeter(2)); % printing the linear model equation
fprintf("\n The SSE of the satellite altimeter model is %f",SSE_altimeter); % printing the SSE value
fprintf("\n The SST of the satellite altimeter model is %f",SST_altimeter); % printing the SST  value
fprintf("\n The r^2 value of the satellite altimeter model is %f",rsqaured_altimeter); % printing the r^2 value


%% ____________________
%% ANALYSIS

% -- Q1
%  The satellite altimeter data collection model is more accuarate than the
%  tide gauge(CSIRO) data collection model. The reason being is that the
% r^2 value of the altimeter model is higher than the tide gauge and a
% higher r^2 means that the model can explain more of the data.

% -- Q2
% The satellite altimeter data collection is the one that linear model best
% explains the variation in the data. The reason that this one is the best
% is that it SSE is almost half that of the tide gauge data
% collection(4.7846e+03 compared to 8.7680e+03). Having a smaller SSE the
% statellite altimeter data's model line is closer to the data points than
% its counterpart.

% -- Q3
% The satellite altimeter data's linear model showcases the fastest gobal
% mean sea level rise.

% -- Q4
% Based on the tide gauge model predicted the GMSL in  2019 will be 75.1 mm. This
% value was predicted using the slope of the tide gauge's linear model which
% is 3.6 and a y-int of -7193.3. On the other hand the satellite altimeter
% model predicted the GMSL in 2019 to be 106.6 mm. This value was predicted
% using the slope of the satellite model which is 2.9 and a y-int of
% -5748.5. Based on theses results one can see that the satellite altimeter
% predictes a GMSL value that is higher than 30mm when compared to the
% value predicted by the tide gauge model.

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The script I am submitting
% is my own original work.

