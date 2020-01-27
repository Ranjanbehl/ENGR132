%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%This program was created to use the given martixes and separates specific 
%points into row vectors, and also concatenates theses row vectors. Then
%the final part of the problem replaces martix elements with user input.
% Assigment Information
%   Assignment:			PS 03, Problem 1
%   Author:				Ranjan Behl, rbehl@purdue.edu
%   Team ID:			008-14
%   Paired Partner:		John Chapla, jchapla@purdue.edu
%   Contributor:		Name, login@purdue [repeat for each]
%   Our contributor(s) helped us:	
%     [ ] understand the assignment expectations without
%         telling us how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping us plan our solution.
%     [ ] think through the meaning of a specific error or
%         bug present in our code without looking at our code.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% ____________________
%% INITIALIZATION
A = zeros(4); % creates the 4 by 4 martix of zeros
vals = [1,3,2,4;5:8;9:12;13,15,14,16];% creates the martix for part b of the problem
%% ____________________
%% COPY & CONCATENATION
%a
M = vals(2:3,2:3);% the center 2 by 2 martix that is inside vals
%b
C = vals(1,2:3);% taking the 3 2 from the first row of vals and labeling it as a row vector c
%c
D = vals(4,2:3);% taking the 15 14 
%d
E = [vals(1,1),D,vals(1,4)];% creating a row vector that concatenates D between the first and fourth elements
%e
F = [vals(4,1),C,vals(4,4)];% creating a row vector that concatenates C between the first and fourth elements
%% ____________________
%% REPLACE MATRIX ELEMENTS
%a
A(2:3, 2:3) = M;% replacing the center 2 x 2 martix of A with M
A(1,:) = E;% replacing the first row of A with E
A(4,:) = F;% replacing the fourth rwo of A with F
%b
A(2,1) = vals(3,4);% replaces the 0 directly below the 1 in martix A with the 12 from matrix vals
A(3,1) = vals(2,4);% replaces the 0 above the 13 in martix A with the 8 from martix vals
A(2,4) = vals(3,1);% replaces the 0 directly below the 4 in martix A with the 9 from martix vals
A(3,4) = vals(2,1);% replaces the 0 directly above the 16 in martix A with the 5 from matix vals
%% ____________________
%% FINAL MATRIX
%a
X = sum(A);% X is vector that contains the sums of the columns of A
%b
G = [A;X];% Concatenates vector X to the bottom of martix A to create a new martix G
%c
Y = sum(G);% Creates a vector Y that contains the sums of the rows of G
%d
Ynew = Y.';% tranposes the Y vector into a column vector
Ynew(5,1) = 0; % creating a zero place holder for Ynew so it can be concatenated with martix G
H = [G Ynew]; % concatenates vector Y(in this case its Ynew) to the right of martix G to create a new martix H
%e
H(25) = sum(diag(H)) % replaces the lower right corner value of H with the sum of the first four values on the diagonal from the upper left corner and moving toward the lower right corner
%% ____________________
%% FORMATTED TEXT DISPLAY 
fprintf("\nAfter doing step 8.e, the value in the center of H is %d",H(13));
fprintf("\nAfter doing step 8.e, the value in the upper left of H is %d,and the value in the upper right of H is %d.",H(1),H(21));
fprintf("\nAfter doing step 8.e, the value in the lower left of H is %d,and the value in lower right of H is %d.",H(5),H(25));
 


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have we provided
% access to our code to another. The script we are submitting
% is our own original work.
