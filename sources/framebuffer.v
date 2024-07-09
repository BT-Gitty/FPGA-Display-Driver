`timescale 1ns / 1ps

//To be replaced with Block RAM Primitive
/*module framebuffer(
    input iClk,
    input iWE,
    input [12:0] iAddr,
    input [11:0] iData,
    output reg [11:0] oData
    );
    
    localparam addr_space = 8192; //2^13
    
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
