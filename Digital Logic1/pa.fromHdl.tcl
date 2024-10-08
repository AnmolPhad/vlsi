
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Digital_Logic -dir "D:/1._Development_board/FPGA 6 DVK/5. NEW SPARTANCE-6 VHDL CODE(LGSA17-252_V1.2)/NEW SPARTANCE-6 VHDL CODE/Digital_Logic/planAhead_run_1" -part xc6slx9tqg144-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Logic.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Digital_Logic.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top test $srcset
add_files [list {Logic.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-2
