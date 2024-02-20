function [initial_state] = message_prepare(message,NB)
%MESSAGE_PREPARE Summary of this function goes here
%   Detailed explanation goes here
for i=1:4
    for j=0:NB-1
        initial_state(i,j+1)=message(4*j+i);
end
end
end
