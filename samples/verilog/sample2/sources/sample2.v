module sample2
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

    reg  led_red;
    reg  led_green;
    reg  led_blue;
    
    always @(*)
    begin
        case({push_button1, push_button0})
            2'b00:
                begin
                    led_red   = 0;
                    led_green = 0;
                    led_blue  = 0;
                end
            2'b01:
                begin
                    led_red   = 1;
                    led_green = 0;
                    led_blue  = 0;
                end
            2'b10:
                begin
                    led_red   = 0;
                    led_green = 1;
                    led_blue  = 0;
                end
            2'b11:
                begin
                    led_red   = 0;
                    led_green = 0;
                    led_blue  = 1;
                end
        endcase
    end


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
