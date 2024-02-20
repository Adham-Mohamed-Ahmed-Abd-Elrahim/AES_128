module mix_column #(
    parameter BLOCK_LENGTH=128, WORD_SIZE=32
) (
    input clk,rst_n ,
    input   [BLOCK_LENGTH-1:0]    state ,
    output  [BLOCK_LENGTH-1:0]    mixed_state 
);
    //----------------- Internal Signals -------------- //
    wire [WORD_SIZE-1:0] in_column [0:3];

    assign in_column[0]=state[BLOCK_LENGTH-1:BLOCK_LENGTH-WORD_SIZE] ;
    assign in_column[1]= state[BLOCK_LENGTH-1-WORD_SIZE:BLOCK_LENGTH-WORD_SIZE*2] ;
    assign in_column[2]= state[BLOCK_LENGTH-1-WORD_SIZE*2:BLOCK_LENGTH-WORD_SIZE*3] ;
    assign in_column[3]=  state[BLOCK_LENGTH-1-WORD_SIZE*3:BLOCK_LENGTH-WORD_SIZE*4] ;
    //-------------------------------
    wire [WORD_SIZE-1:0] out_column [0:3];
   // ----------------- Instantiations ---------------- //
    // ------------------ Process Unit [0] ------------ //
    mix_column_process #(.WORD_SIZE(WORD_SIZE) ,.BYTE_SIZE(8)) mix_column_process_0
    (
    .clk(clk),.rst_n(rst_n),
    .in_column(in_column[0]),
    .out_column(out_column[0])  
);
    // ------------------ Process Unit [1] ------------ //
    mix_column_process #(.WORD_SIZE(WORD_SIZE) ,.BYTE_SIZE(8)) mix_column_process_1
    (
    .clk(clk),.rst_n(rst_n),
    .in_column(in_column[1]),
    .out_column(out_column[1])  
    );
    // ------------------ Process Unit [2] ------------ //
    mix_column_process #(.WORD_SIZE(WORD_SIZE) ,.BYTE_SIZE(8)) mix_column_process_2
    (
    .clk(clk),.rst_n(rst_n),
    .in_column(in_column[2]),
    .out_column(out_column[2])  
    );
    // ------------------ Process Unit [3] ------------ //
        mix_column_process #(.WORD_SIZE(WORD_SIZE) ,.BYTE_SIZE(8)) mix_column_process_3
    (
    .clk(clk),.rst_n(rst_n),
    .in_column(in_column[3]),
    .out_column(out_column[3])  
    );

    assign mixed_state = {out_column[0],out_column[1],out_column[2],out_column[3]};
endmodule