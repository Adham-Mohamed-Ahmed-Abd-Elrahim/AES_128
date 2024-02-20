function [message_hex] = message_input(message)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
space_hex=dec2hex(' ');
%message=input('Enter the message:', 's');
message_hex=dec2hex(message);
if(length(message_hex)<=16)
    message_hex=[message_hex ;repmat(space_hex,[16-length(message_hex) 1])] ;
else 
error('Message is more than 16 character');
end 

   message_hex=hex2dec(message_hex);
end

