function [out] = xtime(byte)
%XTIME Summary of this function goes here
%   Detailed explanation goes here
IR='1b'; %Irreducible polynomial of order 8
IR=dec2bin(hex2dec(IR) ,8)-'0';
%byte_bin = dec2bin(byte,8)-'0'
  out=[byte(2:end),0];
if(byte(1)==1)
   out=double(xor(out,IR));
else
end
end

