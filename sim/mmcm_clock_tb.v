`timescale 1ns / 1ps

module mmcm_clock_tb();
    
    reg cust_clk;
    reg rst;
    wire pxl_clk;
    
    mmcm_clock inst(
        .clk_in(cust_clk),
        .reset(rst),
        .clk_out(pxl_clk)
    );
    
    initial begin
        cust_clk = 1'b1;
        rst = 1'b1;
        #10
        rst = 1'b0;
    end
    
    always #5 cust_clk = ~cust_clk;
    
endmodule
