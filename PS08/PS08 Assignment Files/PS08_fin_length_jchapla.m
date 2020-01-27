function[min_length] = PS08_fin_length_jchapla(diameter,conduct,Tb,air_temp)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function finds the minimum length of cooling rods for electronics
% given user input diameter, conductivity, temperature near the heat
% source, and ambient air temperature.
%
% Function Call
% function[min_length] = PS08_fin_length_jchapla(diameter,conduct,Tb,air_temp)
%
% Input Arguments
% 1. diameter //rod diameter
% 2. conduct //thermal conductivity
% 3. Tb //temperature near the heat source
% 4. air_temp //ambient air temperature
%
% Output Arguments
% 1. min_length //minimum rod length
%
% Assignment Information
%   Assignment:       	PS 08, Problem 2
%   Author:             Name, jchapla@purdue.edu
%   Team ID:            008-14      
%  	Contributor: 		Brendan Jones, jone1777@purdue [repeat for each]
%   My contributor(s) helped me:	
%     [ ] understand the assignment expectations without
%         telling me how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping me plan my solution.
%     [ ] think through the meaning of a specific error or
%         bug present in my code without looking at my code.
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initializes required variables
%% INITIALIZATION
% initial distance 
min_length = 0;
% initial temperature
T = Tb;
% constant heat transfer coefficient
h = 100;

%% If/else structure for determining if the inputs are valid and the calculation for the temperature fi they are valid
%% CALCULATIONS
% Radius of the rods
radius = diameter / 2;
% Circumference
circum = 2 * pi * radius;
% Cross sectional area
area = pi * radius.^2;
% M constant
m = sqrt((h * circum) / (conduct * area));

% If/else to determine if inputs are valid
if(diameter < 0 || conduct < 0 || Tb < 0 || air_temp < 0)
    min_length = -1;
    fprintf("One of the inputs is invalid, all must be >= 0");
else
    while (round(T) > air_temp)
        T = air_temp + (Tb - air_temp) * exp(-m * min_length);
        min_length = min_length + 0.01;
    end
end

min_length = min_length * 100 - 1;
fprintf("min length = %0.0f\n",min_length);

%% Shows what is output in the command window
%% COMMAND WINDOW OUTPUT
% Aluminum test
% PS08_fin_length_jchapla(0.005,205,373,298)
% min length = 26
% 
% ans =
% 
%    26.0000

% Copper test
% PS08_fin_length_jchapla(0.005,400,373,298)
% min length = 36
% 
% ans =
% 
%    36.0000

%% Calls academic integrity statement
%% ACADEMIC INTEGRITY STATEMENT
PS07_integrity_jchapla(["John Chapla"]);



