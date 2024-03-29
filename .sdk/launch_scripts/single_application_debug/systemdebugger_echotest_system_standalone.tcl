connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351A819C8A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351A819C8A-13722093-0"}
fpga -file C:/Users/DSmac/workspace/ZyboHelloVitis/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/DSmac/workspace/ZyboHelloVitis/export/ZyboHelloVitis/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/DSmac/workspace/helloWorld/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/DSmac/workspace/helloWorld/Debug/helloWorld.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
