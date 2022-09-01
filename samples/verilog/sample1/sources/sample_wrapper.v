module sample_wrapper 
    (
        input  wire clock,
        
        input  wire push_button0_n,
        input  wire push_button1_n,
        output wire push_button0,
        output wire push_button1,
        
        input  wire led_red,
        input  wire led_green,
        input  wire led_blue,
        output wire led_red_n,
        output wire led_green_n,
        output wire led_blue_n
    );

    push_button_debouncer u0_push_button_debouncer (
        .clock         (clock),
        
        .push_button_n (push_button0_n),
        .push_button   (push_button0)
    );

    push_button_debouncer u1_push_button_debouncer (
        .clock         (clock),
        
        .push_button_n (push_button1_n),
        .push_button   (push_button1)
    );      
    
    assign led_red_n   = ~led_red;
    assign led_green_n = ~led_green;
    assign led_blue_n  = ~led_blue;

endmodule
