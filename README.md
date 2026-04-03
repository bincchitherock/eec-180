# eec-180
spring quarter 2026 &lt;eec 180 lab files>
- ipshah@ucdavis.edu
- seohan@ucdavis.edu

## lab 1
- dec_7seg_decoder.v (for part II) 
- tb_majority.v (for part 0) 
- tb_partI.v (for part I) 
- tb_partII.v (for part II)

```terminal
iverilog -o tb_partI tb_partI.v ../synthesis/partI/partI.v
vvp tb_partI

iverilog -o tb_partII tb_partII.v ../synthesis/partII/partII.v ../hdl/dec_7seg_decoder.v
vvp tb_partII
gtkwave tb_partII.vcd
```

- must enable WSL (for windows) in order to run test bench files. 
