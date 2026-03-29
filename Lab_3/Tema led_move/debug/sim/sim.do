vlib work
vmap work work

vlog  ../../hdl/colocviu_0.v
vlog  ../hdl/colocviu_0_test.v

vsim work.colocviu_0_test
do  wave.do

add log -r /*

run -all

