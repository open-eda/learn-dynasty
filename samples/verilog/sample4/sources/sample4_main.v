module sample4_main
    (
        input  wire clock,
        
        input  wire push_button0,
        input  wire push_button1,
        
        output wire led_red,
        output wire led_green,
        output wire led_blue
    );
    
    reg[1:0] state, next_state;
    parameter IDLE  = 0;
    parameter RED   = 1;

    initial
    begin
        state = IDLE;
    end

    always @(posedge clock)
    begin
        state <= next_state;
    end
    
    always @(*)
    begin
        case (state)
            IDLE:
                if (push_button0 == 1)
                    next_state = RED;
                else
                    next_state = IDLE;
            RED:
                if (push_button1 == 1)
                    next_state = IDLE;
                else
                    next_state = RED;
        endcase
    end

    assign led_red   = (state == RED) ? 1 : 0;
    assign led_green = 0;
    assign led_blue  = 0;
 
endmodule
