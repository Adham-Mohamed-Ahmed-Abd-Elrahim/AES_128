module aes_128 #(
    parameter KEY_SIZE=128  , BLOCK_LENGTH=128 ,  ROUNDS=10  ,  WORD_SIZE=32
) (
    input clk , rst_n , start,
    input  [BLOCK_LENGTH-1:0]  in_state , 
    input  [KEY_SIZE-1:0]      in_key , 
    output [BLOCK_LENGTH-1:0]  out_state,
    output done
);
    // Controller internal Signals : 
    wire round_key_en;
    wire load;
    wire final_round_sel;
    wire key_capture ;
    wire key_sel;
    wire [$clog2(ROUNDS):0]    round;
    // Muxes signals :
    wire  [BLOCK_LENGTH-1:0]  state_selector_o , final_stage_selector_o ;
    wire  [KEY_SIZE-1:0]      key_selector_o   ;
    
    // ______________ Stages output ______________
    // add round key stage : 
    wire  [BLOCK_LENGTH-1:0]  round_key_state ;
    // Sub bytes stage 
    wire  [BLOCK_LENGTH-1:0]  s_bytes_state ;
    // Shift rows :
    wire  [BLOCK_LENGTH-1:0]  shifted_state;
    // Mix column:
    wire [BLOCK_LENGTH-1:0] mixed_state;
    // key_expansion
    wire  [KEY_SIZE-1:0]      out_key;

    // ------------------------------------------------------------------- //
    //------------------------ Instatiations ----------------------------- //
    // ------------------------------------------------------------------ //   
    // MUXES :
     mux #(  .DATA_WIDTH(BLOCK_LENGTH)) state_selector_inst
      (
         .sel(load) , 
         .in_0(final_stage_selector_o) , 
         .in_1(in_state),
         .out(state_selector_o) 
    );
    mux #(.DATA_WIDTH(KEY_SIZE)) key_selector_o_inst
      (
         .sel(key_sel) , 
         .in_0(out_key) , 
         .in_1(in_key),
         .out(key_selector_o) 
    );
       mux #(  .DATA_WIDTH(KEY_SIZE)) final_stage_selector_inst
      (
         .sel(final_round_sel) , 
         .in_0(mixed_state) , 
         .in_1(shifted_state),
         .out(final_stage_selector_o) 
    );
    // add round key _stage :
     add_round_key #( .BLOCK_LENGTH(BLOCK_LENGTH)) add_round_key_inst
         ( .clk(clk) , .rst_n(rst_n), .round_key_en(round_key_en),
           .state(state_selector_o) ,
           .key(key_selector_o) ,
           .round_key_state(round_key_state) 
    );
    // Sub_State stage:
     sub_bytes #(.DATA_WIDTH(BLOCK_LENGTH) ) sub_bytes_inst
      (
        .clk(clk) , .rst_n(rst_n),
        .in_state(round_key_state),
        .s_bytes_state(s_bytes_state)
    );
    //Shift_rows stage :
     shift_rows shift_rows_inst(
         .state_in(s_bytes_state),
         .state_out(shifted_state)
    );
    // Mix_column :
     mix_column #( .BLOCK_LENGTH(BLOCK_LENGTH), .WORD_SIZE(WORD_SIZE)) mix_column_inst
(
    .clk(clk),.rst_n(rst_n) ,
    .state(shifted_state) ,
    .mixed_state(mixed_state) 
);
   // Key Expansion:
    key_expansion #(  .KEY_SIZE(KEY_SIZE) ,.ROUNDS(ROUNDS) , .WORD_SIZE(WORD_SIZE)) key_expansion_inst
     ( .rst_n(rst_n) , .clk(clk),
       .in_key(key_selector_o) ,
       .round(round),
       .key_capture(key_capture),  //to register the key output
       .out_key(out_key)
);
    
// Controller :
 aes_controller  #( .ROUNDS(ROUNDS) ) aes_controller_inst
(     .clk(clk) , .rst_n(rst_n),
      .start(start),
      .load(load) , .round_key_en(round_key_en) ,  .key_capture(key_capture),.final_round_sel(final_round_sel) , .done(done), .key_sel(key_sel),
      .round(round)
);

assign out_state =  round_key_state;
   
endmodule