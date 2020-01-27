%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%Using the given data create a figure with a 2x2 subplot that contain the
%given data on linear,semilogx,semilogy and loglog scales. Then the data is
%linearized to find the best fit equation by using least squares
%regression. Then using this equation answer the given questions.
%
% Assigment Information
%   Assignment:			PS 05, Problem 01
%   Author:				Ranjan Behl, rbehl@purdue.edu
%   Team ID:			008-14
%   Paired Partner:	    John Chapla, jchapla@purdue.edu
%   Contributor:		Name, login@purdue [repeat for each]
%   Our contributor(s) helped us:	
%     [ ] understand the assignment expectations without
%         telling us how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping us plan our solution.
%     [ ] think through the meaning of a specific error or
%         bug present in our code without looking at our code.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% ____________________
%% INITIALIZATION
Data = csvread("Data_uranium_adsorption.csv",1,0); % loading the given data into a martix called Data
uptake = Data(:,2); % the uptake data into a independent column vector
time = Data(:,1); % the time data into a separte column vector 
%% ____________________
%% SUBPLOT FIGURE
%Part A
figure (1)
subplot(2,2,1);
plot(time,uptake,'o'); % ploting the data on linear scale
grid on
title("Linear scale"); % creating a title
xlabel("Time(hours)"); % labeling the x axis
ylabel("Uptake(micrograms U/grams adsorbent)"); % labeling the y axis

subplot(2,2,2);
plot(log10(time),uptake,'ro');
grid on
title("semilogx scale"); % creating a title
xlabel("Time(hours)"); % labeling the x axis
ylabel("Uptake(micrograms U/grams adsorbent)"); % labeling the y axis

subplot(2,2,3);
plot(time,log10(uptake),'bo');
grid on
title("semilogy scale"); % creating a title
xlabel("Time(hours)"); % labeling the x axis
ylabel("Uptake(micrograms U/grams adsorbent)"); % labeling the y axis

subplot(2,2,4);
plot(log10(time),log10(uptake),'ko');
grid on
title("loglog scale"); % creating a title
xlabel("Time(hours)"); % labeling the x axis
ylabel("Uptake(micrograms U/grams adsorbent)"); % labeling the y axis





%% ____________________
%% LINEARIZATION
%Part C
coeffiecent_uptake  = polyfit(log10(time),log10(uptake),1); % finding the slope and y int of the linear eq
Linearizeddata = 10.^coeffiecent_uptake(2) * time.^ coeffiecent_uptake(1); %
%
fprintf('\nThe linearized form of the equation is Uptake = %d * time + %f',coeffiecent_uptake(:,1),coeffiecent_uptake(:,2));
%
figure (2)
loglog(time,Linearizeddata,'-k'); % ploting the trendline 
grid on
hold on
plot(time,uptake,'ro'); % ploting the given data
title("Linearized Data with trend line"); % creating a title
xlabel("Time(hours)"); % labeling the x axis
ylabel("Uptake(micrograms U/grams adsorbent)"); % labeling the y axis
hold off
%% ____________________
%% UPTAKE MODEL
fprintf("\n THe best- fit equation for the relationship is Uptake = 10^%f * time^%f",coeffiecent_uptake(2),coeffiecent_uptake(1))
%
bestfitdata = 10.^coeffiecent_uptake(2) * time.^coeffiecent_uptake(1); % finding the new y values based on the best fit eq
figure (3)
plot(time,uptake,'ro');
hold on
grid on
plot((time),bestfitdata,'-b');
title("Uptake Model with Best-Fit Equation"); % creating a title
xlabel("Time(hours)"); % labeling the x axis
ylabel("Uptake(micrograms U/grams adsorbent)"); % labeling the y axis
hold off
%% ____________________
%% PREDICTIONS
uptake10 = 10.^coeffiecent_uptake(2) * 10.^coeffiecent_uptake(1); % finding the predicted uranium uptake after 10 hours
uptake100 = 10.^coeffiecent_uptake(2) * 100.^coeffiecent_uptake(1); % finding the predicted uranium uptake after 100 hours
uptake250 = 10.^coeffiecent_uptake(2) * 250.^coeffiecent_uptake(1); % finding the predicted uranium uptake after 250 hours
%% ____________________
%% ANALYSIS

%% -- Q1
% The power function(loglog scale) is the one that best represents the
% relationship between data.


%% -- Q2
% Based on the model the predicted uranium uptake after 10 hours is 74.6197
% micrograms U/grams adsorbent, 196.3796 micrograms U/grams adsorbent after 100 hours 
% and 288.6208 micrograms U/grams adsorbent after 250 hours. The main
% limitation that the lead engineer needs to know about is that the model
% will become more useless the more it goes away from the given data. For
% example its not advised to use the model after say 250 hours.



%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have we provided
% access to our code to another. The script we are submitting
% is our own original work.