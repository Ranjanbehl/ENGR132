function[] = PS07_observatory_rbehl_lee3034(x,y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%The function takes in x and y coordinates and then using theses
%coordinates tells if the location of the camera is outside the walls,
%inside the walls,in the room and hall, the offices and the observatory.
%
% Function Call
%PS07_observatory_rbehl_lee3034(x,y)
%
% Input Arguments
%X is the x coordinate
%Y is the y coordinate
%
% Output Arguments
%There are no output arguments
% Assignment Information
%   Assignment:			PS 07, Problem 01
%   Team ID:			008-14
%   Paired Partner:		John Chapla, jchapla@purdue.edu
%   Paired Partner:		Donglee, lee3034@purdue.edu
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

%% ____________________
%% CALCULATIONS
if abs(x) > 6  ||  (y < -8 || y > 10)
    fprintf("The carmera coordinates %d, %d are outside the building\n",x,y)
elseif abs(x) == 6  ||  (y == -8 || y == 10)
    fprintf("The carmera coordinates %d, %d are on the exterior wall\n",x,y)
elseif (y == 2 && x > -6 && x < 6) && (sqrt(x^2 + y^2) > 5)
    fprintf("The carmera coordinates %d, %d are on the interior wall\n",x,y)
elseif sqrt(x^2 + y^2) == 5
    fprintf("The camera coordinates %d, %d are on the interior wall\n",x,y)
elseif x == 0 && (y > -8 && y < -5)
    fprintf("The camerea coordinates %d, %d are on the interior wall\n",x,y)
elseif sqrt(x^2 + y^2) < 5
    fprintf("The camera coordinates %d, %d are inside the observatory\n",x,y)
elseif (x > -6 && x < 6) && (y > 2 && y < 10) && sqrt(x^2 + y^2) > 5
    fprintf("The camera coordinates %d, %d are inside the exhibit hall\n",x,y)
elseif ((y < 2 && y > -8)&& (x < 0 && x > -8)) && sqrt(x^2 + y^2) > 5
    fprintf("The camera coordinates %d, %d are in the mechanical room\n",x,y)
else
    fprintf("The camera coordinates %d, %d are inside the offices\n",x,y)
end
    

%% ____________________
%% FORMATTED TEXT DISPLAYS



%% ____________________
%% COMMAND WINDOW OUTPUTS
%{
PS07_observatory_rbehl_lee3034(0,7)
The camera coordinates 0, 7 are inside the exhibit hall
PS07_observatory_rbehl_lee3034(-7,-9)
The carmera coordinates -7, -9 are outside the building
PS07_observatory_rbehl_lee3034(6,0)
The carmera coordinates 6, 0 are on the exterior wall
PS07_observatory_rbehl_lee3034(5.5,2)
The carmera coordinates 5.500000e+00, 2 are on the interior wall
PS07_observatory_rbehl_lee3034(0,0)
The camera coordinates 0, 0 are inside the observatory
PS07_observatory_rbehl_lee3034(-5,-6)
The camera coordinates -5, -6 are in the mechanical room
PS07_observatory_rbehl_lee3034(5,-6)
The camera coordinates 5, -6 are inside the offices
%}
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have we provided
% access to our code to another. The function we are submitting
% is our own original work.