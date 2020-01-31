setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/Desktop/Diseno de Sistemas Digitales/Experimentos/7seg/sim/sim.adf"]} { 
	design create sim "D:/Desktop/Diseno de Sistemas Digitales/Experimentos/7seg"
  set newDesign 1
}
design open "D:/Desktop/Diseno de Sistemas Digitales/Experimentos/7seg/sim"
cd "D:/Desktop/Diseno de Sistemas Digitales/Experimentos/7seg"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/Desktop/Diseno de Sistemas Digitales/Experimentos/7seg/sietesegm.vhd"
vlib "D:/Desktop/Diseno de Sistemas Digitales/Experimentos/7seg/sim/work"
set worklib work
adel -all
vcom -dbg -work work "D:/Desktop/Diseno de Sistemas Digitales/Experimentos/7seg/sietesegm.vhd"
entity sieteSegmentos
vsim  +access +r sieteSegmentos   -PL pmi_work -L ovi_machxo2
add wave *
run 1000ns
