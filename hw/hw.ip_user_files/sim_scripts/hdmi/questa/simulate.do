onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib hdmi_opt

do {wave.do}

view wave
view structure
view signals

do {hdmi.udo}

run -all

quit -force
