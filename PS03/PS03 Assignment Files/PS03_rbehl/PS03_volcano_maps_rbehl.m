%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%This problem contuines off where PS02 left off with the volcanos,I was asked to anyalze the volcanos under the all
% the different condications and answering all the questions such as 
% how many volcanoes are visible in the PoLAR Viewer images. Then create a
% graph for each of the cases and then answer the questions based on the
% graphs.
%
% Assigment Information
%   Assignment:     PS 03, Problem 3
%   Author:         Ranjan Behl, rbehl@purdue.edu
%   Team ID:        008-14
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
data = csvread('Data_volcano_list.csv',1,3);% importing the given volcano data into a martix called data
latitude = data(:,1);% importing the lattiude volcano data into a column vector
longitude = data(:,2);% importing the longitude volcano data into a column vector
elevation = data(:,3);% importing the elevation volcano data into a column vector
%% ____________________
%% CALCULATIONS
%Part 3
%a
latitudeACP1 =  latitude(latitude <= 39.5 & latitude >= -39.5);% creating a vector of latitude that are visible in the ACP-1 images
longitudeACP1 = longitude(latitude <= 39.5 & latitude >= -39.5);% creating a vector of longitude that are visible in the ACP-1 images
%b
latitudeVll =  latitude(elevation > 2500 & latitude <=0.0);% creating a vector of latitude that are visible in the Vll images
longitudeVll = longitude(elevation > 2500 & latitude <=0.0);% creating a vector of longitude that are visible in the Vll images
%c
latitudeMASC_find =  find((longitude >=100.0 & longitude < 145.0)| (longitude > -140.0 & longitude <=-120.0)); % finds the index of the MASC values
latitudeMASC = latitude(latitudeMASC_find);% creating a vector of latitude that are visible in the MASC images
longitudeMASC = longitude(latitudeMASC_find);% creating a vector of longitude that are visible in the MASC images
%d
latitudePolar =  latitude(latitude >= 50.0);% creating a vector of latitude that are visible in the Polar viewer
longitudePolar = longitude(latitude >= 50.0);% creating a vector of longitude that are visible in the Polar viewer
%e
latitudeany =  latitude((latitude <= 39.5 & latitude >= -39.5) | (longitude >=100.0 & longitude < 145.0 & longitude > -140.0 & longitude <=-120.0) | (elevation > 2500) | (latitude <=0.0 & latitude >= 50.0));% creating a vector of latitude that are visible for all of the instruments
longitudeany = longitude((latitude <= 39.5 & latitude >= -39.5) | (longitude >=100.0 & longitude < 145.0 & longitude > -140.0 & longitude <=-120.0) | (elevation > 2500) | (latitude <=0.0 & latitude >= 50.0));% creating a vector of longitude that are visible for all of the instruments
%f
latitudenone = latitude(not(latitude <= 39.5 & latitude >= -39.5) | not(longitude >=100.0 & longitude < 145.0 & longitude > -140.0 & longitude <=-120.0) | not(elevation > 2500) | not(latitude <=0.0 & latitude >= 50.0));% creating a vector of latitude that are not visible for any of the instruments
longitudenone = longitude(not(latitude <= 39.5 & latitude >= -39.5) | not(longitude >=100.0 & longitude < 145.0 & longitude > -140.0 & longitude <=-120.0) | not(elevation > 2500) | not(latitude <=0.0 & latitude >= 50.0));% creating a vector of longitude that are not visible for any of the instruments

%% ____________________
%% FORMATTED FIGURES 
%Part 4
%a
figure(1)
plot(latitude,longitude,'og');% creates a plot that showcases all of the volcano locations
xlabel('latitude(dd)'); % labeling the x axis
ylabel('longitude(dd)');% labeling the y axis
title('All Volcano Locations');% labeling the title
%Part 5
%a
figure(2)
subplotA = subplot(2,2,1), plot(latitudeACP1,longitudeACP1,'vr'); %creating subplot A
grid on
xlabel('latitude(dd)'); % labeling the x axis
ylabel('longitude(dd)');% labeling the y axis
title('All Volcano Locations Visible to ACP-1');% labeling the title
%b
subplotB = subplot(2,2,2), plot(latitudeVll,longitudeVll,'^b'); %creating subplot B
grid on
xlabel('latitude(dd)'); % labeling the x axis
ylabel('longitude(dd)');% labeling the y axis
title('All Volcano Locations Visible to Vll');% labeling the title
%c
subplotC = subplot(2,2,3), plot(latitudeMASC,longitudeMASC,'xc');%creating subplot c
grid on
xlabel('latitude(dd)');% labeling the x axis
ylabel('longitude(dd)');% labeling the y axis
title('All Volcano Locations Visible to MASC');% labeling the title
%d
subplotD = subplot(2,2,4), plot(latitudePolar,longitudePolar,'.k');%creating subplot d
grid on
xlabel('latitude(dd)');%c
ylabel('longitude(dd)');% labeling the y axis
title('All Volcano Locations Visible to Polar');% labeling the title
%Part 6
figure(3)
Visiblevolcanos = plot(latitudeany,longitudeany,'sk');% creating a plot that showcases the location of all of the volcanos that are visible 
hold on
NonVisiblevolcanos = plot(latitudenone,longitudenone,'dm');% creating a plot that showcases the location of all of the volcanos that are not visible 
legend("All Visible Volcanos","All Non Visible Volcanos");% creating a legend
legend('location','southoutside');% changing the legend location so it doesnt cover up the graph
title('Volcanos Images Visible to any Instrument vs Volcanos that are not in Range');% creating a title
xlabel('latitude(dd)');% labeling the x axis
ylabel('longitude(dd)');% labeling the y axis

%% ____________________
%% ANALYSIS 

%% -- Q1
% Based on figure 3 it can be said that there were more volcanos that the
% four instruments weren't able to capture images of.


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The script I am submitting
% is my own original work.

