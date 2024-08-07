# **FPGA Display Driver**

Project based on Vivado 2024.1 version.

[Diligent Arty S7-50](https://digilent.com/reference/programmable-logic/arty-s7/start).

The [TFP410](https://www.ti.com/product/TFP410?bm-verify=AAQAAAAJ_____4FHhq0tasmGcMa9prB263ygBXKuQsg_7dFPQxqPj-rxjDq3Wz-KMwdWiaZPfFitZpzsQEb5PnOWoiFK_uhZgAUW4UbhSwdYekf2fASXAnQYFyLCRG_2hJsqGTNi5QGg7Ag2gQt9vrdOY7xv_pJNGnVYtEuejURS8mvi3uo1ucTJKcjBs50Lr7vSwaSH-x890nJySP_DOJkcuBanTBoBXxGmV1ndTiKhCRhdKEZFPZ85CoH9oSvj66mEmEn1QEq0_QgDrftPm_UCKhtHbHBJ0zB84tAHoY4uRC5rybUwOwChhko) IC uses the standard DVI protocol that is compatible with HDMI, which is the only port that the [1BitSquared 12-bit DVI Pmod](https://1bitsquared.com/products/pmod-digital-video-interface) I am using has. It also handles some signalling requirements for me like TMDS encoding.
##
Support 640x480 resolution @ 60Hz. Signal timings can be found [here](http://tinyvga.com/vga-timing/640x480@60Hz).

There is a 12-bit data input to the Pmod so only 12-bit colour is supported ~~but may be able to implement 24-bit colour mode by sending data using both rising and falling edges of clock.~~

24-bit requires a different physical version of the Pmod.
##
Display Driver uses DDR3 memory to hold frame data. A controller will read out signals and addresses for the memory to output data, both will read into the DVI Pmod.

~~The MIG that interfaces with the DDR3 memory on-board is not practical to use without using its AXI interface, this is unfortunate as I would have preferred to implement it in pure RTL~~ (block RAM is not large enough to hold the framebuffer).

Trying to implement Xilinx's MicroBlaze and other IPs deemed too unintuitive and inconvenient. Will re-approach in full RTL but with no frame buffer (demo by streaming hard-written pixel data instead).

I may try to interface with the DDR3 module without AXI in future.
##
Possible expansion to use [STM32 Nucleo-C031C6](https://www.st.com/en/evaluation-tools/nucleo-c031c6.html) that sends alternating pixel data to FPGA over SPI/I2C/UART protocol.
