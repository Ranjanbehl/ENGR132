function [estimate,difference] = PS08_ln3_approx_rbehl_jchapla(n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% The program compute the vale of ln(3) for a given number of terms and
% also checks for invalid inputs
%
% Function Call
%[estimate,difference] = PS08_ln3_approx_rbehl_jchapla(n)%
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
%   Paired Partner:  John Chapla, jchapla@purdue.edu
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
if isscalar(n) % checking to see if n is valid
    if floor(n) == n % checks if n is a integer
       if n > 0 % sees if in is greater than zero and this postive
           estimate = 0;
             while i <= n-1  % runs until the index is greater than n -1
                  estimate = estimate + ((1 / 4^i) * (1 / (2 * i +1))); % calcuating ln(3)
                  i = i + 1;
             end
                    difference = abs(log(3) - estimate); % finding the abs difference between ln(3) and log(3)
      else n < 0
      fprintf("\n invalid n, n must be a postive integer");
      end
    else
        fprintf("\n invalid n, n must be a integer");
    end
else
 fprintf("\n invalid n, n must be a scalar value");   
end
fprintf("\n The apporoximation for ln3 is %f and \n the difference between apporoximation and MATLAB log(3) is %f",estimate,difference);
%% ____________________
%% COMMAND WINDOW OUTPUT
%Test case n = 6
%{
[estimate,difference] = PS08_ln3_approx_rbehl_jchapla(6)

 The apporoximation for ln3 is 1.098588 and 
 the difference between apporoximation and MATLAB log(3) is 0.000024
estimate =

    1.0986


difference =

   2.4006e-05
%}
% Test case n = -1
%{
 invalid n, n must be a postive integer
 The apporoximation for ln3 is -99.000000 and 
 the difference between apporoximation and MATLAB log(3) is -99.000000
estimate =

   -99


difference =

   -99
%}
% Test case n = 0
%{

 invalid n, n must be a postive integer
 The apporoximation for ln3 is -99.000000 and 
 the difference between apporoximation and MATLAB log(3) is -99.000000
estimate =

   -99


difference =

   -99
%}
% Test case n = [1;2]
%{

>[estimate,difference] = PS08_ln3_approx_rbehl_jchapla([1;2])

 invalid n, n must be a scalar value
 The apporoximation for ln3 is -99.000000 and 
 the difference between apporoximation and MATLAB log(3) is -99.000000
estimate =

   -99


difference =

   -99


%}
% Test case n = 5
%{
[estimate,difference] = PS08_ln3_approx_rbehl_jchapla(5)

 The apporoximation for ln3 is 1.098500 and 
 the difference between apporoximation and MATLAB log(3) is 0.000113
estimate =

    1.0985


difference =

   1.1278e-04
%}
% Test case n = 10
%{
[estimate,difference] = PS08_ln3_approx_rbehl_jchapla(10)

 The apporoximation for ln3 is 1.098612 and 
 the difference between apporoximation and MATLAB log(3) is 0.000000
estimate =

    1.0986


difference =

   5.8883e-08
%}
% Test case n = 20
%{
[estimate,difference] = PS08_ln3_approx_rbehl_jchapla(20)

 The apporoximation for ln3 is 1.098612 and 
 the difference between apporoximation and MATLAB log(3) is 0.000000
estimate =

    1.0986


difference =

   2.9754e-14
%}
%% ____________________
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
PS07_integrity_rbehl(["Ranjan Behl","John Chapla"]);
