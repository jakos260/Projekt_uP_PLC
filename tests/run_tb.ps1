# run cmd -> 

param (
    [string]$files_to_tb_path
)
# Remove-Item -Path ./tests/up_tb.vvp
# Remove-Item -Path ./tests/up_tb.vcd

$files = Get-Content $files_to_tb_path
iverilog -o tests/up_tb.vvp ./tests/up_tb.v $files
vvp tests/up_tb.vvp
gtkwave -f ./tests/up_tb.vcd ./tests/up_tb.gtkw