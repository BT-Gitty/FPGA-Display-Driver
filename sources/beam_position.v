`timescale 1ns / 1ps

module beam_position #(
    H_VA = 640, //Timings for 640x480 60Hz Industry Standard
    V_VA = 480,
    H_SP = 96,
    H_FP = 160,
    H_BP = 48,
    V_SP = 2,
    V_FP = 10,
    V_BP = 33
    )
    (
    input iClk,
    input iRst,
    output oClk,
    output reg oDE,
    output reg oHS,
    output reg oVS,
    output reg [12:0] oPos  //2^13 covers the amount of unique spaces needed for highest commercial res as of 2024
    );
    
    localparam hPOS = 0;
    localparam vPos = 0;
    
    always @(posedge iClk) begin
        if (iRst) begin
        end
    end
    
endmodule
