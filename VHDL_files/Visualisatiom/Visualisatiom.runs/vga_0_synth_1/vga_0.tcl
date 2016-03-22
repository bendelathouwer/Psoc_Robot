# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.cache/wt [current_project]
set_property parent.project_path C:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_repo_paths {{c:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/ip files/Basys3-master/Library}} [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_ip c:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.srcs/sources_1/ip/vga_0/vga_0.xci
set_property is_locked true [get_files c:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.srcs/sources_1/ip/vga_0/vga_0.xci]

synth_design -top vga_0 -part xc7a35tcpg236-1 -mode out_of_context
rename_ref -prefix_all vga_0_
write_checkpoint -noxdef vga_0.dcp
catch { report_utilization -file vga_0_utilization_synth.rpt -pb vga_0_utilization_synth.pb }
if { [catch {
  file copy -force C:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.runs/vga_0_synth_1/vga_0.dcp c:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.srcs/sources_1/ip/vga_0/vga_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}
if { [catch {
  write_verilog -force -mode synth_stub c:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.srcs/sources_1/ip/vga_0/vga_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode synth_stub c:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.srcs/sources_1/ip/vga_0/vga_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_verilog -force -mode funcsim c:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.srcs/sources_1/ip/vga_0/vga_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode funcsim c:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.srcs/sources_1/ip/vga_0/vga_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if {[file isdir C:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.ip_user_files/ip/vga_0]} {
  catch { 
    file copy -force c:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.srcs/sources_1/ip/vga_0/vga_0_stub.v C:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.ip_user_files/ip/vga_0
  }
}

if {[file isdir C:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.ip_user_files/ip/vga_0]} {
  catch { 
    file copy -force c:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.srcs/sources_1/ip/vga_0/vga_0_stub.vhdl C:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.ip_user_files/ip/vga_0
  }
}
