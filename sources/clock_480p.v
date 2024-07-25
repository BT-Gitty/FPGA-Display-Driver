`timescale 1ps/1ps

module clock_480p

 (// Clock in ports
  // Clock out ports
  output        clk_out_1x,
  output        clk_out_2x,
  output        clk_out_5x,
  // Status and control signals
  input         resetn,
  input         clk_in1
 );
  // Input buffering
  //------------------------------------
wire clk_in1_clock_480p;
wire clk_in2_clock_480p;
  IBUF clkin1_ibufg
   (.O (clk_in1_clock_480p),
    .I (clk_in1));

  // Clocking PRIMITIVE
  //------------------------------------

  // Instantiation of the MMCM PRIMITIVE
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused

  wire        clk_out_1x_clock_480p;
  wire        clk_out_2x_clock_480p;
  wire        clk_out_5x_clock_480p;

  wire        locked_int;
  wire        clkfbout_clock_480p;
  wire        clkfbout_buf_clock_480p;

  wire        reset_high;

  MMCME2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .CLKOUT4_CASCADE      ("FALSE"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT_F      (10.000),
    .CLKFBOUT_PHASE       (0.000),
    .CLKFBOUT_USE_FINE_PS ("FALSE"),
    .CLKOUT0_DIVIDE_F     (40.000),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT0_USE_FINE_PS  ("FALSE"),
    .CLKOUT1_DIVIDE       (20),
    .CLKOUT1_PHASE        (0.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT1_USE_FINE_PS  ("FALSE"),
    .CLKOUT2_DIVIDE       (8),
    .CLKOUT2_PHASE        (0.000),
    .CLKOUT2_DUTY_CYCLE   (0.500),
    .CLKOUT2_USE_FINE_PS  ("FALSE"),
    .CLKIN1_PERIOD        (10.000))
  mmcm_adv_inst
    // Output clocks
   (
    .CLKFBOUT            (clkfbout_clock_480p),

    .CLKOUT0             (clk_out_1x_clock_480p),

    .CLKOUT1             (clk_out_2x_clock_480p),

    .CLKOUT2             (clk_out_5x_clock_480p),

     // Input clock control
    .CLKFBIN             (clkfbout_buf_clock_480p),
    .CLKIN1              (clk_in1_clock_480p),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),

    .DWE                 (1'b0),
    // Ports for dynamic phase shift
    .PSCLK               (1'b0),
    .PSEN                (1'b0),
    .PSINCDEC            (1'b0),

    // Other control and status signals
    .LOCKED              (locked_int),

    .PWRDWN              (1'b0),
    .RST                 (reset_high));
  assign reset_high = ~resetn; 

// Clock Monitor clock assigning
//--------------------------------------
 // Output buffering
  //-----------------------------------

  BUFG clkf_buf
   (.O (clkfbout_buf_clock_480p),
    .I (clkfbout_clock_480p));
    
  BUFG clkout1_buf
   (.O   (clk_out_1x),
    .I   (clk_out_1x_clock_480p));

  BUFG clkout2_buf
   (.O   (clk_out_2x),
    .I   (clk_out_2x_clock_480p));

  BUFG clkout3_buf
   (.O   (clk_out_5x),
    .I   (clk_out_5x_clock_480p));

endmodule
