function[min_lengthVec] = PS09_fin_revisit_jchapla_rbehl(min_diam,max_diam,conduct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function uses loops to find a vector of minimum rod lengths for cooling rods in a
% computer, given a minimum diameter, max diameter, and thermal
% conductivity for the material being used.
%
% Function Call
% function[min_lengthVec] = PS09_fin_revisit_jchapla_rbehl(min_diam,max_diam,thermalC)%
% Input Arguments
% 1. min_diam //minimum user input diameter
% 2. max_diam //max user input diameter
% 3. thermalC //thermal conductivity
%
% Output Arguments
% 1. min_lengthVec //vector of the minimum rod lengths
%
% Assignment Information
%   Assignment:			PS 09, Problem 2
%   Team ID:			008-14
%   Paired Partner:		John Chapla, jchapla@purdue.edu
%   Paired Partner:		Ranjan Behl, rbehl@purdue.edu
%   Contributor:		Name, login@purdue [repeat for each]
%   Our contributor(s) helped us:	
%     [ ] understand the assignment expectations without
%         telling us how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping us plan our solution.
%     [ ] think through the meaning of a specific error or
%         bug present in our code without looking at our code.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initializes initial values for variables
%% INITIALIZATION
% Temperature near the heat source
Tb = 373; %degrees K
% Ambient Air temp
air_temp = 298; %degrees K
% Heat transfer coefficient
h = 100; 
% Loop/vector position update counter
counter = 1;
% Initial minimum length of a rod
min_length = 0;
% Temp of rod at given length from heat source (starts at heat source)
T = Tb;

%% Performs calculations for the dimensions of a rod, determines if the inputs are valid, and executes a loop that performs calculations and creates final vector.
%% CALCULATIONS
% Numbe of elements the final vector will have
num_vec = max_diam / 0.5;
% Vector of zeros created using the dimension found above
min_lengthVec = zeros(1,num_vec);
% Vector updated in the loop with each diameter
diameter_vec = zeros(1,num_vec);

% If/else to determine if inputs are valid
if(min_diam < 0 || conduct < 0 || max_diam < 0)
    min_length = -1;
    fprintf("One of the inputs is invalid, all must be >= 0");
else
    while  (min_diam < max_diam)        
        radius = min_diam / 2;
        circum = 2 * pi * radius;
        area = pi * radius.^2;
        m = sqrt((h * circum) / (conduct * area));
        
        min_length = (log((T + air_temp) / (Tb - air_temp))) / m; 
        T = air_temp + (Tb - air_temp) * exp(-m * min_length);       
        min_lengthVec(counter) = min_length;
        diameter_vec(counter) = min_diam;
        
        min_diam = min_diam + 0.5;
        counter = counter + 1;
    end
end

% Prints the rod diameters and associated lengths
fprintf("The rod diameters and minimum rod lengths are shown in the array below. The diameters are above their associated lengths\n");
final_vec = [diameter_vec;min_lengthVec]

%% Shows the outputs in the command window from tests
%% COMMAND WINDOW OUTPUT
% PS09_fin_revisit_jchapla_rbehl(1,10,205)
% The rod diameters and minimum rod lengths are shown in the array below. The diameters are above their associated lengths
% 
% final_vec =
% 
%   Columns 1 through 13
% 
%     1.0000    1.5000    2.0000    2.5000    3.0000    3.5000    4.0000    4.5000    5.0000    5.5000    6.0000    6.5000    7.0000
%     1.5687    1.8296    2.1142    2.3637    2.5893    2.7968    2.9899    3.1712    3.3428    3.5059    3.6618    3.8114    3.9552
% 
%   Columns 14 through 20
% 
%     7.5000    8.0000    8.5000    9.0000    9.5000         0         0
%     4.0941    4.2283    4.3585    4.4848    4.6077         0         0

%% Calls Academic Integrity Statement
%% ACADEMIC INTEGRITY STATEMENT
PS07_integrity_rbehl(["John Chapla","Ranjan Behl"]);
