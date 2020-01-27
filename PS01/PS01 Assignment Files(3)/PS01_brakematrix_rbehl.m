%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Experimental data for a mechanical brake design is given, using this
% given data one is expected to debug the preset martix operations and
% comment on thier function. Furthermore the second part of the assignment
% is to add the data from a fifth test onto the given brake data.
%
% Assigment Information
%   Assignment:     PS 01, Problem 3
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
brakeData = [0.59,0.62,0.6,0.6;
    0.97,0.91,0.98,0.95;
    1.25,1.15,1.1,1.12];

%% ____________________
%% MATRIX MANIPULATIONS

% Comment each of these matrix manipulation commands with a concise 
% explanation of what the command performs. If the command produces an
% error, explain the error and then comment the whole line

A = brakeData(2,3) % The value in the second row and third column is assigned to the variable A
%B = brakeData(5,4)  The error produced in Index out of bounds which means that the row value of 5 that the variable B is being assinged to doesnt exist in the martix brakeData

C = brakeData(1,:) % The values in the first row and all of the columns in assigned to the row vector C
D = brakeData(2,:) % The values in the second row and all of the columns in assigned to the row vector D 
E = brakeData(:,3) % The values in the third column and all of the rows is assigned to the column vector E

F = brakeData(1:2) % The first values in rows 1 to 2 are assigned to the row vector F
G = brakeData(2:3) % The first values in rows 2 to 3 are assigned to the row vector G
H = brakeData(1:2,2:3) % The value in the first row and second column 

J = [D C] % The Row vector D and the column vector C are assigned to the row vector J
K = [D;C] % The Row vector D and the column vector C are assigned to the row vector K
%L = [D E]  The error of horzcat means that the two arrays D and E being
%assigned to L are not of the same size, thus they cant be assigned to L.

M = sort(D) % The row vector D is sorted by order 

brakeData(2,3) = 0.96 %the data value in the second row and third column is replacec by 0.96
%% ____________________
%% CALCULATIONS
Test2_stopingtime = brakeData(1:3,2); % all of the stopping time values in Test 2 are assigned to this variable
Test4_condition3_stopingtime = brakeData(3,1:4); % assigning all of stopping times of conition 3 in Test 4 
Test4_condition3_stopingtime(1,1)=0.61; % the first condition value in Test 4 is being replaced with a value of 0.61
Test5 = [0.58,0.93,1.2]'; % creating a column vector for the 5th test info
brakeDataUpdated = [brakeData,Test5]; % adding the fifth test onto the brakeData martix


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The project I am submitting
% is my own original work.
