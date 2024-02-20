module mux #(
    parameter DATA_WIDTH=128
) (
    input sel , 
    input  [DATA_WIDTH-1:0] in_0 , in_1,
    output [DATA_WIDTH-1:0] out 
);
    assign out = (sel==1'b1) ? in_1:in_0; 
endmodule