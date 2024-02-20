function [mixed_state] = mix_columns(state)
%MIX_COLUMNS Summary of this function goes here
%   Detailed explanation goes here
c= [2 , 3 , 1 , 1 ;...
   1 , 2 , 3 , 1 ;...
   1 , 1 , 2 , 3 ;...
   3 , 1 , 1 , 2 ]; % Needs 8 xtime operations and the rest and 12 xor only 
%        2 3 1 1
%a00[11]
%a10[21] 
%a20[31]
%a30[41]

mixed_state=[];
for i=1:4
    col=state(:,i);
    col=dec2bin(col,8)-'0';
op1_1 = xor(xtime(col(1,:)) ,xtime(col(2,:))) ;   
op1_2 = xor(col(2,:),col(3,:)) ;
op1_3 = xor(op1_2,col(4,:));
col0  =xor (op1_3 , op1_1);
col0=bin2dec(int2str(col0));
%-------------------------
op2_1=xor(xtime(col(2,:)),xtime(col(3,:)));
op2_2=xor(col(1,:),col(3,:));
op2_3=xor(op2_2 ,col(4,:));
col1 =xor(op2_3,op2_1);
col1=bin2dec(int2str(col1));
%-------------------------
op3_1=xor(xtime(col(3,:)),xtime(col(4,:)));
op3_2=xor(col(2,:),col(4,:));
op3_3=xor(op3_2,col(1,:));
col2 =xor(op3_3,op3_1);
col2=bin2dec(int2str(col2));
%-------------------------
op4_1=xor(xtime(col(1,:)),col(1,:));
op4_2=xor(col(2,:),col(3,:));
op4_3=xor(op4_2,xtime(col(4,:)));
col3 =xor(op4_3,op4_1);
col3=bin2dec(int2str(col3));
mixed_state=[mixed_state , [col0 ; col1  ; col2 ; col3]] ;
end

end

