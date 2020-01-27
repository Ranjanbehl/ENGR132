function [y_low, y_high, time_constant, time_start] = Project_M3Algorithm008_14(time, chocolate_temp)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function finds Yh, Yl, Ts and then uses those values to find Tau for
% a given set of data
%
% Function Call
% function [y_low, y_high, time_constant, time_start] = Project_M3Algorithm_008_14(time, chocolate_temp)
%
% Input Argument
% time: time corresponding to temperature (sec)
% chocolate_temp: temperature of chocolate (deg C)
% 
% Output Arguments
% y_low: initial temperature (deg C)
% y_high: final (deg C)
% time_constant: The Time constant of graph (sec)
% time_start: Time where user starts recording (sec)
% 
% Assignment Information
%   Assignment:			M 03, Algorithm
%   Team ID:			008-14
%   Paired Partner:		Matthew Wen, wen101@purdue.edu
%   Paired Partner:		Dong Lee, rbehl@purdue.edu
%   Paired Partner:		Ranjan Behl, rbehl@purdue.edu
%   Paired Partner:		Conner Chapla, jchapla@purdue.edu
%   Contributor:		Name, login@purdue [repeat for each]
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
num_data = length(time); % intialize the number of data points 
slope = []; % allocate the size of number of data points 
p_tao = [];  % intialize vector that stores p_tao values
percent_tao = 0.632; % the percent from yL to yH to determine y(time constant + time start)

p_low = []; % potential low temperatures for a cooling curve
p_high = []; % potential high temperatures for a heating curve
idx = 1; % index for placing potential tao, yl, and yh values
p_sse = []; % vector that stores the sse value for each model attempted
%% ____________________
%% CALCULATIONS 
start_slope_val = 0.5; 
time_idx = num_data; 
while start_slope_val >= 0.1
    time_used = time(1:time_idx); % find x values or time from start to data point time index (sec)
    temp_used = chocolate_temp(1:time_idx);  % find y values of temperature from start to data point index (deg C)
    time_used_squared = time_used .^ 2; % use the time used and square the values (sec ^ 2)
    time_temp_used = time_used .* temp_used; % multiply the x and the y coordinates (deg C * sec)
    numerator = mean(time_used) * mean(temp_used) - mean(time_temp_used); % finding the numerator for the slope
    denominator = mean(time_used) .^ 2 - mean(time_used_squared); % finding the denominator for the slope
    start_slope_val = abs(numerator / denominator); % calculating the absolute value of the slope (deg C / sec)
    slope = [slope, start_slope_val]; % storing slope inside vector
    time_idx = time_idx - 1; % increment time idx down by one index
end
start_time_idx = time_idx - 1; % spot all the time where slope of best fit equals to 0
determined_time_start = round(time(start_time_idx), 1); % set last index as start time

curve_time = time(start_time_idx:end); % determine part of curve where it extends from ts to the end for time (sec)
curve_temp = chocolate_temp(start_time_idx:end);  % determine part of curve where it extends from ts to end for temp (deg C)
minimized_idx = 1:round(length(curve_temp) / 10):length(curve_temp); % minimize calculation by having 100 data points
minimize_time = curve_time(minimized_idx); % minimize the time used for calculations (sec)
minimize_chocolate_temp = curve_temp(minimized_idx); % minimize the temp used for calculation (deg C)

if (chocolate_temp(1) > chocolate_temp(num_data)) % check to see if it is a cool curve
    determined_y_high = round(mean(chocolate_temp(1:start_time_idx)), 1); % get the mean from start to ts, set it equal to y_high
    p_y_low = round(min(chocolate_temp), 2); % starting point for getting the y low of the graph
    while p_y_low < mean(chocolate_temp) % run this until potential temperature y is halfway through the data
        y_tao = (1 - percent_tao) * (determined_y_high - p_y_low) + p_y_low;  % find the y tao value for the cooling curve
        diff_y_tao = abs(chocolate_temp - y_tao);  % find the difference between discovered tao value and actual data set
        list_tao_value = time(min(diff_y_tao) == diff_y_tao);  % find the index of the smallest difference, then get time at index
        tao_value = list_tao_value(1) - determined_time_start;  % set it as the tao value to find model
        
        predicted_results = p_y_low + (determined_y_high - p_y_low) * exp(-((minimize_time - determined_time_start)/ tao_value)); % modeling predicted values (deg C)
        sse_value = mean(abs(predicted_results - minimize_chocolate_temp) .^ 2); % calculate the SSE mod value for this model
        
        p_tao(idx) = tao_value; % storing the tao value at this instance of model into a vector
        p_low(idx) = p_y_low; % storing the potential yL value value at this instance of model into a vector
        p_sse(idx) = sse_value;  % storing the SSE value inside a vector. It will be used for comparison with other models in vectors
        
        idx = idx + 1; % increment the index of where sse, p_tao
        p_y_low = p_y_low + 0.01; % increment value of potential y low value (deg C)
    end 
    best_model_idx = min(p_sse) == p_sse; % finding the best fit model based off of SSE value
    determined_y_low = round(p_low(best_model_idx), 2); % determine the best y low value based off of best fit
    determined_time_constant = round(p_tao(best_model_idx), 2); % determine the time constant based off of best fit

else  % if not a cool curve, then do this operation for a heating curve
    determined_y_low = round(mean(chocolate_temp(1:start_time_idx)), 1); % setting y low because it is a heating curve
    p_y_high = round(max(chocolate_temp), 2); % start of the potential high value aka yH (deg C)
    while p_y_high > mean(minimize_chocolate_temp) % run this until potential temperature y is halfway through the data
        y_tao = percent_tao * (p_y_high - determined_y_low) + determined_y_low; % determine the y(tao + t_start) value 
        diff_y_tao = abs(chocolate_temp - y_tao); % find the difference from each point from the y(tao + t_start) value. 
        list_tao_value = time(min(diff_y_tao) == diff_y_tao); % find the index with the smallest difference
        tao_value = round(list_tao_value(1)- determined_time_start, 2); % if there is more than 1, then set to the first value
        
        predicted_results = determined_y_low + (p_y_high - determined_y_low) *(1 - exp(-(minimize_time - determined_time_start)/ tao_value)); % modeling predicted values (deg C) 
        sse_value = mean(abs(predicted_results - minimize_chocolate_temp) .^ 2); % calculate the SSE mod value for this model
        
        p_tao(idx) = tao_value; % storing the tao value at this instance of model into a vector
        p_high(idx) = p_y_high; % storing the potential yH value value at this instance of model into a vector
        p_sse(idx) = sse_value;  % storing the SSE value inside a vector. It will be used for comparison with other models in vectors
        
        idx = idx + 1;  % increment the index of where is sse, p_tao
        p_y_high = p_y_high - 0.01;  % decrement the p_y_high value. 0.01 is used for accuracy. 
    end

    best_model_idx = min(p_sse) == p_sse; % finding the best fit model based off of SSE value
    determined_y_high = round(p_high(best_model_idx), 2); % determine the best y high value based off of best fit
    determined_time_constant = p_tao(best_model_idx); % determine the time constant based off of best fit
end

y_low = determined_y_low; % return y low temperature 
y_high = determined_y_high; % return y high temperature 
time_constant = determined_time_constant; % return the time constant
time_start = determined_time_start; % return the start time
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have we provided
% access to our code to another. The function we are submitting
% is our own original work.
end