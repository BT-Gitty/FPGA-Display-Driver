`timescale 1ns / 1ps

module top(

    input CLK,
    input reset,

    //output led0_r, led0_g, led0_b,
    //output [3:0] btn,

    //12-Bit DVI Pmod Interface
    output reg [3:0] DVI_R,
    output reg [3:0] DVI_G,
    output reg [3:0] DVI_B,
    output DVI_CLK,
    output DVI_DE,
    output DVI_HS,
    output DVI_VS,

    //On-board DDR3 Interface
    inout [15:0] ddr3_dq,
    inout [1:0] ddr3_dqs_p,
    inout [1:0] ddr3_dqs_n,
    output reg [13:0] ddr3_addr,
    output reg [2:0] ddr3_ba,
    output ddr3_ras_n,  //Row
    output ddr3_cas_n,  //Column
    output ddr3_we_n,   //Write Enable
    output ddr3_reset_n,
    output ddr3_ck_p,   //Clock Posedge
    output ddr3_ck_n,
    output reg ddr3_cke,    //Clock Enable
    output reg ddr3_cs_n,   //Chip Select
    output reg [1:0] ddr3_dm,   //Data Mask
    output reg ddr3_odt   //On-die termination

    );
    
    //Clocks
    wire clk1x;
    wire clk2x;
    wire clk5x;

    clock_480p clk_480_inst(
    .clk_in1(CLK),
    .resetn(reset),
    .clk_out_1x(clk1x),
    .clk_out_2x(clk2x),
    .clk_out_5x(clk5x)
    );

    assign ddr3_ck_p = CLK;
    assign ddr3_ck_n = ~CLK;
    
    assign DVI_CLK = clk5x;

    //Beam Position
    reg [18:0] beamPos;
    reg [26:0] addr;

    beam_position beam_pos_inst(
    .iClk(clk1x),
    .iRst(reset),
    .oDE(DVI_DE),
    .oHS(DVI_HS),
    .oVS(DVI_VS),
    .oPos(beamPos)
    );
    
    //DVI RGB
    always @(posedge clk1x) begin
        if (!reset) begin
            DVI_R <= 0;
            DVI_G <= 0;
            DVI_B <= 0;
        end else begin
        if (DVI_DE) begin
            DVI_R <= ddr3_dq[3:0];
            DVI_G <= ddr3_dq[7:4];
            DVI_B <= ddr3_dq[11:8];
        end
        end
    end
    
    //Memory Controller
    reg [1:0] memState;
    assign ddr3_reset_n = reset;
    
    localparam [2:0] MEM_CONTROL_START = 3'b011;
    localparam [2:0] MEM_CONTROL_READ = 3'b101;
    localparam [2:0] MEM_CONTROL_WRITE = 3'b100;
    localparam [2:0] MEM_CONTROL_PRE = 3'b010;
    localparam [2:0] MEM_CONTROL_DEF = 3'b111;
    
    reg [2:0] MEM_CONTROL = MEM_CONTROL_DEF;
    assign {ddr3_ras_n, ddr3_cas_n, ddr3_we_n} = MEM_CONTROL;
    
    always @(posedge CLK) begin
        if (!reset) begin
            ddr3_cke <= 1'b0;
            ddr3_cs_n <= 1'b1;
            ddr3_odt <= 1'b0;
            ddr3_dm <= 2'b11;
            
            MEM_CONTROL <= MEM_CONTROL_DEF;
        end else begin
        case(memState)
            2'b00: begin
                if (readReq | writeReq) begin
                    ddr3_cke <= 1'b1;
                    ddr3_cs_n <= 1'b0;
                    ddr3_odt <= 1'b1;
                    
                    MEM_CONTROL <= MEM_CONTROL_START;
                    ddr3_dm = 2'b11;
                    
                    ddr3_ba <= addr[26:24];
                    ddr3_addr <= addr[23:10];   //Row Address is 14-bits wide
                    
                    memState <= 2'b01;
                end else begin
                    ddr3_ba <= 0;
                    ddr3_addr <= 0;
                    ddr3_dm = 2'b11;
                
                    memState <= 2'b00;
                end
            end
            2'b01: begin
                if (readReq) begin
                    MEM_CONTROL = MEM_CONTROL_READ;
                end else begin
                    MEM_CONTROL = MEM_CONTROL_WRITE;
                end
                ddr3_ba <= addr[26:24];
                ddr3_addr <= addr[9:0]; //Column Address is 10-bits wide
                ddr3_dm <= 2'b00;
                
                memState <= 2'b10;
            end
            2'b10: begin
                
            end
        endcase
        end
    end
    
    always @(negedge CLK) begin
    
    end
    
endmodule
