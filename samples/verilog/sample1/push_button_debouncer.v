module push_button_debouncer
    (
        input  wire clock,
        
        input  wire push_button_n,
        output wire push_button
    );
    
    reg push_button_state;
    reg next_push_button_state;
    
    parameter PUSH_BUTTON_STATE0 = 1'b0;
    parameter PUSH_BUTTON_STATE1 = 1'b1;

    parameter COUNTER_MAX = 12'hfff;

    reg[11:0] counter0;
    reg[11:0] counter1;
    
    initial
    begin
        counter0 = 12'h0;
        counter1 = 12'h0;
        push_button_state = PUSH_BUTTON_STATE1;
    end
    
    always @(posedge clock)
    begin
        if (push_button_n == 1'b0)
            begin
                if (counter0 != COUNTER_MAX)
                    counter0 <= counter0 + 12'h1;
                else
                    counter0 <= counter0;
            end
        else
            counter0 <= 12'h0;
    end


    always @(posedge clock)
    begin
        if (push_button_n == 1'b1)
            begin
                if (counter1 != COUNTER_MAX)
                    counter1 <= counter1 + 12'h1;
                else
                    counter1 <= counter1;
            end
        else
            counter1 <= 12'h0;
    end


    always @(posedge clock)
    begin
        push_button_state <= next_push_button_state;
    end
    
    always @(*)
    begin
        case (push_button_state)
            PUSH_BUTTON_STATE0:
                if (counter1 == COUNTER_MAX)
                    next_push_button_state = PUSH_BUTTON_STATE1;
                else
                    next_push_button_state = PUSH_BUTTON_STATE0;
            PUSH_BUTTON_STATE1:
                if (counter0 == COUNTER_MAX)
                    next_push_button_state = PUSH_BUTTON_STATE0;
                else
                    next_push_button_state = PUSH_BUTTON_STATE1;
        endcase
    end
    
   assign push_button = (push_button_state == PUSH_BUTTON_STATE0) ? 1'b1 : 1'b0;

endmodule