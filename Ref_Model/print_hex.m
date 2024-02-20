function [] = print_hex(operation,state)
%PRINT_HEX Summary of this function goes here
%   Detailed explanation goes here
state_hex=dec2hex(state(1),2);
for i=2:16
    state_hex=strcat(state_hex , dec2hex(state(i),2));
end 
%state_hex=bin2dec(state_hex)
fprintf("The state in %s = %s \n" , operation , state_hex )
end

