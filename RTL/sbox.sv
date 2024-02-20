module sbox #(
    parameter ADDR_WIDTH=8 , DEPTH=256
) (input [ADDR_WIDTH-1:0] s_box_in,
    output [ADDR_WIDTH-1:0] s_box_out 
    
);
    reg  [ADDR_WIDTH-1:0] s_box [0:DEPTH-1] ; 

    initial begin
    $readmemb("s_box.txt",s_box);
    end
    assign s_box_out=s_box[s_box_in];
endmodule