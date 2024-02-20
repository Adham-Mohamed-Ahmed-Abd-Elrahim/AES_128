`include "../RTL/mux.sv"
`include "../RTL/rcon.sv"
`include "../RTL/sbox.sv"
`include "../RTL/xtime.sv"
`include "../RTL/delay_unit.v"
`include "../RTL/delay_train.v"
`include "../RTL/add_round_key.sv"
`include "../RTL/sub_bytes.sv"
`include "../RTL/sub_word.sv"
`include "../RTL/shift_rows.sv"
`include "../RTL/mix_column_process.sv"
`include "../RTL/mix_column.sv"
`include "../RTL/key_expansion.sv"
`include "../RTL/aes_controller.sv"
`include "../RTL/AES_128.sv"


`timescale 1ns/1ns
module AES_128_TB (); // lower_layer_2_1
//________________________________________________//
//________________module parameters_____________________//
//______________________________________________//
parameter KEY_SIZE=128;
parameter BLOCK_LENGTH=128;
parameter ROUNDS=10;
parameter WORD_SIZE=32;
//----------------------------------
parameter clk_period = 12;

//_______________________________________________// 
//________________instantiation__________________// 
//_______________________________________________// 
     logic rst_n;
     logic clk;
     logic start_tb ,done_tb;
     logic  [BLOCK_LENGTH-1:0] in_state_tb,out_state_tb;
     logic  [KEY_SIZE-1:0] in_key_tb;
    

//_______________________________________________// 
//________________instantiation__________________// 
//_______________________________________________// 
 aes_128 #( .KEY_SIZE(KEY_SIZE) , .BLOCK_LENGTH(BLOCK_LENGTH) ,  .ROUNDS(ROUNDS)  ,  .WORD_SIZE(WORD_SIZE)) aes_inst
  (
     .clk(clk) , .rst_n(rst_n) , .start(start_tb),
     .in_state(in_state_tb) , 
     .in_key(in_key_tb) , 
     .out_state(out_state_tb),
     .done(done_tb)
);
//_______________________________________________// 
//________________ stimuls ______________________// 
//_______________________________________________// 
`ifdef test1
  `include "TEST_CASES/test_case1.sv"
  `endif
 `ifdef test2
   `include "TEST_CASES/test_case2.sv"
 `endif
initial begin
    maintask();
end
endmodule 