%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% A manufacturing company owns a interior crane system and has provided a
% data table for five cranes that lift objects of various masses. They want
% to perform some vector calculations in the first half of the assignment.
% The second half of the assigment deals with maintaining the cranes'
% operation, which requires the usage of the compound interest formula. 
%
% Assigment Information
%   Assignment:     PS 01, Problem 2
%   Author:         Ranjan Behl, rbehl@purdue.edu
%   Team ID:        008
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
liftMass = [500,600,700,800,1000]'; % the mass lifted by each of the five cranes in order
liftDist = [1.2,4.2,3.0,1.5,2.5]';  % the distance the mass was lifted in meters(m) by each of the cranes
liftTime = [1.2,2.4,2.0,1.5,3.0]';  % the time it took for each crane to lift the mass
retTime  =  [2.4,4.8,4.0,3.5,9.0]'; % the time it took for each crane to return it its original form
opHrs    = 12;   
grav = 9.81; % meters per second sqaured (m/s^2)
Principal = linspace(1000,2000,11); % the principal vector represents the initial amount of money put into the fund, dollars($)
Interest_rates = 0.1:-0.0075:0.025; % annual interest rate
Investment_time = 1:2:21; % years

%% ____________________
%% CALCULATIONS
Lifting_Velocity = liftDist./liftTime; %meters per second
Force_Gravity  = liftMass*grav; %Newtons(N)
Power_Lift = (Force_Gravity.*liftDist)./liftTime; %Watts(W)
num_lift = ((12*60*60)./(liftTime + retTime)); % the number of lifts that each of the cranes that perform in a 12 hour time window

totalvalue_investmentfund = Principal(1,1)*(1 + Interest_rates(end,end)).^Investment_time; % using the values of $1000 for the principal and 0.025 for the interest r the total value of the investment fund for each year in calcuated.
totalvalue_investmentfund_interestrate = Principal(1,6)*(1 + Interest_rates).^Investment_time(1,3); % using the values of $1500 for the principal and time investment of five years the total value of the investment is found for each potential interest rate
totalvalue_investmentfund_principal = Principal*(1 + Interest_rates(1,5)).^Investment_time(1,9); %using the values of 0.07 for the interest rate and 17 years for the investment time, the total value of the investment is found for each initial principal amount
%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS



%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The project I am submitting
% is my own original work.
