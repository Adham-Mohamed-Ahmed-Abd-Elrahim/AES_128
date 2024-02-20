module delay_train 
#(parameter train_legnth=3 ,WINDOW_SIZE=16)
 (input    [WINDOW_SIZE-1:0]    in_data,
 input      clk,
 input      reset ,
 output   [WINDOW_SIZE-1:0] out
);
    genvar i ;
wire [WINDOW_SIZE-1:0]out_data [0:train_legnth-1];
    generate 
        for(i=0;i<(train_legnth);i=i+1)begin :for_loop
            if(i==0) begin
               delay_unit #(.DATA_WIDTH(WINDOW_SIZE)) u0   (.clk(clk),.reset(reset), .in_data(in_data), .out_data(out_data[i]) );
            end
            else  begin
                delay_unit #(.DATA_WIDTH(WINDOW_SIZE)) u1  (.clk(clk),.reset(reset), .in_data(out_data[i-1]), .out_data(out_data[i]) );
            end
        end
    endgenerate

//assigning 
    assign out=out_data[train_legnth-1];

endmodule