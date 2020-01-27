%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%replace this text with your program decription as a comment
%
% Assigment Information
%   Assignment:     PS 05, Problem 2
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
Datadiesel = csvread("Data_diesel_ignition_delay.csv",1,0); % loading the disel ignition data 
Datajetfuel = csvread("Data_jetA_ignition_delay.csv",1,0);% loading the jet A ignition data


%% ____________________
%% SUBPLOT FIGURE(S)
%Part A
figure (1)
subplot(2,2,1);
plot(Datadiesel(:,1),Datadiesel(:,2),'o'); % ploting the data on linear scale
grid on
hold on
title("Linear scale"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
%
subplot(2,2,2);
plot(log10(Datadiesel(:,1)),Datadiesel(:,2),'o'); % ploting the data on linear scale
grid on
title("semilogx scale"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
%
subplot(2,2,3);
plot(Datadiesel(:,1),log10(Datadiesel(:,2)),'o'); % ploting the data on linear scale
grid on
title("semilogy scale"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
%
subplot(2,2,4);
plot(log10(Datadiesel(:,1)),log10(Datadiesel(:,2)),'o'); % ploting the data on linear scale
grid on
title("loglog scale"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis

figure (2)
subplot(2,2,1);
plot(Datajetfuel(:,1),Datajetfuel(:,2),'o'); % ploting the data on linear scale
grid on
hold on
title("Linear scale"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
%
subplot(2,2,2);
plot(log10(Datajetfuel(:,1)),Datajetfuel(:,2),'o'); % ploting the data on linear scale
grid on
title("semilogx scale"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
%
subplot(2,2,3);
plot(Datajetfuel(:,1),log10(Datajetfuel(:,2)),'o'); % ploting the data on linear scale
grid on
title("semilogy scale"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
%
subplot(2,2,4);
plot(log10(Datajetfuel(:,1)),log10(Datajetfuel(:,2)),'o'); % ploting the data on linear scale
grid on
title("loglog scale"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis


%% ____________________
%% LINEARIZATION
%Part C


%% ____________________
%% MODEL



%% ____________________
%% ANALYSIS

%% -- Q1
% For both the Diesel and Jetfuel data the exponential function is the one
% that best represents the data. This can be seen by the subplots in each
% figure where the semilogy scale is the one with the most linearized data
% trend. 


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The script I am submitting
% is my own original work.