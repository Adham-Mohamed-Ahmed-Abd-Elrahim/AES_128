%% Metrics
clc
clear
block_length=128;
NB=block_length/32; %block_size of 4 characters 
NK=4;               % key size
rounds=10;          % number of rounds
space_hex=dec2hex(' ');
% Sbox
% v= ['63' , 'c9' , 'fe', '30' ; ...
%     'f2', '63', '26', 'f2' ; ...
%     '7d', 'd4' ,'c9'  ,'c9' ; ...
%     'd4', 'fa', '63', '82']
% v= [v(:,1:2) ; v(:,3:4) ; v(:,5:6);v(:,7:8)]
% v=hex2dec(v)
% v=message_prepare(v,NB)
% Writing S_BOX
Sbox=['637c777bf26b6fc53001672bfed7ab76';...
      'ca82c97dfa5947f0add4a2af9ca472c0';...
      'b7fd9326363ff7cc34a5e5f171d83115';...
      '04c723c31896059a071280e2eb27b275';...
      '09832c1a1b6e5aa0523bd6b329e32f84';...
      '53d100ed20fcb15b6acbbe394a4c58cf';...
      'd0efaafb434d338545f9027f503c9fa8';...
      '51a3408f929d38f5bcb6da2110fff3d2';...
      'cd0c13ec5f974417c4a77e3d645d1973';...
      '60814fdc222a908846eeb814de5e0bdb';...
      'e0323a0a4906245cc2d3ac629195e479';...
      'e7c8376d8dd54ea96c56f4ea657aae08';...
      'ba78252e1ca6b4c6e8dd741f4bbd8b8a';...
      '703eb5664803f60e613557b986c11d9e';...
      'e1f8981169d98e949b1e87e9ce5528df';...
      '8ca1890dbfe6426841992d0fb054bb16'];
  
 Sbox=reshape(hex2dec(reshape(Sbox',2,[])'),16,16);
 Sbox= dec2bin(Sbox(:),8);
fileID1 = fopen(['s_box.txt'], 'w');
 for i = 1 : 256
    if i == 256
      fprintf(fileID1, '%s', Sbox(i, :));   
    else
      fprintf(fileID1, '%s\n', Sbox(i, :));      
    end
end


%% Message input 
message=message_input('Two One Nine Two');
message_hex=dec2hex(message);
initial_state = message_prepare(message,NB);
print_hex('initial message',initial_state);
key = in_key('Thats my Kung Fu');
% key=['0f';'15' ;'71';'c9';...
%      '47' ;'d9' ;'e8' ;'59'; ...
%      '0c' ; 'b7' ; ;'ad';'20' ;...
%       'af';'7f';'67';'98'] ;
%key=hex2dec(key);
key_hex=dec2hex(key);
key_mat=message_prepare(key,NB);
print_hex('initial key',key_mat);
key_bin=dec2bin(key_mat,8);

%key_expansion(key,1)

%% Stage 1 
% % Add round key
% % state_1=add_round_key(key,initial_state);
% % state_1_hex=dec2hex(state_1)
% % sub_bytes
% % sub_state_1=sub_bytes(state_1)
% % sub_state=message_prepare(sub_state_1,NB)
% % Shift_rows
% % shft_state=shift_rows(sub_state)
% % Mix_Column
% % mix_state=mix_columns(shft_state)

%% Iterations
 state=message;
 state_1=add_round_key(key,state); % state 0
 print_hex('Add_ROund_key',state_1);
 dec2hex(state_1);
for i=1:rounds
    fprintf('------------Round NO.%d-----------\n',i);
% sub_bytes
sub_state_1=sub_bytes(state_1);
 print_hex('Sub_Bytes',sub_state_1);
sub_state=message_prepare(sub_state_1,NB);
%Shift_rows
shft_state=shift_rows(sub_state);
 print_hex('shft_state',shft_state);
% Mix_Column
if(i~=10)
mix_state=mix_columns(shft_state);
 print_hex('Mix_State',mix_state);
state=mix_state;
else 
state=shft_state;
end
key=key_expansion(key,i);
 print_hex('Key_Expansion',key);
state_1=add_round_key(key,state);
 print_hex('Add_Round_key_loop',state_1);
dec2hex(state_1);
end

