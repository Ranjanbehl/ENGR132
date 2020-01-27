function [total_length, total_weight, total_cost] = PS06_cableUDF_008_14(heights, distances, num_strands)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function calculates the total length, weight, and cost of the wires
% given input heights, distances, and number of strands.
%
% Function Call
% function [total_length, total_weight, total_cost] = PS06_cableUDF_008_14(heights, distances, num_strands)
%
% Input Arguments
% 1. heights   /This input is for the height from the bridge deck to the
% tower anchorage
% 2. distances  /This input is for the distance from the tower base to deck
% anchorage
% 3. num_strands  /This input is the number of strands for each individual
% desired wire
%
% Output Arguments
% 1.total_length  /calculated total required wire length
% 2.total_weight  /calculated total weight of the wires
% 3.total_cost    /calculated total cost of the wires
%
% Assignment Information
%   Assignment:       	PS 06, Problem 3
%   Team ID:			008-14
%   Team Member:		John Chapla, jchapla@purdue.edu
%   Team Member:		Matthew Wen, wen101@purdue.edu
%   Team Member:		Donghyun Lee, lee3034@purdue.edu
%   Team Member:		Ranjan Behl, rbehl@purdue.edu
%  	Contributor: 		Name, login@purdue [repeat for each]
%   My contributor(s) helped me:	
%     [ ] understand the assignment expectations without
%         telling me how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping me plan my solution.
%     [ ] think through the meaning of a specific error or
%         bug present in my code without looking at my code.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% This section sets two constants to be used for calculations
%% INITIALIZATION
% This sets a value for the weight of a single strand per meter
cable_weight = 1.1; %k/m

% This sets the cost of a kilo of strand as $25
cost_kilo = 25; %$

%% This section calculates the total length, total weight, and total cost of the input cords
%% CALCULATIONS
% Calculates the total length
total_length = sum(sqrt(heights .^ 2 + distances .^ 2));

% Calculates the total weight
total_weight = sum((num_strands .* cable_weight) * total_length);

% Calculates the total cost
total_cost = total_weight * cost_kilo;

% Prints the results from the calculations
%fprintf("Total Length = %0.4f meters, Total Weight = %0.4f kilograms,
%Total Cost = $%0.4f \n",total_length, total_weight, total_cost); This
%printf statement is a comment due to part 7 of the problem

%% This sections shows what is printed to the command window
%% COMMAND WINDOW OUTPUT
% Calling function
%function [total_length, total_weight, total_cost] = PS06_cableUDF_008_14(heights, distances, num_strands)

% Results
% x = PS06_cableUDF_008_14([50 54 58 62 66 70],[30 58 84 108 130 150],[45 45 45 45 45 36])
% Total Length = 675.4893 meters, Total Weight = 193932.9841 kilograms, Total Cost = $4848324.6025 
% 
% x =
% 
%   675.4893

%% This section lays out the academic integrity statement
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have we provided
% access to our code to another. The function we are submitting
% is our own original work.


