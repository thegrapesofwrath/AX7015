connect -url tcp:127.0.0.1:3121
source F:/ax7015/demo/ps_axi_led/ps_axi_led.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS1 210249854706"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-HS1 210249854706" && level==0} -index 1
fpga -file F:/ax7015/demo/ps_axi_led/ps_axi_led.sdk/design_1_wrapper_hw_platform_0/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS1 210249854706"} -index 0
loadhw -hw F:/ax7015/demo/ps_axi_led/ps_axi_led.sdk/design_1_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS1 210249854706"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS1 210249854706"} -index 0
dow F:/ax7015/demo/ps_axi_led/ps_axi_led.sdk/axi_led/Debug/axi_led.elf
configparams force-mem-access 0
bpadd -addr &main