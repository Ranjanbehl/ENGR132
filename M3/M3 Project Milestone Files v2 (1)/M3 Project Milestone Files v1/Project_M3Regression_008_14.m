function [determined_sse, determined_sst, determined_r2] = Project_M3Regression_008_14(allTauHeat, allTauCool)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% The UDF function finds the regression between price and tau value for each of the 
% thermocouples design. It then determines the relationship between price and tau value
%
% Function Call
% function [determined_sse, determined_sst, determined_r2] = Project_M3Regression_008_14(allTauHeat, allTauCool)
%
% Input Arguments
% allTauHeat: This is a vector of all the Tau values from the heating time histories for all 50 heating data set
% allTauCool: This is a vector of all the Tau values from the cooling time histories for all 50 cooling data set
% 
% Output Arguments
% determined_sse: The SSE values for relationship between price and time constant ($ ^ 2)
% determined_sst: The SST values for relationship between price and time constant ($ ^ 2)
% determined_r2: The r^2 values for relationship between price and time constant 
%
% Assignment Information
% Assignment:  	      M3
% Author:             Donghyun Lee, lee3034@purdue.edu
% Team ID:            008-14
% Paired Programmer:  Matthew Wen, wen101@purdue.edu
% Contributor:        Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ____________________
%% INITIALIZATION
fos1 = [allTauHeat(1:10), allTauCool(1:10)]; % getting the heating and cooling curve tau value for the first thermocouple design (sec)
fos2 = [allTauHeat(11:20), allTauCool(11:20)]; % getting the heating and cooling curve tau value for the second thermocouple design (sec)
fos3 = [allTauHeat(21:30), allTauCool(21:30)]; % getting the heating and cooling curve tau value for the third thermocouple design (sec)
fos4 = [allTauHeat(31:40), allTauCool(31:40)]; % getting the heating and cooling curve tau value for the fourth thermocouple design (sec)
fos5 = [allTauHeat(41:50), allTauCool(41:50)]; % getting the heating and cooling curve tau value for the fifth thermocouple design (sec)

fos1price = zeros(1,20) + 15.83; % setting the price for the first thermocouple design ($)
fos2price = zeros(1,20) + 8.52; % setting the price for the second thermocouple design ($)
fos3price = zeros(1,20) + 3.50; % setting the price for the third thermocouple design ($)
fos4price = zeros(1,20) + 2.03; % setting the price for the fourth thermocouple design ($)
fos5price = zeros(1,20) + 0.65; % setting the price for the fifth thermocouple design ($)

all_tau = [fos1, fos2, fos3, fos4, fos5]; % putting all 100 tau values inside a single vector (sec)
all_price = [fos1price, fos2price, fos3price, fos4price, fos5price]; % matcing prices with their respective tau value ($)

input_tau_values = linspace(min(all_tau), max(all_tau), 100); % input time values from min tau value to max tau value (sec)

%% ____________________
%% CALCULATIONS
meanfos1 = mean(fos1); % getting mean of tau value for first thermocouple design (sec)
meanfos2 = mean(fos2); % getting mean of tau value for second thermocouple design (sec)
meanfos3 = mean(fos3); % getting mean of tau value for third thermocouple design (sec)
meanfos4 = mean(fos4); % getting mean of tau value for fourth thermocouple design (sec)
meanfos5 = mean(fos5); % getting mean of tau value for fifth thermocouple design (sec)

% Variables that are used for the linearlized data
mean_x = [meanfos1, meanfos2, meanfos3, meanfos4, meanfos5]; % x coordinates is the independent variable (sec)
mean_y = [mean(fos1price), mean(fos2price), mean(fos3price), mean(fos4price), mean(fos5price)]; % y coordinates is the independent variable (sec)
log_mean_y = log10(mean_y); % log base 10 from mean y values

% Best coefficients (slope and y-int)
coeffs = polyfit(mean_x,log_mean_y,1); % using polyfit for semilogy plot
% Regression line equation
graph_log_mean_predict_price = coeffs(1) * input_tau_values + coeffs(2); % getting predicted output for certain range
mean_predict_price = coeffs(1) * mean_x + coeffs(2); % getting log10 of predicted model (log10($))
graph_mean_predict_price = 10 .^ graph_log_mean_predict_price; % getting values to represent on graph

SSE = sum((log10(mean_y) - mean_predict_price).^2); % SSE for the linearized data set
SST = sum((log10(mean_y) - mean(log10(mean_y))).^2); % SST for the linearized data set
r2 = 1 - SSE/SST; % r^2 value for the linearized data set

determined_sse = SSE; % return the SSE value 
determined_sst = SST; % return the SST value
determined_r2 = r2; % return the r^2 value

%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
figure(1)
%linear
subplot(2,2,1);                                     % Creating 2 by 2 subplot and this plot will locate top left
plot(fos1, fos1price, 'b*')                         % Plotting Tau values vs. Unit price for the first thermocouple design on linear scale
hold on
plot(fos2, fos2price, 'r*')                         % Plotting Tau values vs. Unit price for the second thermocouple design on linear scale
plot(fos3, fos3price, 'c*')                         % Plotting Tau values vs. Unit price for the third thermocouple design on linear scale
plot(fos4, fos4price, 'g*')                         % Plotting Tau values vs. Unit price for the fourth thermocouple design on linear scale
plot(fos5, fos5price, 'k*')                         % Plotting Tau values vs. Unit price for the fifth thermocouple design on linear scale
title('Linear Scale Relationship of Tau values and Unit Price ');    % Giving a title to the plot
xlabel('Tau values(s)');                            % Giving name of the x axis
ylabel('Unit price($)');                            % Giving name of the y axis
grid on;                                            % Gives grid for the plot

%semilogx
subplot(2,2,2);                                     % Creating 2 by 2 subplot and this plot will locate top right
semilogx(fos1, fos1price, 'b*')                     % Plotting Tau values vs. Unit price for the first thermocouple design on semilogx scale
hold on
semilogx(fos2, fos2price, 'r*')                     % Plotting Tau values vs. Unit price for the second thermocouple design on semilogx scale
semilogx(fos3, fos3price, 'c*')                     % Plotting Tau values vs. Unit price for the third thermocouple design on semilogx scale
semilogx(fos4, fos4price, 'g*')                     % Plotting Tau values vs. Unit price for the fourth thermocouple design on semilogx scale
semilogx(fos5, fos5price, 'k*')                     % Plotting Tau values vs. Unit price for the fifth thermocouple design on semilogx scale
title('Semilogx Scale Relationship of Tau values and unit price');  % Giving a title to the plot
xlabel('Tau values(log10(sec))');                            % Giving name of the x axis
ylabel('Unit price($)');                            % Giving name of the y axis
grid on;                                            % Gives grid for the plot

%semilogy
subplot(2,2,3);                                     % Creating 2 by 2 subplot and this plot will locate bottom left                                                                 
semilogy(fos1, fos1price, 'b*')                     % Plotting Tau values vs. Unit price for the first thermocouple design on semilogy scale
hold on
semilogy(fos2, fos2price, 'r*')                     % Plotting Tau values vs. Unit price for the second thermocouple design on semilogy scale
semilogy(fos3, fos3price, 'c*')                     % Plotting Tau values vs. Unit price for the third thermocouple design on semilogy scale
semilogy(fos4, fos4price, 'g*')                     % Plotting Tau values vs. Unit price for the fourth thermocouple design on semilogy scale
semilogy(fos5, fos5price, 'k*')                     % Plotting Tau values vs. Unit price for the fifth thermocouple design on semilogy scale
title('Semilogy Scale Relationship of Tau values and Unit Price');  % Giving a title to the plot
xlabel('Tau values(sec)');                            % Giving name of the x axis
ylabel('Unit price(log10($))');                            % Giving name of the y axis
grid on;                                            % Gives grid for the plot


%loglog scales
subplot(2,2,4);                                     % Creating 2 by 2 subplot and this plot will locate bottom right
loglog(fos1, fos1price, 'b*')                       % Plotting Tau values vs. Unit price for the first thermocouple design on loglog scale
hold on
loglog(fos2, fos2price, 'r*')                       % Plotting Tau values vs. Unit price for the second thermocouple design on loglog scale
loglog(fos3, fos3price, 'c*')                       % Plotting Tau values vs. Unit price for the third thermocouple design on loglog scale
loglog(fos4, fos4price, 'g*')                       % Plotting Tau values vs. Unit price for the fourth thermocouple design on loglog scale
loglog(fos5, fos5price, 'k*')                       % Plotting Tau values vs. Unit price for the fifth thermocouple design on loglog scale
title('Loglog Scale Relationship of Tau values and Unit Price');    % Giving a title to the plot
xlabel('Tau values (log10(sec))');                            % Giving name of the x axis
ylabel('Unit price (log10($))');                            % Giving name of the y axis
grid on;                                            % Gives grid for the plot

sgtitle('Visual Relationships of Tau Values and Unit Price based off of Different Models');    % Giving a title to the entire subplot

figure(2); % putting up figure 2
plot(input_tau_values, graph_mean_predict_price, 'k-'); % plot the predicted model 
hold on % hold on for more plots
plot(fos1, fos1price, 'b*'); % plot the FOS-1 model
plot(fos2, fos2price, 'r*'); % plot the FOS-2 model
plot(fos3, fos3price, 'c*'); % plot the FOS-3 model
plot(fos4, fos4price, 'g*'); % plot the FOS-4 model
plot(fos5, fos5price, 'm*'); % plot the FOS-5 model
hold off % hold off for plots
title('Relationship of Tau Value and Price of Thermocouple Design'); % put the title on the graph
xlabel('Time Constant (sec)') % put the x label on graph
ylabel('Unit price ($)') % put the y label on graph
legend("Modeled Equation", "Model FOS-1", "Model FOS-2", "Model FOS-3", "Model FOS-4", "Model FOS-5"); % put the legened on graph
grid on % turn on the grid on the plot

%% ____________________
%% COMMAND WINDOW OUTPUT
fprintf("Modeled Equation: Price = %.3f * 10 ^ (%.3f * Tau Value)", 10 ^ coeffs(2), coeffs(1)); % print the modeled equation on consel

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
