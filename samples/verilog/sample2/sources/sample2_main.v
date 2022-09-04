module sample2_main
    (
        input  wire push_button0,
        input  wire push_button1,
        
        output reg  led_red,
        output reg  led_green,
        output reg  led_blue
    );
    
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
 
endmodule
