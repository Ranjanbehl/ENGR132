function [cone_height, cone_weight] = PS06_salt_cone_rbehl_jchapla(cone_diameter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Using the input for the cone diameter the height and weight of the cone
% are calculated.
%
% Function Call
% function [cone_height, cone_weight] = ConicalFunc(cone_diameter)
%
% Input Arguments
% 1.cone_diameter  meters(m)
%
% Output Arguments
% 1.cone_height meters(m)
% 2.cone_weight meters tons(mt)
%
% Assignment Information
%   Assignment:			PS 06, Problem 01
%   Team ID:			008-14
%   Paired Partner:		Ranjan Behl, rbehl@purdue.edu
%   Paired Partner:		John Chapla, jchapla@purdue.edu
%   Contributor:		Name, login@purdue [repeat for each]
%   Our contributor(s) helped us:	
%     [ ] understand the assignment expectations without
%         telling us how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping us plan our solution.
%     [ ] think through the meaning of a specific error or
%         bug present in our code without looking at our code.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
angle_repose = 32; % degrees(deg)
density_salt = 80; % pounds per cubic foot(lbs per ft^3)


%% ____________________
%% CALCULATIONS
density_salt = (density_salt/2.2)*(1/1000)*(3.3)^3;
cone_height = (cone_diameter * tand(angle_repose))/2;
cone_weight = (density_salt)*((pi*cone_diameter^2*cone_height)/12); 

%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
fprintf('The height of the concial pile is %0.2f m and its weight is %.1f mt.\n',cone_height,cone_weight);%print the height and weight

%% ____________________
%% COMMAND WINDOW OUTPUT
%[x,y] = PS06_salt_cone_rbehl_jchapla(21.5)
%The height of the concial pile is 6.72 m and its weight is 1062.3 mt

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have we provided
% access to our code to another. The function we are submitting
% is our own original work.
