module xtime #(
    parameter BYTE_SIZE=8
) (
    input clk , rst_n,
    input [BYTE_SIZE-1:0] in_xbyte,
    output [BYTE_SIZE-1:0] out_byte
);
    // ----------------- Local Parameters --------------- //
    localparam IR = 8'b00011011 ; 
    // ----------------- Internal Signals --------------- //
    wire [BYTE_SIZE-1:0]    shft_bytes_nx,shft_bytes_r ;
    wire [BYTE_SIZE-1:0]    xored_byte_nx , xored_byte_r ;
    wire [BYTE_SIZE-1:0]    mux_out ; 
    assign  shft_bytes_nx = in_xbyte << 1 ;
    assign  xored_byte_nx = shft_bytes_nx ^ IR ;
    assign mux_out = (in_xbyte[BYTE_SIZE-1]==1'b1) ?  xored_byte_r:shft_bytes_r ;
    // ------------------- Instances -------------------- //
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) shft_byte_delayed
(
 .clk(clk),
 .reset(rst_n),
 .in_data(shft_bytes_nx),
 .out_data(shft_bytes_r)
);
    
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) xored_byte_delayed
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xored_byte_nx),
 .out_data(xored_byte_r)
);

 delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) mux_out_delayed
(
 .clk(clk),
 .reset(rst_n),
 .in_data(mux_out),
 .out_data(out_byte)
);




endmodule