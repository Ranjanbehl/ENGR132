function[fluidvol] = PS07_tankVolume_rbehl(orientation,height)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Based on the inputed tank orientation and fluid height the fluid volume
% is calcuated
% Function Call
% PS07_tankVolume_rbehl(orientation,height)
%
% Input Arguments
% orientation is the tank's orientation which can either be horizontally or vertically
% height is the fluid height of the fluid inside the tank
%
% Output Arguments
% fluidvol is the tank's volume that depends on the fuild height and tank's
% orientation
%
% Assignment Information
%   Assignment:       	PS 07, Problem 03
%   Author:             Ranjan Behl, rbehl@purdue.edu
%   Team ID:            008-14      
%  	Contributor: 		Name, login@purdue [repeat for each]
%   My contributor(s) helped me:	
%     [ ] understand the assignment expectations without
%         telling me how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping me plan my solution.
%     [ ] think through the meaning of a specific error or
%         bug present in my code without looking at my code.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
diameter = 3.35; % The diameter of the tank must be 3.55 m
radius = diameter / 2; % The radius of the tank
length = 21.1; % The total length of the tank must be 21.1 m
lengthc = length - diameter; % The length of the cylinderical section 
%% ____________________
%% CALCULATIONS, STRUCTURE, & TEXT DISPLAYS
if orientation == 'h' && (0 <= height && height <= 3.35)
    x = (pi * height^2 * (3 * radius - height)) / 3;
    y = radius^2 * acos((radius - height) / radius);
    z = (radius - height) * (sqrt(2 * radius * height - height^2));
    fluidvol = x + lengthc *(y - z);
    fprintf('\nThe fluid volume is %.1f\n(m)',fluidvol);
elseif orientation == 'v' && ((radius  + lengthc) <= height && height <= (2 * radius + lengthc))
    x = pi * radius^2 * lengthc;
    y = (pi * (height - lengthc)^2 / 3);
    z = 3 * radius - height + lengthc;
    fluidvol = x + y * z;
    fprintf("\nThe fluid volume is %.1d\n(m)",fluidvol);
elseif orientation == 'v' && (radius <= height && height <= (radius + lengthc))
    x = (2 * pi * radius^3) /3;
    y = pi * radius^2;
    z = height - radius;
    fluidvol = x + y * z;
    fprintf("\nThe fluid volume is %.1d\n(m)",fluidvol);
elseif orientation == 'v' && (0 <= height && height <= radius)
    x = (pi * height^2) / 3;
    y = 3* radius - height;
    fluidvol = x * y;
    fprintf("\nThe fluid volume is %.1d\n(m)",fluidvol);
else
    fluidvol =-1;
    fprintf("fluid volume is %d \nError, the fluid height or the tank orientaiton is not valid\n",fluidvol);
end


%% ____________________
%% COMMAND WINDOW OUTPUTS
%{
PS07_tankVolume_rbehl('h',3)

The fluid volume is 166.85 (m)
ans =

  166.8532

PS07_tankVolume_rbehl('v',20)

The fluid volume is 1.7e+02 (m)
ans =

  171.1623

PS07_tankVolume_rbehl('v',15)

The fluid volume is 1.3e+02 (m)
ans =

  127.2907

PS07_tankVolume_rbehl('v',1)

The fluid volume is 4.2e+00 (m)
ans =

    4.2150

PS07_tankVolume_rbehl('s',1)
fluid volume is -1
Error, the fluid height or the tank orientaiton is not valid
ans =

    -1
%}


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT

PS07_integrity_rbehl(["Ranjan Behl"])
