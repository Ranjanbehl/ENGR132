%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Using the given data, I was asked to anyalze the volcanos under the all
% the different condications and answering all the questions such as 
% how many volcanoes are visible in the PoLAR Viewer images and what 
% is their average elevation
% Assigment Information
%   Assignment:     PS 02, Problem 2
%   Author:         Ranjan Behl, rbehl@purdue.edu
%   Team ID:        014
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
 volcanodata = csvread('Data_volcano_list.csv',1,3);% loading the given data into a data array called volcanodata
 elevation  = volcanodata(:,3);% the elevation data is turned into a column vector
 startoelevation = volcanodata(121:395,3);% the elevation data for only the startoelevation 
 
%% ____________________
%% CALCULATIONS
%Part A
volcanos_polar = find(volcanodata(:,1) >= 50);% finding volcanos who are visiable in the POLAR viewer images
numvolcanos_polar = numel(Volcanos_polar); % counting and finding the total number of volcanos that are visiable
averageelevation = mean(elevation(volcanos_polar)); % finding the average elevation for the volcanos that are visiable in the POLAR viewer images

%Part B
 stratovolcanoes_visible_VIIimages = find(volcanodata(121:395,3) > 2500 & volcanodata(121:395,1) <=0);% finding the stratovolcanoes that will show up using Vll
 numstratovolcanoes_visible_VIIimages = numel(stratovolcanoes_visible_VIIimages);% counting the number of stratovolcanoes that meet the pervious condications
 minelevation = min( startoelevation(stratovolcanoes_visible_VIIimages));% finding the  minimum elevation of the stratovolcanoes
 maxelevation = max( startoelevation(stratovolcanoes_visible_VIIimages));% finding the  maximum elevation of the stratovolcanoes
 
%Part C
stratovolcanoes_visible_ACP1 = find(volcanodata(121:395,1) >= -39.5 & volcanodata(121:395,1) <= 39.5);% finding the stratovolcanoes that will show up using  ACP-1 
numstratovolcanoes_visible_ACP1 = numel(stratovolcanoes_visible_ACP1); % counting the number of stratovolcanoes that meets the pervious condications
nonstratovolcanoes_visible_ACP1_1 = find(volcanodata(1:120,1) >= -39.5 & volcanodata(1:120,1) <= 39.5); % finding the nonstratovolcanoes that will show up using  ACP-1 
nonstratovolcanoes_visible_ACP1_2 = find(volcanodata(396:end,1) >= -39.5 & volcanodata(396:end,1) <= 39.5);% finding the stratovolcanoes that will show up using  ACP-1 
numnonstratovolcanoes_visible_ACP1 = numel(nonstratovolcanoes_visible_ACP1_1) + numel(nonstratovolcanoes_visible_ACP1_2);% counting the total number of nonstratovolcanoes that meets the pervious condications

%Part D
stratovolcanoes_visible_MASC_postive = find(volcanodata(121:395,2) >= 100 & volcanodata(121:395,2) < 145);% finding the stratovolcanoes that are visible for MASC for postive longitude
stratovolcanoes_visible_MASC_negative = find(volcanodata(121:395,2) <= -120 & volcanodata(121:395,2) > -140);% finding the stratovolcanoes that are visible for MASC for negative longitude
stratovolcanoes_visible_MASC = numel(stratovolcanoes_visible_MASC_postive) + numel(stratovolcanoes_visible_MASC_negative); %finding the total number of visiable stratovolcanoes for MASC
averageelevation_postive = mean(startoelevation(stratovolcanoes_visible_MASC_postive));% finding the average elevation for the postive longitude values
averageelevation_negative = mean(startoelevation(stratovolcanoes_visible_MASC_negative));% finding the average elevation for the negative longitude values
averageelevation_stratovolcanoes = mean(averageelevation_postive + averageelevation_negative)/2;% finding the overall average elevation for startovolcanoes
%% ____________________
%% FORMATTED TEXT DISPLAYS
fprintf('%d volcanoes are visible in the PoLAR Viewer images with a  average elevation of %.2f\n',numvolcanos_polar,averageelevation);
fprintf('%d  stratovolcanoes are visible in the  VII images, the minimum elevation is %d, and the maximum elevation is %d\n',numstratovolcanoes_visible_VIIimages,minelevation,maxelevation);
fprintf('%.d  stratovolcanoes and %f non-stratovolcanoes are visible in the  ACP-1 images\n',numstratovolcanoes_visible_ACP1,numnonstratovolcanoes_visible_ACP1);
fprintf('%d  stratovolcanoes are visible in the   MASC images with a average elevation of %.f\n',stratovolcanoes_visible_MASC,averageelevation_stratovolcanoes);

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The code I am submitting
% is my own original work.