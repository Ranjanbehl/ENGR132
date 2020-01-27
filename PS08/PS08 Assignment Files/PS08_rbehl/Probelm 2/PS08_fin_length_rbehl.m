function [minlength] = PS08_fin_length_rbehl(diameter,Tb,Tamb,k)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% The function takes in four user input for diameter, thermal conductivty
% constant, Temperature from source and the ambient air temperature to find
% the minimum length required to use the infinte fin model.
%
% Function Call
%[minlength] = PS08_fin_length_rbehl(diameter,T,Tb,k)
%
% Input Arguments
% diameter is the rod's diameter
% k is the metal's thermal conductivity
% Tb is the heart source temperature
% Tamb is the ambient air temperature
% Output Arguments
% minlength is the minimum length required to use the infinte fin model
%
% Assignment Information
%   Assignment:       	PS 08, Problem 02
%   Author:             Ranjan Behl, rbehl@purdue.edu
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

%% ____________________
%% INITIALIZATION
T = Tb; % setting the intital temperture
h = 100; % heat coeffiecent( W/ m^2K)
minlength = 0.01; % inital distance
m = sqrt(h * 2 * pi *(diameter / 2) / (k * pi *(diameter / 2)^2)); % the constant associated with the rod
%% ____________________
%% CALCULATIONS
% if else statements to check if the inputs are valid, and if they are
% vaild using the inputs the find the min length.
if (diameter < 0 || k < 0 || Tb < 0 || Tamb < 0) 
    fprintf("\nOne of the inputs is invalid");
    minlength = -1;
    fprintf("\nThe minimum length required to use the infinte fin model is %f",minlength);
else
    while round(T) > Tamb
   T = Tamb + (Tb - Tamb) * exp(-m * minlength);
   minlength = minlength + 0.01;  
    end
minlength = minlength * 100 - 1;
fprintf("\nThe minimum length required to use the infinte fin model is %0.0f",minlength);
end
%% ____________________
%% COMMAND WINDOW OUTPUT
% Copper, k = 400
%{
PS08_fin_length_rbehl(0.005,373,298,400)

The minimum length required to use the infinte fin model is 36
ans =

   36.0000
%}
% aluminium, k = 205
%{
PS08_fin_length_rbehl(0.005,373,298,205)

The minimum length required to use the infinte fin model is 26
ans =

   26.0000
%}
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT

PS07_integrity_rbehl("Ranjan Behl");


