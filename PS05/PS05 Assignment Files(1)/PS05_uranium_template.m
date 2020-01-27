%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%replace this text with your program decription as a comment
%
% Assigment Information
%   Assignment:			PS 05, Problem 01
%   Author:				Ranja Behl, rbehl@purdue.edu
%   Team ID:			008-14
%   Paired Partner:		Name, login@purdue.edu
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
subplot(2,2,1);
plot(time,uptake,'o'); % ploting the data on linear scale
grid on
title("Linear scale"); % creating a title
xlabel("Time(hours)"); % labeling the x axis
ylabel("micrograms U/grams adsorbent"); % labeling the y axis

subplot(2,2,2);
plot(log10(time),uptake,'ro');
grid on
title("semilogx scale"); % creating a title
xlabel("Time(hours)"); % labeling the x axis
ylabel("micrograms U/grams adsorbent"); % labeling the y axis

subplot(2,2,3);
plot(time,log10(uptake),'bo');
grid on
title("semilogy scale"); % creating a title
xlabel("Time(hours)"); % labeling the x axis
ylabel("micrograms U/grams adsorbent"); % labeling the y axis

subplot(2,2,4);
plot(log10(time),log10(uptake),'ko');
grid on
title("loglog scale"); % creating a title
xlabel("Time(hours)"); % labeling the x axis
ylabel("micrograms U/grams adsorbent"); % labeling the y axis





%% ____________________
%% LINEARIZATION



%% ____________________
%% UPTAKE MODEL



%% ____________________
%% PREDICTIONS



%% ____________________
%% ANALYSIS

%% -- Q1
% 


%% -- Q2
% 



%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have we provided
% access to our code to another. The script we are submitting
% is our own original work.