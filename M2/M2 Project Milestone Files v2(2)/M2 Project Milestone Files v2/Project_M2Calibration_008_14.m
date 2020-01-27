function[] = Project_M2Calibration_008_14()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program takes in the the four given inputs and plugs them into the
% piecewise equations(cooling or heating). Then create two model of the
% heating and cooling data with the piecewise equations overlaped.
%
% Function Call
% Project_M2Calibration_008_14(yH,yL,tau,ts)
%
% Input Arguments
% N/A
% Output Arguments
% N/A 
%
% Assignment Information
%   Assignment:  	    PS ##, Problem #
%   Author:             Name, login@purdue.edu
%   Team ID:            ###-##
%   Paired Programmer:  Name, login@purdue.edu
%   Contributor:        Name, login@purdue [repeat for each]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
cleanCool = csvread('M2_Data_Calibration_CoolingClean.csv'); % getting the cleaning cooling data 
noisyCool = csvread('M2_Data_Calibration_CoolingNoisy.csv'); % getting the noisy cooling data
cleanHeat = csvread('M2_Data_Calibration_HeatingClean.csv'); % getting the clean heating data
noisyHeat = csvread('M2_Data_Calibration_HeatingNoisy.csv'); % getting the noisy heating data
%Parameters for Clean Heating%
yLCH = 0.00; % The y low 
yHCH = 100.00; % The y high
tsCH = 1.50; % The time step
tauCH = 0.31; % the tau value
%Parameters for Noisy Heating%
yLNH = -0.70; % The y low 
yHNH = 98.90; % The y high
tsNH = 1.50; % The time step 
tauNH = 1.65; % The tau value
%Parameters for Clean Cooling%
yLCC = 100.00; % The y low
yHCC = 0.96; % The y high
tsCC = 1.50;% The time step 
tauCC = 1.82;% tau value 
%Parameters for Noisy Cooling%
yLNC = 98.91; % The y low
yHNC = -0.67; % The y high
tsNC = 1.50; % The time step
tauNC = 1.12; % The tau value
%% ____________________
%% CALCULATIONS
%Cool Heating
yCH = yLCH + (yHCH - yLCH) *(1 - exp(-(cleanHeat(:,1)- tsCH)/ tauCH));
%Noisy Heating
yNH = yLNH + (yHNH - yLNH) *(1 - exp(-(noisyHeat(:,1)- tsNH)/ tauNH)); 
%Cool Cooling
yCC = yLCC + (yHCC - yLCC) * exp((-(cleanCool(:,1)- tsCC)/ tauCC)); 
%Noisy Cooling
yNC = yLNC + (yHNC - yLNC) * exp((-(noisyCool(:,1)- tsNC)/ tauNC)); 
%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
figure(1)
%This plot is the clean heating data with the overlap of the piecewise
%model
subplot(2,1,1)
plot(cleanHeat(:,1),cleanHeat(:,2),'--b');
title("The Clean Heating Calibration Data overlayed with the Piecewise Model");
xlabel("Time (sec)");
ylabel("Measured Temperature (deg C)");
hold on 
plot(cleanHeat(:,1),yCH,'*r');
subplot(2,1,2)
%This plot is the noisy heating data with the overlap of the piecewise
%model
plot(noisyHeat(:,1),noisyHeat(:,2),'--r');
title("The Noisy Heating Calibration Data overlayed with the Piecewise Model");
xlabel("Time (sec)");
ylabel("Measured Temperature (deg C)");
hold on
 plot(noisyHeat(:,1),yNH,'*y');

figure(2)
%This plot is the clean cooling data with the overlap of the piecewise
%model
subplot(2,1,1)
plot(cleanCool(:,1),cleanCool(:,2),'--b');
title("The Clean Cooling Calibration Data overlayed with the Piecewise Model");
xlabel("Time (sec)");
ylabel("Measured Temperature (deg C)");
hold on 
% plot(cleanCool(:,1),yCC,'-.k');
subplot(2,1,2)
%This plot is the noisy cooling data with the overlap of the piecewise
%model
plot(noisyCool(:,1),noisyCool(:,2),'--r');
title("The Noisy Cooling Calibration Data overlayed with the Piecewise Model");
xlabel("Time (sec)");
ylabel("Measured Temperature (deg C)");
hold on 
% plot(noisyCool(:,1),yNC,'-.y');
%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.



