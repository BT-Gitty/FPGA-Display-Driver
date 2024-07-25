`timescale 1ns / 1ps

module framebuffer(

    input iClk,
    input iWE,
    input [18:0] iAddr,
    
    output [13:0] ddr3_addr,
    output [2:0] ddr3_ba,
    output ddr3_ras_n,
    output ddr3_cas_n,
    output ddr3_we_n,
    output ddr3_reset_n,
    output [0:0] ddr3_ck_p,
    output [0:0] ddr3_ck_n,
    output [0:0] ddr3_cke,
    output [0:0] ddr3_cs_n,
    output [1:0] ddr3_dm,
    output [0:0] ddr3_odt
    );
    
    //localparam addrSpace = 307200; //640x480 = 307200
    
    //reg [11:0] memory [addrSpace - 1:0];
    
    always @(posedge iClk) begin
        if (iWE) begin
            //memory[iAddr] <= iData;
        end
        else begin
            //oData <= memory[iAddr];
        end
    end

endmodule
