function [key] = in_key(key)
%IN_KEY Summary of this function goes here
%   Detailed explanation goes here
space_hex=dec2hex(' ');
%message=input('Enter the key:', 's');
key=dec2hex(key);
if(length(key)~=16)
error('key must be 16 characters');
else 
     key=hex2dec(key) ;
end 
 
end

