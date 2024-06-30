## **FPGA Display Driver**

Only constraints provided are for board [Diligent Arty S7-50](https://digilent.com/reference/programmable-logic/arty-s7/start).

Will support HDMI displays, but uses the [TFP410](https://www.ti.com/product/TFP410?bm-verify=AAQAAAAJ_____4FHhq0tasmGcMa9prB263ygBXKuQsg_7dFPQxqPj-rxjDq3Wz-KMwdWiaZPfFitZpzsQEb5PnOWoiFK_uhZgAUW4UbhSwdYekf2fASXAnQYFyLCRG_2hJsqGTNi5QGg7Ag2gQt9vrdOY7xv_pJNGnVYtEuejURS8mvi3uo1ucTJKcjBs50Lr7vSwaSH-x890nJySP_DOJkcuBanTBoBXxGmV1ndTiKhCRhdKEZFPZ85CoH9oSvj66mEmEn1QEq0_QgDrftPm_UCKhtHbHBJ0zB84tAHoY4uRC5rybUwOwChhko) IC which uses the standard DVI protocol (compatible with HDMI). Device is implemented via [1BitSquared 12-bit DVI Pmod.](https://1bitsquared.com/products/pmod-digital-video-interface)

First iteration will aim to only support 640x480 resolution. Signal timings for 60Hz can be found [here](http://tinyvga.com/vga-timing/640x480@60Hz).
There is a 12-bit data input to the Pmod so only 12-bit colour is supported ~~but may be able to implement 24-bit colour mode by sending data using both rising and falling edges of clock.~~ 24-bit requires a different physical version of the Pmod.
