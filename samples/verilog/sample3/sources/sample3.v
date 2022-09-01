module sample3
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
    parameter IDLE  = 2'b00;
    parameter RED   = 2'b01;
    parameter GREEN = 2'b10;
    parameter BLUE  = 2'b11;

    initial
    begin
        state = IDLE;
    end

    always @(posedge push_button0 or posedge push_button1)
    begin
        if (push_button1 == 1)
            state <= IDLE;
        else
            state <= next_state;
    end
    
    always @(*)
    begin
        case (state)
            IDLE:  next_state = RED;
            RED:   next_state = GREEN;
            GREEN: next_state = BLUE;
            BLUE:  next_state = RED;
        endcase
    end

    assign led_red   = (state == RED)   ? 1 : 0;
    assign led_green = (state == GREEN) ? 1 : 0;
    assign led_blue  = (state == BLUE)  ? 1 : 0;


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
