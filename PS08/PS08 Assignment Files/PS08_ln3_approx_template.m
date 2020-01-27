function [estimate,difference] = PS08_ln3_approx_template(n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% The program compute the vale of ln(3) for a given number of terms and
% also checks for invalid inputs
%
% Function Call
%[estimate,difference] = PS08_ln3_approx_template(n)%
% Input Arguments
% n is the number of terms and is a scalar output
%
% Output Arguments
% estimate is the estimated value of ln(3)
% difference is the abs difference betwee nthe estimate and the value of
% log(3)
%
% Assignment Information
%   Assignment:  	    PS 08, Problem 3
%   Team ID:            008-14
%   Paired Partner:  Ranjan Behl, rbehl@purdue.edu
%   Paired Partner:  Name, login@purdue.edu
%   Contributor:        Name, login@purdue [repeat for each]
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
estimate = -99; % the preset value of estimate of ln(3)
difference = -99; % the preset value of the difference between ln(3) and log(3)
i = 0; % the index counter
%% ____________________
%% CALCULATIONS
if (n < 0) % checking to see if n is valid
    fprintf("\ninvalid n"); 
    fprintf("\n The apporoximation for ln3 is %f and \n the difference between apporoximation and MATLAB log(3) is %f",estimate,difference);
end
while i <= n-1 
    estimate = ((1 / 4^n) * (1 / 2 * n +1)); % calcuating ln(3)
    i = i + 1;
    difference = abs(estimate - log(3)); % finding the abs difference between ln(3) and log(3)
end
    fprintf("\n The apporoximation for ln3 is %f and \n the difference between apporoximation and MATLAB log(3) is %f",estimate,difference);
%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT

PS07_integrity_rbehl();
