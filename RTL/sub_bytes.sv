module sub_bytes #(
    parameter DATA_WIDTH=128 
) (
    input                     clk , rst_n,
    input      [DATA_WIDTH-1:0] in_state,
    output reg  [DATA_WIDTH-1:0] s_bytes_state
);
localparam BYTE_SIZE=8;
//--------------- Internal Signals ------------------- //
wire [BYTE_SIZE-1:0] byte_0 ;
wire [BYTE_SIZE-1:0] byte_1 ;
wire [BYTE_SIZE-1:0] byte_2 ;
wire [BYTE_SIZE-1:0] byte_3 ;
wire [BYTE_SIZE-1:0] byte_4 ;
wire [BYTE_SIZE-1:0] byte_5 ;
wire [BYTE_SIZE-1:0] byte_6 ;
wire [BYTE_SIZE-1:0] byte_7 ;
wire [BYTE_SIZE-1:0] byte_8 ;
wire [BYTE_SIZE-1:0] byte_9 ;
wire [BYTE_SIZE-1:0] byte_10 ;
wire [BYTE_SIZE-1:0] byte_11 ;
wire [BYTE_SIZE-1:0] byte_12 ;
wire [BYTE_SIZE-1:0] byte_13 ;
wire [BYTE_SIZE-1:0] byte_14 ;
wire [BYTE_SIZE-1:0] byte_15 ;
//--------------- Instantiations  ------------------- //
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box0
      (.s_box_in(in_state[DATA_WIDTH-1:DATA_WIDTH-BYTE_SIZE]),
       .s_box_out(byte_0) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box1
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE-1:DATA_WIDTH-BYTE_SIZE*2]),
       .s_box_out(byte_1) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box2
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*2-1:DATA_WIDTH-BYTE_SIZE*3]),
       .s_box_out(byte_2) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box3
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*3-1:DATA_WIDTH-BYTE_SIZE*4]),
       .s_box_out(byte_3) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box4
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*4-1:DATA_WIDTH-BYTE_SIZE*5]),
       .s_box_out(byte_4) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box5
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*5-1:DATA_WIDTH-BYTE_SIZE*6]),
       .s_box_out(byte_5) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box6
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*6-1:DATA_WIDTH-BYTE_SIZE*7]),
       .s_box_out(byte_6) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box7
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*7-1:DATA_WIDTH-BYTE_SIZE*8]),
       .s_box_out(byte_7) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box8
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*8-1:DATA_WIDTH-BYTE_SIZE*9]),
       .s_box_out(byte_8) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box9
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*9-1:DATA_WIDTH-BYTE_SIZE*10]),
       .s_box_out(byte_9) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box10
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*10-1:DATA_WIDTH-BYTE_SIZE*11]),
       .s_box_out(byte_10) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box11
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*11-1:DATA_WIDTH-BYTE_SIZE*12]),
       .s_box_out(byte_11) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box12
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*12-1:DATA_WIDTH-BYTE_SIZE*13]),
       .s_box_out(byte_12) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box13
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*13-1:DATA_WIDTH-BYTE_SIZE*14]),
       .s_box_out(byte_13) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box14
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*14-1:DATA_WIDTH-BYTE_SIZE*15]),
       .s_box_out(byte_14) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box15
      (.s_box_in(in_state[DATA_WIDTH-BYTE_SIZE*15-1:DATA_WIDTH-BYTE_SIZE*16]),
       .s_box_out(byte_15) 
);
//---------------- Output Registeration --------------- //
always @ (posedge clk , negedge rst_n)begin
     if (!rst_n)begin
          s_bytes_state<='b0;
     end
     else begin
          s_bytes_state <= {byte_0,byte_1,byte_2,byte_3,byte_4,byte_5,byte_6,byte_7,byte_8,byte_9,byte_10,byte_11,byte_12,byte_13,byte_14,byte_15};
     end
end
endmodule