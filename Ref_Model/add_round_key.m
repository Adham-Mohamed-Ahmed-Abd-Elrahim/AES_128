function [new_state] = add_round_key(key,state)
%ROUND_KEY Summary of this function goes here
%   Detailed explanation goes here
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
key_bin= dec2bin(key,8)-'0';
state_bin=dec2bin(state,8)-'0';
for i=1:16 
        new_state(i,:)= xor(state_bin(i,:),key_bin(i,:));
end
new_state;
new_state=bin2dec(int2str(new_state));
end

