param (
    [string]$files_to_tb_path
)
$files = Get-Content $files_to_tb_path
iverilog -o tests/up_tb.vvp ./procesor_1_tb.v $files
vvp tests/up_tb.vvp
gtkwave -f ./tests/up_tb.vcd