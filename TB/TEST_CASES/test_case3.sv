
int i ;
int k;
logic [DATA_SIZE-1:0] out [0:TRAIN_LENGTH-1];
task maintask;
  $display("============================================================");
  $display("=====================main task=====================",$realtime);
  $display("============================================================");
 fork  
  begin 
    clock_gen();
  end
  begin
    reset_init();
    data_entry();
    check();
  end
 join_any 
endtask //automatic

//--------------------------------------------------
task clock_gen;
  $display("============================================================");
  $display("=====================clock_gen =====================",$realtime);
  $display("============================================================");
while(1) begin
clk=0;
#(clk_period/2);
clk=1;
#(clk_period/2);
end
endtask 
//---------------------------------------------------
task reset_init;
  $display("============================================================");
  $display("=====================reset =====================",$realtime);
  $display("============================================================");
  reset=1'b1;
  @(posedge clk) begin
    x_sample = x_samples[0];
reset=1'b0;
en=1'b0;
  end
    @(posedge clk) begin
reset=1'b1;
load=1'b1;
  end


endtask 
//--------------------------------------------------
task data_entry;
  $display("============================================================");
  $display("=====================data_entry =====================",$realtime);
  $display("============================================================");
  
  
  
  i=0;
  k=0;
  repeat(TRAIN_LENGTH) @(posedge clk)begin
    load=1'b0;
    en=1'b1;
    /*if(i==0)begin
    load=1'b1;
    end*/
   x_sample = x_samples[i];
   $display("##############x_sample=%d =====================",x_samples[i]);
   $display("##############y_sample=%d =====================\n",x_sample);
   i=i+1;
   
   end
endtask
//----------------------------------------------
task check;
  $display("============================================================");
  $display("=====================check =====================",$realtime);
  $display("============================================================");
 for(i=0;i<TRAIN_LENGTH;i++) begin
    $display("x_corr_out=%d &&  x_corr_out_ref",x_corr_out[i],x_corr_out_ref[i]); 
 end 
  /*  if(out[i]==(x_corr_out_ref[i])) begin
       $display("##############Passed =====================");
    end
    else begin
          $display("##############failed =====================");
    end
 end*/
endtask
