%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% The INDOT is studying storage capabilities for road salt, which can be
% stored in either conical or windrow piles. Using the given formulas and
% data they want to perform basic calcuations to find the height,volume and
% weight of the salt in each pile type and how much salt can be stored for
% each pile type within the given amount.
%
% Assigment Information
%   Assignment:     PS 01, Problem 1
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

% Create seven (7) variables and set them equal to the values provided in 
% the problem setup: cone width, number of conical piles, windrow width,
% windrow length, number of windrow piles, angle of repose, and density of
% salt

cone_width = 35; %19.50(old value) % meters(m)
num_conical_piles = 5; %10(old value)
windrow_width = 22.25; %19.50(old value) % meters(m)
windrow_length = 50; %100(old value) % meters(m)
num_windrow_piles = 2; 
angle_repose = 32; % degrees(deg)
density_salt = 80; % pounds per cubic foot(lbs per ft^3)
%% ____________________
%% CALCULATIONS

% Convert salt density to (metric ton)/m^3 using the conversion constants:
% 1 kg = 2.2 lb, 1 mt = 1000 kg, 1 m = 3.3 ft 
   
density_salt = (density_salt/2.2)*(1/1000)*(3.3)^3;

% Calculate the height, volume, and weight of salt in a single conical pile

height_single_conical_pile = (cone_width*tand(angle_repose))/2; % meters(m)
volume_single_conical_pile = (pi*cone_width^2*height_single_conical_pile)/12; % meters cubied(m^3)
weight_single_conical_pile = (density_salt)*(volume_single_conical_pile); % metric tons(mt)

% Calculate the height, volume, and weight of salt in a single windrow pile

height_single_windrow_pile = (windrow_width*tand(angle_repose))/2; % meters(m)
volume_single_windrow_pile = (((windrow_width*height_single_windrow_pile*windrow_length))/2);
weight_single_windrow_pile = (density_salt)*(volume_single_windrow_pile); % metric tons(mt)

% Calculate how much salt, in metric tons, can be stored in the specificed
% number of conical piles and windrow piles

amount_salt_conical_piles = ((num_conical_piles*weight_single_conical_pile)/density_salt); % the amount of salt that can be stored in 10 conical piles, metric tons(mt)
amount_salt_windrow_piles = ((num_windrow_piles*weight_single_windrow_pile)/density_salt); % the amount of salt that can be stored in 2 windrow piles , metric tons(mt)


%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS

% Print the height and weight of one conical pile to the Command Window.
%   Replace var1 with your variable for height.
%   Replace var2 with your variable for weight.
%   Do not hardcode any values.
fprintf('The height of one conical pile is %0.2f m and its weight is %.1f mt.\n',height_single_conical_pile,weight_single_conical_pile)

% Print the height and weight of one windrow pile to the Command Window.
%   Replace var3 with your variable for height.
%   Replace var4 with your variable for weight.
%   Do not hardcode any values.
fprintf('The height of one windrow pile is %0.2f m and its weight is %.1f mt.\n',height_single_windrow_pile,weight_single_windrow_pile)

% Print the total weight and number of conical piles to the Command Window.
%   Replace var5 with your variable for number of piles.
%   Replace var6 with your variable for weight.
%   Do not hardcode any numerical values.
fprintf('The weight of %i conical piles is %0.0f mt.\n',amount_salt_conical_piles,num_conical_piles)

% Print the total weight and number of windrow piles to the Command Window.
%   Replace var7 with your variable for number of piles.
%   Replace var8 with your variable for weight.
%   Do not hardcode any numerical values.
fprintf('The weight of %i windrow piles is %0.0f mt.\n',amount_salt_windrow_piles,num_windrow_piles)


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The project I am submitting
% is my own original work.
