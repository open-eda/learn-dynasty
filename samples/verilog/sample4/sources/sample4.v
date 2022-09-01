module sample4
    (
        input  wire clock,
        
        input  wire push_button0_n,
        input  wire push_button1_n,
        
        output wire led_red_n,
        output wire led_green_n,
        output wire led_blue_n
    );
    
    wire push_button0;
    wire push_button1;
    
    wire led_red;
    wire led_green;
    wire led_blue;

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


    sample_wrapper u_sample_wrappter 
    (
        .clock          (clock),
        
        .push_button0_n (push_button0_n),
        .push_button1_n (push_button1_n),
        .push_button0   (push_button0),
        .push_button1   (push_button1),
        
        .led_red        (led_red),
        .led_green      (led_green),
        .led_blue       (led_blue),
        .led_red_n      (led_red_n),
        .led_green_n    (led_green_n),
        .led_blue_n     (led_blue_n)
    );

endmodule
