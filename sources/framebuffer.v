`timescale 1ns / 1ps

//Practice RTL Memory
/*module framebuffer(
    input iClk,
    input iWE,
    input [18:0] iAddr,
    input [11:0] iData,
    output reg [11:0] oData
    );
    
    localparam addr_space = 307,200; //640x480
    
    reg [11:0] memory [0:addr_space - 1];
    
    always @(posedge iClk) begin
        if (iWE) begin
            memory[iAddr] <= iData;
        end
        else begin
            oData <= memory[iAddr];
        end
    end
    
endmodule*/
