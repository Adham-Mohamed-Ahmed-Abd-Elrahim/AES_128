module mix_column_process #(
    WORD_SIZE=32 ,BYTE_SIZE=8
) (
    input clk,rst_n,
    input   [WORD_SIZE-1:0] in_column,
    output  [WORD_SIZE-1:0] out_column  
);
    
wire [BYTE_SIZE-1:0] col_0,col_1,col_2,col_3 ;
assign col_0 = in_column[WORD_SIZE-1:WORD_SIZE-BYTE_SIZE];
assign col_1 = in_column[WORD_SIZE-BYTE_SIZE-1:WORD_SIZE-BYTE_SIZE*2];
assign col_2 = in_column[WORD_SIZE-BYTE_SIZE*2-1:WORD_SIZE-BYTE_SIZE*3];
assign col_3 = in_column[WORD_SIZE-BYTE_SIZE*3-1:WORD_SIZE-BYTE_SIZE*4];

 // --------------------------------------------------------------------- Out[0] --------------------------------------- //
 //############################# Internal Signals  ################### //
 // $$ xtime $$
 wire [BYTE_SIZE-1:0] col_00_xt ;
 wire [BYTE_SIZE-1:0] col_01_xt ;
 // $$ xors $$
 wire [BYTE_SIZE-1:0] xor_00_nx,xor_00_r   ;
 wire [BYTE_SIZE-1:0] xor_01_nx,xor_01_r   ;
 wire [BYTE_SIZE-1:0] xor_02_nx,xor_02_r   ;
 wire [BYTE_SIZE-1:0] xor_03_nx,xor_03_r   ;
 // $$ delays $$ 
  wire [BYTE_SIZE-1:0] col_01_r,col_02_r ,col_03_rr  ;
 //############################  Instantiations  #################### //
 // $$ Xtime $$
  xtime #(  .BYTE_SIZE(BYTE_SIZE)) col_00_xt_inst
   (
     .clk(clk) , .rst_n(rst_n),
    .in_xbyte(col_0),
    .out_byte(col_00_xt)
);
  xtime #(  .BYTE_SIZE(BYTE_SIZE)) col_01_xt_inst
   (
     .clk(clk) , .rst_n(rst_n),
    .in_xbyte(col_1),
    .out_byte(col_01_xt)
);
 // $$ Delays for inputs $$
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) col_01_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(col_1),
 .out_data(col_01_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) col_02_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(col_2),
 .out_data(col_02_r)
);
 delay_train  #( .train_legnth(2) ,.WINDOW_SIZE(BYTE_SIZE)) col_03_delay_inst
 (.in_data(col_3),
  .clk(clk),
  .reset(rst_n) ,
  .out(col_03_rr)
);

 // $$ Delays for xor_gates $$

  delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) xor_00_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_00_nx),
 .out_data(xor_00_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) )  xor_01_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_01_nx),
 .out_data(xor_01_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) )  xor_02_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_02_nx),
 .out_data(xor_02_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) )  xor_03_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_03_nx),
 .out_data(xor_03_r)
);

 //#### Processing #### //
assign xor_00_nx=col_00_xt ^ col_01_xt;
assign xor_01_nx= col_01_r ^ col_02_r;
assign xor_02_nx= xor_01_r ^ col_03_rr ;
assign xor_03_nx= xor_00_r ^ xor_02_r;


 // --------------------------------------------------------------------- Out[1] --------------------------------------- //
 //############################# Internal Signals  ################### //
 // $$ xtime $$
 wire [BYTE_SIZE-1:0] col_11_xt ;
 wire [BYTE_SIZE-1:0] col_12_xt ;
 // $$ xors $$
 wire [BYTE_SIZE-1:0] xor_10_nx,xor_10_r   ;
 wire [BYTE_SIZE-1:0] xor_11_nx,xor_11_r   ;
 wire [BYTE_SIZE-1:0] xor_12_nx,xor_12_r   ;
 wire [BYTE_SIZE-1:0] xor_13_nx,xor_13_r   ;
 // $$ delays $$ 
  wire [BYTE_SIZE-1:0] col_10_r,col_12_r ,col_13_rr  ;
 //############################  Instantiations  #################### //
 // $$ Xtime $$
  xtime #(  .BYTE_SIZE(BYTE_SIZE)) col_11_xt_inst
   (
     .clk(clk) , .rst_n(rst_n),
    .in_xbyte(col_1),
    .out_byte(col_11_xt)
);
  xtime #(  .BYTE_SIZE(BYTE_SIZE)) col_12_xt_inst
   (
     .clk(clk) , .rst_n(rst_n),
    .in_xbyte(col_2),
    .out_byte(col_12_xt)
);
 // $$ Delays for inputs $$
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) col_10_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(col_0),
 .out_data(col_10_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) col_12_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(col_2),
 .out_data(col_12_r)
);
 delay_train  #( .train_legnth(2) ,.WINDOW_SIZE(BYTE_SIZE)) col_13_delay_inst
 (.in_data(col_3),
  .clk(clk),
  .reset(rst_n) ,
  .out(col_13_rr)
);

 // $$ Delays for xor_gates $$

  delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) xor_10_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_10_nx),
 .out_data(xor_10_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) )  xor_11_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_11_nx),
 .out_data(xor_11_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) )  xor_12_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_12_nx),
 .out_data(xor_12_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) )  xor_13_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_13_nx),
 .out_data(xor_13_r)
);

 //#### Processing #### //
assign xor_10_nx=col_11_xt ^ col_12_xt;
assign xor_11_nx= col_10_r ^ col_12_r;
assign xor_12_nx= xor_11_r ^ col_13_rr ;
assign xor_13_nx= xor_10_r ^ xor_12_r;

 // --------------------------------------------------------------------- Out[2] --------------------------------------- //
  //############################# Internal Signals  ################### //
 // $$ xtime $$
 wire [BYTE_SIZE-1:0] col_22_xt ;
 wire [BYTE_SIZE-1:0] col_23_xt ;
 // $$ xors $$
 wire [BYTE_SIZE-1:0] xor_20_nx,xor_20_r   ;
 wire [BYTE_SIZE-1:0] xor_21_nx,xor_21_r   ;
 wire [BYTE_SIZE-1:0] xor_22_nx,xor_22_r   ;
 wire [BYTE_SIZE-1:0] xor_23_nx,xor_23_r   ;
 // $$ delays $$ 
  wire [BYTE_SIZE-1:0] col_21_r,col_23_r ,col_20_rr  ;
 //############################  Instantiations  #################### //
 // $$ Xtime $$
  xtime #(  .BYTE_SIZE(BYTE_SIZE)) col_22_xt_inst
   (
     .clk(clk) , .rst_n(rst_n),
    .in_xbyte(col_2),
    .out_byte(col_22_xt)
);
  xtime #(  .BYTE_SIZE(BYTE_SIZE)) col_23_xt_inst
   (
     .clk(clk) , .rst_n(rst_n),
    .in_xbyte(col_3),
    .out_byte(col_23_xt)
);
 // $$ Delays for inputs $$
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) col_21_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(col_1),
 .out_data(col_21_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) col_23_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(col_3),
 .out_data(col_23_r)
);
 delay_train  #( .train_legnth(2) ,.WINDOW_SIZE(BYTE_SIZE)) col_20_delay_inst
 (.in_data(col_0),
  .clk(clk),
  .reset(rst_n) ,
  .out(col_20_rr)
);

 // $$ Delays for xor_gates $$

  delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) xor_20_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_20_nx),
 .out_data(xor_20_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) )  xor_21_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_21_nx),
 .out_data(xor_21_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) )  xor_22_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_22_nx),
 .out_data(xor_22_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) )  xor_23_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_23_nx),
 .out_data(xor_23_r)
);

 //#### Processing #### //
assign xor_20_nx=col_22_xt ^ col_23_xt;
assign xor_21_nx= col_21_r ^ col_23_r;
assign xor_22_nx= xor_21_r ^ col_20_rr ;
assign xor_23_nx= xor_20_r ^ xor_22_r;
 // --------------------------------------------------------------------- Out[3] --------------------------------------- //
 //############################# Internal Signals  ################### //
 // $$ xtime $$
 wire [BYTE_SIZE-1:0] col_30_xt ;
 wire [BYTE_SIZE-1:0] col_33_xt ;
 // $$ xors $$
 wire [BYTE_SIZE-1:0] xor_30_nx,xor_30_r   ;
 wire [BYTE_SIZE-1:0] xor_31_nx,xor_31_r   ;
 wire [BYTE_SIZE-1:0] xor_32_nx,xor_32_r   ;
 wire [BYTE_SIZE-1:0] xor_33_nx,xor_33_r   ;
 // $$ delays $$ 
  wire [BYTE_SIZE-1:0] col_31_r,col_32_r ,col_30_rr  ;
 //############################  Instantiations  #################### //
 // $$ Xtime $$
  xtime #(  .BYTE_SIZE(BYTE_SIZE)) col_30_xt_inst
   (
     .clk(clk) , .rst_n(rst_n),
    .in_xbyte(col_0),
    .out_byte(col_30_xt)
);
  xtime #(  .BYTE_SIZE(BYTE_SIZE)) col_33_xt_inst
   (
     .clk(clk) , .rst_n(rst_n),
    .in_xbyte(col_3),
    .out_byte(col_33_xt)
);
 // $$ Delays for inputs $$
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) col_31_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(col_1),
 .out_data(col_31_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) col_32_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(col_2),
 .out_data(col_32_r)
);
 delay_train  #( .train_legnth(2) ,.WINDOW_SIZE(BYTE_SIZE)) col_30_delay_inst
 (.in_data(col_0),
  .clk(clk),
  .reset(rst_n) ,
  .out(col_30_rr)
);

 // $$ Delays for xor_gates $$

  delay_unit #( .DATA_WIDTH(BYTE_SIZE) ) xor_30_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_30_nx),
 .out_data(xor_30_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) )  xor_31_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_31_nx),
 .out_data(xor_31_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) )  xor_32_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_32_nx),
 .out_data(xor_32_r)
);
 delay_unit #( .DATA_WIDTH(BYTE_SIZE) )  xor_33_delay_inst
(
 .clk(clk),
 .reset(rst_n),
 .in_data(xor_33_nx),
 .out_data(xor_33_r)
);

 //#### Processing #### //
assign xor_30_nx=col_30_xt ^ col_30_rr;
assign xor_31_nx= col_31_r ^ col_32_r;
assign xor_32_nx= col_33_xt ^ xor_31_r ;
assign xor_33_nx= xor_30_r ^ xor_32_r;



//--------------------- Output assignment ----------------------- //
assign out_column = {xor_03_r,xor_13_r,xor_23_r,xor_33_r};
endmodule