module s_word #(
    parameter DATA_WIDTH=32 , BYTE_SIZE=8
) (
    input                     clk , rst_n,
    input      [DATA_WIDTH-1:0] in_word,
    output reg  [DATA_WIDTH-1:0] sub_word
);

//--------------- Internal Signals ------------------- //
reg [BYTE_SIZE-1:0] byte_0 ;
reg [BYTE_SIZE-1:0] byte_1 ;
reg [BYTE_SIZE-1:0] byte_2 ;
reg [BYTE_SIZE-1:0] byte_3 ;

//--------------- Instantiations  ------------------- //
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box0
      (.s_box_in(in_word[DATA_WIDTH-1:DATA_WIDTH-BYTE_SIZE]),
       .s_box_out(byte_0) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box1
      (.s_box_in(in_word[DATA_WIDTH-BYTE_SIZE-1:DATA_WIDTH-BYTE_SIZE*2]),
       .s_box_out(byte_1) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box2
      (.s_box_in(in_word[DATA_WIDTH-BYTE_SIZE*2-1:DATA_WIDTH-BYTE_SIZE*3]),
       .s_box_out(byte_2) 
);
//------------------------------------
 sbox #( .ADDR_WIDTH(BYTE_SIZE) , .DEPTH(256)) s_box3
      (.s_box_in(in_word[DATA_WIDTH-BYTE_SIZE*3-1:DATA_WIDTH-BYTE_SIZE*4]),
       .s_box_out(byte_3) 
);
//---------------- Output Registeration --------------- //
always @ (posedge clk , negedge rst_n)begin
     if (!rst_n)begin
          sub_word<='b0;
     end
     else begin
          sub_word <= {byte_0,byte_1,byte_2,byte_3};
     end
end

endmodule