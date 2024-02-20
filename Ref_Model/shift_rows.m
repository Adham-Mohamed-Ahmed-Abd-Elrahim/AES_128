function [shft_state] = shift_rows(state)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
state;
temp1=[state(2,2:4) , state(2,1)] ;
temp2=[state(3,3:4) , state(3,1:2)];
temp3=[state(4,4) , state(4,1:3)];
shft_state= [state(1,:) ; temp1 ;temp2 ; temp3 ];
end

