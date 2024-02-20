module aes_controller  #(parameter ROUNDS=10 )
(
    input clk , rst_n, start,
    output load , round_key_en , final_round_sel , done, key_capture,key_sel,
    output [$clog2(ROUNDS):0] round
);
localparam ROUND_DELAY=7 ; //7 clocks per round except last round 
     // --------------------------------------------------------- //
     // ---------------------- Internal States ------------------ //
     // --------------------------------------------------------- //
    enum logic [1:0] {IDLE , ACTIVE , FINAL_ROUND} current_state, next_state;
    reg [$clog2(ROUNDS):0] round_nx , round_r;
    reg load_nx , load_r , round_key_en_nx , round_key_en_r  , final_round_sel_nx , final_round_sel_r ,done_nx,done_r ,key_capture_nx,key_capture_r,key_sel_nx,key_sel_r;
    reg [$clog2(ROUND_DELAY):0] round_timer_nx , round_timer_r  ; 
     // --------------------------------------------------------- //
     // ------------------ Sequential Always block -------------- //
     // --------------------------------------------------------- //   
    always @ (posedge clk , negedge rst_n)begin
        if(!rst_n)begin
            current_state       <=          IDLE;
            round_r             <=          'b0;
            load_r              <=          'b0;
            round_key_en_r      <=          'b0;
            final_round_sel_r   <=          'b0;
            round_timer_r       <=          'b0;
            key_capture_r       <=          'b0;
            key_sel_r           <=          'b0;
            done_r              <=          'b0;
        end
        else begin
            current_state       <=          next_state;
            round_r             <=          round_nx;
            load_r              <=          load_nx;
            round_key_en_r      <=          round_key_en_nx;
            final_round_sel_r   <=          final_round_sel_nx;  
            round_timer_r       <=          round_timer_nx;  
            key_capture_r       <=          key_capture_nx;
            key_sel_r           <=          key_sel_nx;
            done_r              <=          done_nx;       
        end
    end
     // --------------------------------------------------------- //
     // ------------------ Combination Always block -------------- //
     // --------------------------------------------------------- //   
     always @ (*)begin
        next_state              = current_state;              
        round_nx                = round_r;
        load_nx                 = 'b0;              
        round_key_en_nx         = 'b0;                  
        final_round_sel_nx      = final_round_sel_r ;
        round_timer_nx          = round_timer_r;   
        key_capture_nx          = 'b0;
        key_sel_nx              = key_sel_r;
        done_nx                 = 1'b0; 
        case(current_state)
        IDLE:begin
            if(start)begin
                next_state      =   ACTIVE;
                load_nx         =   1'b1;
                round_nx        =   round_r+1;
                round_key_en_nx =   1'b1;
                round_timer_nx  =   round_timer_r+1;
                key_sel_nx=         1'b1;
            end
        end
        ACTIVE:begin
            round_timer_nx=round_timer_r+1;
  
           if(round_timer_r==ROUND_DELAY-1)begin
              key_capture_nx=1'b1;
            end
           else  if (round_timer_r==ROUND_DELAY)begin
                  round_key_en_nx=1'b1;
                  round_timer_nx='b0;
                  round_nx=round_r+1;
                   key_sel_nx='b0;
                if(round_r==10'd9)begin
                    next_state= FINAL_ROUND;
                end 
            end
            end
        
        FINAL_ROUND:begin
            round_timer_nx=round_timer_r+1;
            if(round_timer_r==ROUND_DELAY+1)begin
                done_nx=1'b1;
                next_state=IDLE;
                round_nx='b0;
                round_timer_nx='b0;
                final_round_sel_nx=1'b0;
            end
            else begin
          if(round_timer_r==ROUND_DELAY-1)begin
              key_capture_nx=1'b1;
              final_round_sel_nx=1'b1;
            end
           else  if (round_timer_r==ROUND_DELAY)begin
                  round_key_en_nx=1'b1;
                   key_sel_nx='b0;
                 
            end
            end
        end
        endcase
     end

     //-------------- Output Registeration --------------- //
    assign load=load_r;
    assign  round_key_en=round_key_en_r;
    assign final_round_sel = final_round_sel_r;
    assign done= done_r;
    assign round= round_r;
    assign key_capture = key_capture_r;
    assign key_sel     = key_sel_r;
endmodule