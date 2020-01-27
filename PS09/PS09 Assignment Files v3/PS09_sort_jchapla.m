function[output_array] = PS09_sort_jchapla(input_array)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%
%
% Function Call
% function[output_array] = PS09_sort_jchapla(input_array)
%
% Input Arguments
% 1. input_array //user input array of numbers
%
% Output Arguments
% 1. output_array //output array of sorted numbers
%
% Assignment Information
%   Assignment:       	PS 09, Problem 3
%   Author:             John Chapla, jchapla@purdue.edu
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

%% Initializes row and column indicies
%% INITIALIZATION
% Row indicies
row_index = 1;
% Column Indicies
col_index = 1;


%% Performs vector minipulations inside of a for loop and a nested for loop
%% CALCULATIONS
% Determines the size of the user input array
size_array = size(input_array);
% Preallocates an array of zeros the same size as the input array
output_array = zeros(size_array(1,1),size_array(1,2));

% For loop an nested for loop that complete the vector minipulations
for (row_index = 1:size_array(1,1))
        for (col_index = 1:size_array(1,2))
        min_val = min(input_array(:));
        num_min = find(input_array == min_val);
        num_min = numel(num_min);
        output_array(row_index,col_index) = min_val;
        if (num_min > 1)
            vector = zeros(1,num_min - 1);
            vector(:,:) = min_val;
            vector = transpose(vector);
            large_vec = input_array(input_array > min_val);
            input_array = vertcat(vector,large_vec);
        else
            largerVal_vec = input_array(input_array > min_val);
            input_array = largerVal_vec;
        end
        end
end

%% Outputs shown in the command window
%% COMMAND WINDOW OUTPUT
% Test case 1
% PS09_sort_jchapla([100,-72,14,30,27])
% I am submitting code that is my own original work. I have not used source code, either modified or unmodified, obtained from any unauthorized source.  Neither have I provided access to my code to any peer or unauthorized source. Signed,
%  <John Chapla>
% ans =
% 
%    -72    14    27    30   100

% Test case 2
% PS09_sort_jchapla([2,0.5,-5,3,6;-5,4,-3,4,6;8,2.5,1,-2,-1])
% I am submitting code that is my own original work. I have not used source code, either modified or unmodified, obtained from any unauthorized source.  Neither have I provided access to my code to any peer or unauthorized source. Signed,
%  <John Chapla>
% ans =
% 
%    -5.0000   -5.0000   -3.0000   -2.0000   -1.0000
%     0.5000    1.0000    2.0000    2.5000    3.0000
%     4.0000    4.0000    6.0000    6.0000    8.0000

%% Calls academic integrity statement
%% ACADEMIC INTEGRITY STATEMENT
PS07_integrity_jchapla(["John Chapla"]);
        
        