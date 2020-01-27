%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%Finds the total weight of all 12 cables from both sides and then finding
%the toal cost of all 24 cables.
%
% Assigment Information
%   Assignment:       	PS 06, Problem 3
%   Team ID:			008-14
%   Team Member:		John Chapla, jchapla@purdue.edu
%   Team Member:		Matthew Wen, wen101@purdue.edu
%   Team Member:		Donghyun Lee, lee3034@purdue.edu
%   Team Member:		Ranjan Behl, rbehl@purdue.edu
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



%% ____________________
%% CALCULATIONS
%a
[total_lengtheast, total_weighteast, total_costeast] = PS06_cableUDF_008_14([50 54 58 62 66 70],[30 58 84 108 130 150],[45 45 45 45 45 36]); % Finding the total length, total weight and total cost of the 12 cables on the east side
totalweighteast = total_weighteast * 2; %finding the total weight of the east side cables(both north and south view)
%b
[total_lengthwest, total_weightwest, total_costwest] = PS06_cableUDF_008_14([50 54 58 62 66 70],[18 34 48 60 70 78],[45 45 45 45 45 36]);% Finding the total length, total weight and total cost of the 12 cables on the west side
totalweightwest = total_weightwest * 2;  %finding the total weight of the west side cables(both north and south view)
combinedlength = total_lengtheast + total_lengthwest; % finding the total length of all 24 cables
totalestimatedcost = total_costeast + total_costwest; % finding the total estimated cost of all 24 cables

%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
fprintf("\nThe total weight of all 12 cables on the east side of the bridge is equal to %f k/m" ,totalweighteast);
fprintf("\nThe total weight of all 12 cables on the west side of the bridge is equal to %f k/m",totalweightwest);
fprintf("\nThe Combined length of all 24 cables  is %f m and the total estimated cost for all 24 cables is $%f",combinedlength,totalestimatedcost);

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have we provided
% access to our code to another. The script we are submitting
% is our own original work.



