# eec-180
spring quarter 2026 &lt;eec 180 lab files>
- ipshah@ucdavis.edu
- seohan@ucdavis.edu

## lab 1
- [lab 1 report](https://docs.google.com/document/d/1KT2oVSxiOpu2G0G1LvucQaTIgcIPEeBYtNYl1De0ObU/edit?tab=t.0#heading=h.vclm2z2bqlbq)

```terminal
iverilog -o tb_partI tb_partI.v ../synthesis/partI/partI.v
vvp tb_partI

iverilog -o tb_partII tb_partII.v ../synthesis/partII/partII.v ../hdl/dec_7seg_decoder.v
vvp tb_partII
gtkwave tb_partII.vcd
```

- must enable WSL (for windows) in order to run test bench files. 
