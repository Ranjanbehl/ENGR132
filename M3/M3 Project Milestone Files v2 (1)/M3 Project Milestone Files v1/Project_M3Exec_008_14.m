function [determined_tau_mean, determined_tau_std, determined_mean_ssemod, determined_sse, determined_sst, determined_r2] = Project_M3Exec_008_14()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function is the exectuive function which uses the predefined
% algorithm to analyze the 100 time histories of temperature (deg F) provided by
% FOS, Inc.
%
% Function Call
% function [determined_tau_mean, determined_tau_std, determined_mean_ssemod, determined_sse, determined_sst, determined_r2] = Project_M3Exec_008_14()
%
% Input Arguments
% This function doesnt have any inputs
%
% Output Arguments
% determined_tau_mean: This is a vector of the mean tau values for 5 of the thermocouple designs (sec)
% determined_tau_std:  This is a vector of standard deviation of tau for 5 of the thermocouple designs (sec)  
% determined_mean_ssemod: This is a vector of the mean SSE mod values for the 5 of the thermocouple designs (deg F^2)
% determined_sse: The SSE values for relationship between price and time constant ($ ^ 2)
% determined_sst: The SST values for relationship between price and time constant ($ ^ 2)
% determined_r2: The r^2 values for relationship between price and time constant 
%
%
% Assignment Information
% Assignment:  	    M3
% Author:             Ranjan Behl, rbehl@purdue.edu
% Team ID:            008-14
% Paired Programmer:  John Chapla, jchapla@purdue.edu
% Paired Programmer:  Matthew Wen, wen101@purdue.edu
% Contributor:        Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
HeatData = csvread('M3_Data_HeatingTimeHistories.csv'); % Getting the Heating data for the thermocouples
CoolData = csvread('M3_Data_CoolingTimeHistories.csv'); % Getting the Cooling data for the thermocouples
HeatSize = size(HeatData);                              % The size of the Heating dataset which is the same as the cooling dataset

meanTauHeat = zeros(5, 1);                              % creating a zeros column vector
meanTauCool = zeros(5, 1);                              % creating a zeros column vector
meanSSEHeat = zeros(5, 1);                              % creating a zeros row vector
meanSSECool = zeros(5, 1);                              % creating a zeros row vector
stdTau = zeros(5, 1);                                   % the standard devation for each of the 5 thermocouples
thermo_cup_idx = 1;                                     % The ID of the termocouple                              
  
allTauHeat = [];                                        % Creating a empty vector for all the tau values (sec)
allTauCool = [];                                        % Creating a empty martix for all the tau values (sec)
%% ____________________
%% CALCULATIONS
for i = 2:10:HeatSize(2) % The outer for loop is incrementing the dataset by 10 columns to account for each thermocouple.
    tauHeatVec = zeros(1,10); % creating a zeros column vector for one thermocup tau value. (sec)
    sseHeatVec = zeros(1,10); % creating a zero column vector for one thermocup ssemod value (deg F^2)
    for j = 0:1:9 % Uses the predefined algortihm from M2 to find the parameters for each heating time history.
       [y_low, y_high, time_constant, time_start] = Project_M4Algorithm_008_14(HeatData(:,1),HeatData(:,i + j)); % calculate best fit based off of Algorithm 
       
       predictedResults = y_low + (y_high - y_low) *(1 - exp(-(HeatData(:,1) - time_start)/ time_constant)); % modeling predicted values (deg F)
       predictedResults(HeatData(:,1) < time_start) = y_low; % setting values from 0 to t start to y low
       
       tauHeatVec(j + 1) = time_constant; % The zero column vector from before is updated with the values of tau for each time history. 
       sseHeatVec(j + 1) = sum(abs(HeatData(:,i + j) - predictedResults) .^ 2) / length(HeatData(:, 1)); % The sse Heat Vector is updated for each tau value
       
    end 
    tauCoolVec = zeros(1,10); % creating a zeros column vector
    sseCoolVec = zeros(1,10); % creating a zeros column vector
    for j = 0:1:9 % Uses the predefined algortihm from M2 to find the parameters for each cooling time history.
       [y_low, y_high, time_constant, time_start] = Project_M4Algorithm_008_14(CoolData(:,1),CoolData(:,i + j)); % calculate best fit based off of Algorithm 
       predictedResults = y_low + (y_high - y_low) * exp((-(CoolData(:,1)- time_start)/ time_constant)); % modeling predicted values (deg F)
       predictedResults(CoolData(:,1) < time_start) = y_high; % setting values from 0 to t start to y high
       
       tauCoolVec(j + 1) = time_constant; % The zero column vector from before is updated with the values of tau for each time history. 
       sseCoolVec(j + 1) = sum(abs(CoolData(:,i + j) - predictedResults) .^ 2) / length(CoolData(:,1)); % The SSE Cool vector is updated for each tau value
    end
    
    meanTauHeat(thermo_cup_idx) = mean(tauHeatVec);  % Setting the mean tau value for the heating time histories
    meanTauCool(thermo_cup_idx) = mean(tauCoolVec); % Setting the mean tau value for the cooling time histories
    meanSSEHeat(thermo_cup_idx) = mean(sseHeatVec); % Setting the mean SSE value for the heating time histories
    meanSSECool(thermo_cup_idx) = mean(sseCoolVec); % Setting the mean SSE value for the cooling time histories 
    
    stdTau(thermo_cup_idx) = std([tauHeatVec, tauCoolVec]); % Finding the standard deviation for the tau value

    allTauHeat = [allTauHeat, tauHeatVec']; % putting all the tau heat values into one vector
    allTauCool = [allTauCool, tauCoolVec']; % putting all the tau cool value into one vector
    
    thermo_cup_idx = thermo_cup_idx + 1; % increasing the thermocouple index 1 so the loop will update for the next thermocouple
end

[determined_sse, determined_sst, determined_r2] = Project_M3Regression_008_14(allTauHeat, allTauCool);  % printing the SSE,SST and r^2 values for all the thermocouples

determined_tau_mean = (meanTauHeat + meanTauCool) ./ 2; % Getting the tau mean of all of the thermocouples 
determined_tau_std = stdTau; % Getting the tau standard deviation of all of the thermocouples 
determined_mean_ssemod = (meanSSEHeat + meanSSECool) ./ 2; % Getting the SSE of all the thermocouples

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.