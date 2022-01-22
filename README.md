# Voting-Machine_VHDl

Problem statement of project in words:--   



Considering the efficiency, reliability and other advantages of an EVM, it is decided that student body elections for an institute will be conducted using an Electronic Voting Machine. There are 3 student parties that are contesting in the elections. A total of 7 members of the committee of stakeholders will be casting their votes in order to determine the winning party that will be declared as the student body for the next academic year.
Build an EVM prototype, considering 3 parties and 7 voters (mass scalable in the future) using VHDL and write the test bench to test it in Modelsim-Altera Simulator. Also do the pin planning of the selected board/device .

Circuit/Block Diagram/State Diagram of Mini project:--

![image](https://user-images.githubusercontent.com/66308881/150653421-8718cfca-f8c7-458c-8fb5-3a699cdfe2fa.png)





 
 


Explanation with Example:--


1.	Given above is the design of  Finite State Machine Diagram which consists of 6 states.
a.	Initial
b.	Check
c.	Party1
d.	Party2
e.	Party3
f.	Done
2.	'Initial' state before the start of execution. Here the inputs of the state are reset. It is used to check whether the party button is pressed.
3.	If Reset ='1' then execution will begin.
4.	'Check' state is used to check exactly which button is pressed.
5.	Depending on which button is pressed, we go to that state. 
6.	For e.g. If party1 button is pressed ,state transition takes place to ‘Party1’ .After selecting the party , we need to press the 'Select' to actually vote for it .Now the partycount1 will be incremented by 1.
7.	After the increment of the count ,state transition takes place to the final state ‘Done'.
8.	Once it is in 'Done' state ,we go back to its initial state unconditionally. In ‘Initial’ if the reset is one we stay in the loop .If no party button is pressed in Check we again stay in the loop.
9.	The output for our system are count1, count2,count3
10.	Here we have designed a system to collect the votes for 7 candidates.
11.	We have considered this set of input for the test bench. If we have more no. of voters then bit size of the input should be increased.
Input combination for test bench(Example):






