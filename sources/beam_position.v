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
    output reg oDE,
    output reg oHS,
    output reg oVS,
    output reg [18:0] oPos  //2^19 covers the amount of unique spaces needed for 640x480
    );
    
    localparam H_END = H_VA + H_FP + H_SP + H_BP - 1;
    localparam V_END = V_VA + V_FP + V_SP + V_BP - 1;
    
    localparam HA_END = H_VA - 1;
    localparam VA_END = V_VA - 1;
    
    localparam HS_START = HA_END + H_FP;
    localparam HS_END = HS_START + H_SP;
    
    localparam VS_START = VA_END + V_FP;
    localparam VS_END = VS_START + V_SP;
    
    reg [9:0] hPos = 0; //Up to 1,024
    reg [8:0] vPos = 0; //Up to 512
    
    //Increment Beam Position
    always @(posedge iClk) begin
        if (!iRst) begin
            hPos <= 0;
            vPos <= 0;
        end else begin
    
        if (hPos == H_END) begin
            hPos <= 0;
            if (vPos == V_END) begin
                vPos <= 0;
            end
            else begin
                vPos <= vPos + 1'b1;
            end
        end
        else begin
            hPos <= hPos + 1'b1;
        end
        
        end
    end
    
    //Signal Generation
    always @(posedge iClk) begin
        if (iRst) begin
            oDE <= 0;
            oHS <= 1;
            oVS <= 1;
        end else begin
    
        //Data Enable (Active HIGH)
        if (hPos <= HA_END && vPos <= VA_END) begin
           oDE <= 1;
        end
        else begin
            oDE <= 0;
        end
        
        //Horizontal/Vertical Sync (Active LOW)
        if (hPos == HS_START) begin
            oHS <= 0;
        end else if (hPos == HS_END) begin
            oHS <= 1;
        end
        if (vPos == VS_START) begin
            oVS <= 0;
        end else if (vPos == VS_END) begin
            oVS <= 1;
        end
        
        end
    end
    
    //Increment Address Line
    always @(posedge iClk) begin
        if (iRst) begin
            oPos <= 0;
        end else begin
        
        if (oDE) begin
            oPos <= oPos + 1'b1;
        end
        if (vPos == VA_END && hPos == H_END) begin
            oPos <= 0;
        end
        
        end
    end

endmodule
