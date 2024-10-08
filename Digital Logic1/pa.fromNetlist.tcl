
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Digital_Logic -dir "D:/1._Development_board/FPGA 6 DVK/5. NEW SPARTANCE-6 VHDL CODE(LGSA17-252_V1.2)/NEW SPARTANCE-6 VHDL CODE/Digital_Logic/planAhead_run_3" -part xc6slx9tqg144-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/1._Development_board/FPGA 6 DVK/5. NEW SPARTANCE-6 VHDL CODE(LGSA17-252_V1.2)/NEW SPARTANCE-6 VHDL CODE/Digital_Logic/test.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/1._Development_board/FPGA 6 DVK/5. NEW SPARTANCE-6 VHDL CODE(LGSA17-252_V1.2)/NEW SPARTANCE-6 VHDL CODE/Digital_Logic} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Logic.ucf" [current_fileset -constrset]
add_files [list {Logic.ucf}] -fileset [get_property constrset [current_run]]
link_design
