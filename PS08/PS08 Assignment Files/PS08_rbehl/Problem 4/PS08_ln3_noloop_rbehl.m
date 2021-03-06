function [estimate,difference] = PS08_ln3_noloop_rbehl(n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%The program compute the vale of ln(3) for a given number of terms and
% without using a loop and also checks for invalid inputs
% Function Call
%[estimate,difference] = PS08_ln3_noloop_rbehl(n)
%
% Input Arguments
%n is the number of terms and is a scalar output
%
% Output Arguments
% estimate is the estimated value of ln(3)
% difference is the abs difference betwee nthe estimate and the value of
% log(3)

% Assignment Information
%   Assignment:       	PS 08, Problem 04
%   Author:             Ranjan Behl, rbehl@purdue.edu
%   Team ID:            ###-##      
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
estimate = -99; % the preset value of estimate of ln(3)
difference = -99; % the preset value of the difference between ln(3) and log(3)

%% ____________________
%% CALCULATIONS
if n <= 0 % checks to see if n is invalid
    fprintf("\n ERROR: invalid n");
    fprintf("\n The apporoximation for ln3 is %f and \n the difference between apporoximation and MATLAB log(3) is %f",estimate,difference);
elseif isscalar(n) == 0 % checking to see if n is a valid scalar
    fprintf("\n ERROR: invalid n");
    fprintf("\n The apporoximation for ln3 is %f and \n the difference between apporoximation and MATLAB log(3) is %f",estimate,difference);
elseif floor(n) == ~n % checks if n is a integer value
    fprintf("\n ERROR: invalid n");
    fprintf("\n The apporoximation for ln3 is %f and \n the difference between apporoximation and MATLAB log(3) is %f",estimate,difference);
else
    k = (0:(n-1)); % vector that holds all the possible n values
    estimate = (1./4.^k).*(1./((2.*k)+1)); % calculates the formula through the vector k
    sumestimate = sum(estimate); %summation
    difference = abs(log(3) - sumestimate); % finding the abs difference 
    fprintf("\n The apporoximation for ln3 is %f and \n the difference between apporoximation and MATLAB log(3) is %f",sumestimate,difference);
end
%% ____________________
%% COMMAND WINDOW OUTPUT
% Test case n = 8
%{
[estimate,difference] = PS08_ln3_noloop_rbehl(8)

 The apporoximation for ln3 is 1.098611 and 
 the difference between apporoximation and MATLAB log(3) is 0.000001

ans =

    1.0000    0.0833    0.0125    0.0022    0.0004    0.0001    0.0000    0.0000
%}
% Test case n = 12
%{
[estimate,difference] = PS08_ln3_noloop_rbehl(12)

 The apporoximation for ln3 is 1.098612 and 
 the difference between apporoximation and MATLAB log(3) is 0.000000

estimate =

    1.0000    0.0833    0.0125    0.0022    0.0004    0.0001    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000


difference =

   3.1038e-09
%}
% Test case n = 24
%{
 [estimate,difference] = PS08_ln3_noloop_rbehl(24)

 The apporoximation for ln3 is 1.098612 and 
 the difference between apporoximation and MATLAB log(3) is 0.000000

estimate =

  Columns 1 through 16

    1.0000    0.0833    0.0125    0.0022    0.0004    0.0001    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 17 through 24

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000


difference =

   6.6613e-16
%}
% Test case n = -0.25
%{
[estimate,difference] = PS08_ln3_noloop_rbehl(-0.25)

 ERROR: invalid n
 The apporoximation for ln3 is -99.000000 and 
 the difference between apporoximation and MATLAB log(3) is -99.000000

estimate =

   -99


difference =

   -99
%}
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT

PS07_integrity_rbehl(["Ranjan Behl"]);
