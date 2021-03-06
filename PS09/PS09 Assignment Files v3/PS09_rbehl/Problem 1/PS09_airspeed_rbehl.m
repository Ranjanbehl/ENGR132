function [dynamicpressure,soundspeed] = PS09_airspeed_rbehl()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% The program uses the given pcode and Bernouli's equation for compressible
% flow to find the dynamic pressures and speed of speeds within in the
% given range of altitudes of 20000 - 450000 ft at a constant mach number
% of 0.85
%
% Function Call
%[dynamicpressure,soundspeed] = PS09_airspeed_rbehl()
%
% Input Arguments
% There are no input arugments
%
% Output Arguments
% 1) dynamicpressure = dynamic pressure (kPa) [vector] 
% 2) soundspeed = speed of sound (m/s) [vector] 
% Assignment Information
%   Assignment:       	PS 09, Problem 01
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
%altitude_ft = [20000,28000,32000,36000,45000]; % The vector with the five test vector values
altitude_ft = 20000:1000:45000; % A vector containing the altitude values that are tested
altitude_km = altitude_ft .* 0.0003048; % converting the altitude to km
num = numel(altitude_ft); % finds the number of elments in the altitude_ft vector
temp = [1,num]; % the temperature vector
pressure = [1,]; % the  pressure vector
tempTest = [1,172]; % the temperature vector
pressureTest = [1,172]; % the  pressure vector
i = 1; % the counter variable
count =1; % the counter variable for the second loop
mach = 0.85; % The mach speed constant
R = 287.84; % the specific gas constant
specificHeat = 1.4; % the specfic heat ratio
const1 = specificHeat / (specificHeat - 1); % the exponent value
const2 = (specificHeat -1 ) / (2 * specificHeat); % the constant in the main equation

%% ____________________
%% CALCULATIONS

%FINDING ATM_PRESSURE AND ATM_TEMPERATURE FOR EVERY 0.5 KM
while i <= 172
      altitude = 0:0.5:85.5; % creating the testing altitude vector
      altitudeval = altitude(i);
      [atm_pressure, atm_temperature] = USAtmos_1976(altitudeval);
      tempTest(i) = atm_temperature;
      pressureTest(i) = atm_pressure;
      i = i + 1;
       
end

%FINDING ATM_PRESSURE AND ATM_TEMPERATURE MODEL 
while count <= num
    altitudenew = altitude_km(count);
    [atm_pressure, atm_temperature] = USAtmos_1976(altitudenew);
    temp(count) = atm_temperature;
    pressure(count) = atm_pressure;
    count = count + 1;
end
%PREDICTING DYANAMIC PRESSURE AND SPEED OF SOUND
soundspeed = sqrt(specificHeat * R .*temp);
root = (mach .* soundspeed).^2;
dynamicpressure = pressure .* (1 + const2 .* root) .^(const1 - 1);
%% ____________________
%% DISPLAY

% Create a graph of altitude vs atomospheric pressure and a graph of
% altitude vs temperature
figure (1)
subplot(2,1,1)
scatter(tempTest,altitude);
title("Altitude vs Temperature");
ylabel("Altitude (km)");
xlabel("Temperature (K)");
grid on
hold on
subplot(2,1,2)
scatter(pressureTest,altitude);
title("Altitude vs Atomospheric Pressure");
ylabel("Altitude (km)");
xlabel("Atomospheric Pressure (kPa)");
grid on
hold off

%Create a graph of dynamic pressure vs altitude
figure (2)
scatter(dynamicpressure,altitude_km);
grid on
title("Dynamic Pressure vs Altitude")
ylabel("Altitude (km)");
xlabel("Dynamic Pressure (kPa)");

%Create a graph of speed of sound vs altitude
figure (3)
scatter(soundspeed,altitude_km);
grid on
title("Speed of Sound vs Altitude")
ylabel("Altitude (km)");
xlabel("Speed of Sound (m/s)");
%% ____________________
%% COMMAND WINDOW OUTPUT
% Test Cases
%{
[dynamicpressure,soundspeed] = PS09_airspeed_rbehl()

I am submitting code that is my own original work. I have not used 
source code, either modified or unmodified, obtained from any 
unauthorized source.  Neither have I provided access to 
my code to any peer or unauthorized source. Signed, 
 <Ranjan Behl>
dynamicpressure =
   1.0e+11 *
    5.0597    3.0350    2.3198    1.7560    1.1352
soundspeed =
  316.4649  306.2075  300.9477  295.5943  295.4738

%}

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT

PS07_integrity_rbehl("Ranjan Behl");
