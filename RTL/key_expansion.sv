module key_expansion #(
    parameter KEY_SIZE=128 ,ROUNDS=10 , WORD_SIZE=32
) ( input                           rst_n , clk,
    input   [KEY_SIZE-1:0]          in_key ,
    input   [$clog2(ROUNDS):0]    round,
    input                           key_capture,  //to register the key output
    output  [KEY_SIZE-1:0]          out_key
);
    localparam BYTE_SIZE=8;
// -------------- Internal Signals --------------- //
 logic   [WORD_SIZE-1:0]          rcon_nx,rcon;
 logic  [WORD_SIZE-1:0]          rot_word;
 logic  [WORD_SIZE-1:0]          sub_word;
 logic  [KEY_SIZE-1:0]           out_key_nx,out_key_r;
wire [WORD_SIZE-1:0] word_0,word_1,word_2,word_3 ;
wire [WORD_SIZE-1:0] new_word_0_nx,new_word_0_r, new_word_1_nx,new_word_1_r,new_word_2_nx,new_word_2_r,new_word_3_nx,new_word_3_r,g_w3_nx,g_w3_r ;

assign word_0 = in_key[KEY_SIZE-1:KEY_SIZE-WORD_SIZE];
assign word_1 = in_key[KEY_SIZE-WORD_SIZE-1:KEY_SIZE-WORD_SIZE*2];
assign word_2 = in_key[KEY_SIZE-WORD_SIZE*2-1:KEY_SIZE-WORD_SIZE*3];
assign word_3 = in_key[KEY_SIZE-WORD_SIZE*3-1:KEY_SIZE-WORD_SIZE*4];
//---- New Words Generation ----- //
assign g_w3_nx =      sub_word  ^ rcon;
assign new_word_0_nx= word_0 ^ (g_w3_r) ;
assign new_word_1_nx = word_1 ^ (new_word_0_r);
assign new_word_2_nx = word_2 ^ (new_word_1_r);
assign new_word_3_nx = word_3 ^ (new_word_2_r);
 always_comb rot_word = rot_word_f(word_3);

// -------------- Intantiations ----------------- //
 rcon #(.ROUNDS(ROUNDS) , .WORD_SIZE(WORD_SIZE))  rcon_inst
  (
   .round(round),
   .rcon(rcon_nx)
);
always @ (posedge clk , negedge rst_n)begin
    if(!rst_n)begin
        rcon<='b0;
    end
    else begin
        rcon<=rcon_nx;
    end
end
  s_word #( .DATA_WIDTH(WORD_SIZE) , .BYTE_SIZE(BYTE_SIZE)) s_word_inst
   (
    .clk(clk) , .rst_n(rst_n),
    .in_word(rot_word),
    .sub_word(sub_word)
);   

function logic [31:0] rot_word_f (input logic [31:0] in_word );
     rot_word_f={in_word[23:0], in_word[31:24]};
endfunction

//-------------- Pipelining ---------------- //
 delay_unit #(.DATA_WIDTH(WORD_SIZE) ) g_w3_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(g_w3_nx),
 .out_data(g_w3_r)
);
 delay_unit #(.DATA_WIDTH(WORD_SIZE) ) new_wo
(
 .clk(clk),
 .reset(rst_n),
 .in_data(new_word_0_nx),
 .out_data(new_word_0_r)
);
 delay_unit #(.DATA_WIDTH(WORD_SIZE) ) new_w1
(
 .clk(clk),
 .reset(rst_n),
 .in_data(new_word_1_nx),
 .out_data(new_word_1_r)
);
 delay_unit #(.DATA_WIDTH(WORD_SIZE) ) new_w2
(
 .clk(clk),
 .reset(rst_n),
 .in_data(new_word_2_nx),
 .out_data(new_word_2_r)
);
 delay_unit #(.DATA_WIDTH(WORD_SIZE) ) new_w3
(
 .clk(clk),
 .reset(rst_n),
 .in_data(new_word_3_nx),
 .out_data(new_word_3_r)
);

always @(posedge clk , negedge rst_n)begin
    if(!rst_n)begin
        out_key_r<='b0;
    end
    else if(key_capture==1'b1) begin
        out_key_r<=out_key_nx;
    end
end
//------------- Output registeration -------------- //
assign out_key_nx= {new_word_0_r , new_word_1_r , new_word_2_r , new_word_3_r };
assign out_key= out_key_r;
endmodule