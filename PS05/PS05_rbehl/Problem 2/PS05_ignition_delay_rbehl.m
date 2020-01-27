%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Using the data for the diesel model and jetfuel model find the linearized
% graph of each model. Then find the best fit equations to answer the given
% questions.
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
title("Linear scale for Diesel Data"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
%
subplot(2,2,2);
plot(log10(Datadiesel(:,1)),Datadiesel(:,2),'o'); % ploting the data on semilogx scale
grid on
title("semilogx scale for Diesel Data"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
%
subplot(2,2,3);
plot(Datadiesel(:,1),log10(Datadiesel(:,2)),'o'); % ploting the data on semilogy scale
grid on
title("semilogy scale for Diesel Data"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
%
subplot(2,2,4);
plot(log10(Datadiesel(:,1)),log10(Datadiesel(:,2)),'o'); % ploting the data on loglog scale
grid on
title("loglog scale for Diesel Data"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis

figure (2)
subplot(2,2,1);
plot(Datajetfuel(:,1),Datajetfuel(:,2),'o'); % ploting the data on linear scale
grid on
hold on
title("Linear scale for Jetfuel Data"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
%
subplot(2,2,2);
plot(log10(Datajetfuel(:,1)),Datajetfuel(:,2),'o'); % ploting the data on semilogx scale
grid on
title("semilogx scale for Jetfuel Data"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
%
subplot(2,2,3);
plot(Datajetfuel(:,1),log10(Datajetfuel(:,2)),'o'); % ploting the data on semilogy scale
grid on
title("semilogy scale for Jetfuel Data"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
%
subplot(2,2,4);
plot(log10(Datajetfuel(:,1)),log10(Datajetfuel(:,2)),'o'); % ploting the data on loglog scale
grid on
title("loglog scale for Jetfuel Data"); % creating a title
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis


%% ____________________
%% LINEARIZATION
%Part C % D
coeffiecent_diesel = polyfit(Datadiesel(:,1),log10(Datadiesel(:,2)),1);% finding the slope and y int for the liearized eq
coeffiecent_jetfuel = polyfit(Datajetfuel(:,1),log10(Datajetfuel(:,2)),1);% finding the slope and y int for the liearized eq
linearizeddata_disel = polyval(coeffiecent_diesel,Datadiesel(:,1));% linearizing the diesel data
linearizedata_jetfuel = polyval(coeffiecent_jetfuel,Datajetfuel(:,1));% linearizing the jetfuel data
%Part e
fprintf("\nThe linearized form of the equation for the diesel model is Temperature = %f * ingitiondelay + %f",coeffiecent_diesel(1),coeffiecent_diesel(2));
fprintf(" \nThe linearized form of the equation for the jetfuel model is Temperature = %f * ingitiondelay + %f",coeffiecent_jetfuel(1),coeffiecent_jetfuel(2));

%% ____________________
%% MODEL
figure (3)
plot(Datadiesel(:,1),linearizeddata_disel,'-b','DisplayName','Diesel Trendline'); % ploting the linearized data for diesel and its trend line
hold on
plot(Datadiesel(:,1),log10(Datadiesel(:,2)),'o','DisplayName','Diesel data');% ploting the diesel data
grid on
plot(Datajetfuel(:,1),linearizedata_jetfuel,'-k','DisplayName','Jetfuel Trendline'); % ploting the linearized data for the jetfuel and its trend line
plot(Datajetfuel(:,1),log10(Datajetfuel(:,2)),'o','DisplayName','Jetfuel data'); % ploting the jetfuel data
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
title("Linearized Data for both the Diesel and JetFuel with Trendlines")
legend('Location','northeastoutside')
%Part g
genform_dieseleq = 10.^(((coeffiecent_diesel(1) * Datadiesel(:,1)) + coeffiecent_diesel(2)));% finding the general form of the best fit equation for the diesel model
genform_jetfueleq = 10.^(((coeffiecent_jetfuel(1) * Datajetfuel(:,1)) + coeffiecent_jetfuel(2)));% finding the general form of the best fit equation for the jetfuel model
%Part h
fprintf("\nThe general form of of the best fit equation for the Diesel model is Temperature = 10^ingitiondelay * %.3f + %.3f",coeffiecent_diesel(1),coeffiecent_diesel(2));
fprintf("\nThe general form of of the best fit equation for the Jetfuel model is Temperature = 10^ingitiondelay * %.3f + %.3f",coeffiecent_jetfuel(1),coeffiecent_jetfuel(2));
%% ____________________
%% UPDATED PLOTS
figure (4)
plot(Datadiesel(:,1),(Datadiesel(:,2)),'bo','DisplayName','Diesel data'); % ploting the data on semilogy scale
hold on
plot(Datadiesel(:,1),genform_dieseleq,'-k','DisplayName','Best Fit Curve for Diesel');%ploting the best fit curve for the diesel model
hold off
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
title("Diesel Data with Best-Fit Curve")
legend('Location','northeastoutside')
figure (5)
plot(Datajetfuel(:,1),(Datajetfuel(:,2)),'ko','DisplayName','Jetfuel data'); % ploting the data on semilogy scale
hold on 
plot(Datajetfuel(:,1),genform_jetfueleq,'-b','DisplayName','Best Fit Curve for Jetfuel'); % ploting the best fit curve for the jetfuel model
hold off
xlabel("Temperature(1000/T (K^{-1}))"); % labeling the x axis
ylabel("ignition delay(msec)"); % labeling the y axis
title("JetFuel Data with Best-Fit Curve")
legend('Location','northeastoutside')
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