# eec-180
spring quarter 2026 &lt;eec 180 lab files>
- seo bin: seohan@ucdavis.edu
- ishani: ipshah@ucdavis.edu

## lab 1
- [lab 1 report](https://docs.google.com/document/d/1KT2oVSxiOpu2G0G1LvucQaTIgcIPEeBYtNYl1De0ObU/edit?tab=t.0#heading=h.vclm2z2bqlbq)

to run simulations in modelsim's terminal: 
```terminal

vlog "C:/Users/binyh/OneDrive/Desktop/fulladder.v"
vlog "C:/Users/binyh/OneDrive/Desktop/8bit_fuladder.v"
vlog "C:/Users/binyh/OneDrive/Desktop/eightbit_fuladder_tb.v"

vsim eightbit_fuladder_tb
run -all
```

to run: 
```terminal
\\ must enable wsl (WSL for windows) in order to run test bench files in VS Code. i.e.,

wsl
cd /mnt/c/Users/binyh/OneDrive/Desktop 
iverilog -o ldz_4_sim ldz_4.v ldz_4_tb.v
vvp ldz_4_sim

iverilog -o tb_partI tb_partI.v ../synthesis/partI/partI.v
vvp tb_partI

iverilog -o tb_partII tb_partII.v ../synthesis/partII/partII.v ../hdl/dec_7seg_decoder.v
vvp tb_partII
gtkwave tb_partII.vcd
```
