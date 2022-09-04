module sample1_main
    (
        input  wire push_button0,
        input  wire push_button1,
        
        output wire led_red,
        output wire led_green,
        output wire led_blue
    );
    
    assign led_red   = push_button0 & push_button1;
    assign led_green = 0;
    assign led_blue  = 0;
 
endmodule
