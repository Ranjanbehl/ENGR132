function[] = PS07_academic_integrity_rbehl(string_array)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%Takes the user input and checks to see if its a string, if it is a string
%then the string is run through the if statements until a match is found or
%a error message is displayed.
%
% Function Call
% PS07_academic_integrity_rbehl(string_array)
%
% Input Arguments
% string_array is the variable for the user inputed string
%
% Output Arguments
% There are no outputs arugments
%
% Assignment Information
%   Assignment:       	PS 07, Problem 2
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



%% ____________________
%% SELECTION STRUCTURE
if isstring(string_array) == 0
    fprintf("\nWarning:The input is not a string\n");
elseif length(string_array) == 1
    fprintf("\nI am submitting code that is my own original work. I have not used \nsource code, either modified or unmodified, obtained from any \nunauthorized source.  Neither have I provided access to \nmy code to any peer or unauthorized source. Signed, \n <%s>\n",string_array(1)); 
elseif length(string_array) == 2
    fprintf("\nWe are submitting code that is our own original work. We have not used \nsource code, either modified or unmodified, obtained from any \nunauthorized source.  Neither have we provided access to \nour code to any peer or unauthorized source. Signed, \n <%s> \n <%s>\n",string_array(1),string_array(2));
elseif length(string_array) == 3
     fprintf("\nWe are submitting code that is our own original work. We have not used \nsource code, either modified or unmodified, obtained from any \nunauthorized source.  Neither have we provided access to \nour code to any peer or unauthorized source. Signed,\n <%s> \n <%s> \n <%s>\n",string_array(1),string_array(2),string_array(3));
elseif length(string_array) == 4
     fprintf("\nWe are submitting code that is our own original work. We have not used \nsource code, either modified or unmodified, obtained from any \nunauthorized source.  Neither have we provided access to \nour code to any peer or unauthorized source. Signed,\n <%s> \n <%s> \n <%s> \n <%s>\n",string_array(1),string_array(2),string_array(3),string_array(4));
elseif length(string_array) == 5
     fprintf("\nWe are submitting code that is our own original work. We have not used \nsource code, either modified or unmodified, obtained from any \nunauthorized source.  Neither have we provided access to \nour code to any peer or unauthorized source. Signed, \n <%s> \n <%s> \n <%s> \n <%s> \n <%s>\n",string_array(1),string_array(2),string_array(3),string_array(4),string_array(5));
else 
     fprintf("\nWarning: the number of names doesn’t match an expected value"); 
end
    

%% ____________________
%% COMMAND WINDOW OUTPUTS
%{
PS07_academic_integrity_rbehl(1)
Warning:The input is not a string

PS07_academic_integrity_rbehl(["student 1"])
I am submitting code that is my own original work. I have not used 
source code, either modified or unmodified, obtained from any 
unauthorized source.  Neither have I provided access to 
my code to any peer or unauthorized source. Signed, 
 <student 1>

PS07_academic_integrity_rbehl(["student 1","student 2"])
We are submitting code that is our own original work. We have not used 
source code, either modified or unmodified, obtained from any 
unauthorized source.  Neither have we provided access to 
our code to any peer or unauthorized source. Signed, 
 <student 1> 
 <student 2>

PS07_academic_integrity_rbehl(["student 1","student 2","student 3"])
We are submitting code that is our own original work. We have not used 
source code, either modified or unmodified, obtained from any 
unauthorized source.  Neither have we provided access to 
our code to any peer or unauthorized source. Signed,
 <student 1> 
 <student 2> 
 <student 3>

PS07_academic_integrity_rbehl(["student 1","student 2","student 3","student 4"])
We are submitting code that is our own original work. We have not used 
source code, either modified or unmodified, obtained from any 
unauthorized source.  Neither have we provided access to 
our code to any peer or unauthorized source. Signed,
 <student 1> 
 <student 2> 
 <student 3> 
 <student 4>

PS07_academic_integrity_rbehl(["student 1","student 2","student 3","student 4","student 5"])
We are submitting code that is our own original work. We have not used 
source code, either modified or unmodified, obtained from any 
unauthorized source.  Neither have we provided access to 
our code to any peer or unauthorized source. Signed, 
 <student 1> 
 <student 2> 
 <student 3> 
 <student 4> 
 <student 5>

PS07_academic_integrity_rbehl(["student 1","student 2","student 3","student 4","student 5","student 6"])
Warning: the number of names doesn’t match an expected value>> 
%}
