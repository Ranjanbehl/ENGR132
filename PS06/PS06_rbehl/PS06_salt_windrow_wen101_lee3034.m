function [height, weight] = PS06_salt_cone_wen101_lee3034(width, length)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This script get's the height and width of windrow pile based off of the
% width and length of the container. 
%
% Function Call
% function [windrow_height, windrow_weight] = getWindrowHeightWeight(windrow_width, windrow_length)
%
% Input Arguments
% 1. windrow_width: windrow pile width (m) 
% 2. windrow_length: windrow pile length (m)
%
% Output Arguments
% 1. windrow_height: windrow pile height (m) 
% 2. windrow_weight: windrow pile weight (m)
%
% Assignment Information
%   Assignment:			PS 06, Problem 1
%   Team ID:			008-14
%   Paired Partner:		Matthew Wen, wen101@purdue.edu
%   Paired Partner:		Dong Lee, lee3034@purdue.edu
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
angle = 32; % the angle of the salt when poured in (degrees) 
salt_density = 80; % the density of salt (lb / ft^3) 

%% ____________________
%% CALCULATIONS
lb_to_ton = 1 * (1 / 2.2) * (1 / 1000); % given 1 pound, we convert it to metric ton (metric ton)
ft3_to_m3 = 1 / (3.3 ^ 3); %given 1 ft^3, we convert it to m^3 (m^3)  
sdensity_metric = salt_density * lb_to_ton / ft3_to_m3;  % density of salt (metric ton) / m^3
angle_r = angle * pi / 180; % given angle in degrees, it converts it to radians (radian) 

height = width * tan(angle_r) / 2; % the height of a single windrow (m) 
windrow_volume = width * height * length / 2; % the volume of a single windrow (m^3) 
weight = windrow_volume * sdensity_metric; % weight of salts in a single windrow pile (metric ton) 
%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
fprintf('The height of one windrow pile is %0.2f m and its weight is %.1f mt.\n',height,weight); % print the height and weight of the windrow

%% ____________________
%% COMMAND WINDOW OUTPUT
%[height, weight] = PS06_salt_cone_wen101_lee3034(18.35, 45);
% The height of one windrow pile is 5.73 m and its weight is 3093.3 mt.

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have we provided
% access to our code to another. The function we are submitting
% is our own original work.
