function [new_key] = key_expansion(key,round)
%KEY_EXPANSION Summary of this function goes here
%   Detailed explanation goes here
w0=key(1:4);
w1=key(5:8);
w2=key(9:12);
w3=key(13:16);
% bin values
w0_bin=dec2bin(key(1:4),8)-'0';
w1_bin=dec2bin(key(5:8),8)-'0';
w2_bin=dec2bin(key(9:12),8)-'0';
w3_bin=dec2bin(key(13:16),8)-'0';

%preparing g(w3)
g_w3=rot_word(w3);

g_w3=sub_word(g_w3);
g_w3=dec2bin(sub_word(rot_word(w3)),8)-'0';
g_w3=xor(g_w3,Rcon(round));

new_w0=xor(w0_bin,g_w3);
new_w1=xor(new_w0,w1_bin);
new_w2=xor(new_w1,w2_bin);
new_w3=xor(new_w2,w3_bin);

new_key=[bin2dec(int2str(new_w0)) ,bin2dec(int2str(new_w1)) , bin2dec(int2str(new_w2)) , bin2dec(int2str(new_w3))];
new_key=hex2dec(dec2hex(new_key));

end

