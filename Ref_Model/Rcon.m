function [rcon] = Rcon(round)
%RCON Summary of this function goes here
%   Detailed explanation goes here 
rcon=2^(round-1);
if(round >8)
    rcon= dec2bin(rcon)-'0';
    const=dec2bin(hex2dec('11b'))-'0';
    const=[const , zeros(1,round-9)];
    rcon=xor(rcon,const );
    rcon=bin2dec(int2str(rcon)) ;
   %bin2dec(rcon)
end
rcon=[rcon 0 0 0];
rcon=dec2bin(rcon,8)-'0';
end

