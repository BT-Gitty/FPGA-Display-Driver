`timescale 1ns / 1ps

module beam_position_tb();

    reg inClk;
    reg Rst;
    
    wire DE;
    wire HS;
    wire VS;
    wire [18:0] Pos;
    
    beam_position inst(
    .iClk(inClk),
    .iRst(Rst),
    .oDE(DE),
    .oHS(HS),
    .oVS(VS),
    .oPos(Pos)
    );
    
    initial begin
        inClk = 1'b1;
        Rst = 1'b1;
        #10
        Rst = 1'b0;
    end
    
    always #19.84 inClk = ~inClk;

endmodule
