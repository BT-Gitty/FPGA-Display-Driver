## Clock Signals
set_property -dict { PACKAGE_PIN R2    IOSTANDARD SSTL135 } [get_ports { CLK }]; #IO_L12P_T1_MRCC_34 Sch=ddr3_clk[200]
create_clock -add -name sys_clk_pin -period 10.000 -waveform {0 5.000}  [get_ports { CLK }];


## Buttons
set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { RST }]; #IO_L18N_T2_A23_15 Sch=btn[0]

## Pmod Header JB
set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { DVI_R[3] }]; #IO_L9P_T1_DQS_14 Sch=jb_p[1]
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { DVI_R[1] }]; #IO_L9N_T1_DQS_D13_14 Sch=jb_n[1]
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { DVI_G[3] }]; #IO_L10P_T1_D14_14 Sch=jb_p[2]
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { DVI_G[1] }]; #IO_L10N_T1_D15_14 Sch=jb_n[2]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { DVI_R[2] }]; #IO_L11P_T1_SRCC_14 Sch=jb_p[3]
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { DVI_R[0] }]; #IO_L11N_T1_SRCC_14 Sch=jb_n[3]
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { DVI_G[2] }]; #IO_L12P_T1_MRCC_14 Sch=jb_p[4]
set_property -dict { PACKAGE_PIN P16   IOSTANDARD LVCMOS33 } [get_ports { DVI_G[0] }]; #IO_L12N_T1_MRCC_14 Sch=jb_n[4]

## Pmod Header JC
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports { DVI_B[3] }]; #IO_L18P_T2_A12_D28_14 Sch=jc1/ck_io[41]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { DVI_CLK }]; #IO_L18N_T2_A11_D27_14 Sch=jc2/ck_io[40]
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { DVI_B[0] }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=jc3/ck_io[39]
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { DVI_HS }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=jc4/ck_io[38]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { DVI_B[2] }]; #IO_L16P_T2_CSI_B_14 Sch=jc7/ck_io[37]
set_property -dict { PACKAGE_PIN P13   IOSTANDARD LVCMOS33 } [get_ports { DVI_B[1] }]; #IO_L19P_T3_A10_D26_14 Sch=jc8/ck_io[36]
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { DVI_DE }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=jc9/ck_io[35]
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { DVI_VS }]; #IO_L20P_T3_A08_D24_14 Sch=jc10/ck_io[34]

## Configuration options, can be used for all designs
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]


set_property INTERNAL_VREF 0.675 [get_iobanks 34]
