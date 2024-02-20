module add_round_key #( 
    parameter BLOCK_LENGTH=128)
     (input clk , rst_n, round_key_en,
    input   [BLOCK_LENGTH-1:0]    state ,
    input   [BLOCK_LENGTH-1:0]    key ,
    output  reg [BLOCK_LENGTH-1:0]    round_key_state 
);

always @ (posedge clk , negedge rst_n)begin
    if(!rst_n)begin
        round_key_state<='b0;
    end
    else if (round_key_en) begin   // can be omitted 
        round_key_state<= state^key ;
    end
end
    
endmodule