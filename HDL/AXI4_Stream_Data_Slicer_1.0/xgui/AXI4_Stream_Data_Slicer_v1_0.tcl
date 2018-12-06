# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {AXI4 Bus}]
  ipgui::add_param $IPINST -name "C_S_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S_AXIS_TUSER_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_M_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_M_AXIS_TUSER_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_static_text $IPINST -name "blnk1" -parent ${Page_0} -text {}
  ipgui::add_static_text $IPINST -name "Mapping" -parent ${Page_0} -text {Before the map is applied, a concatenation of TUSER & TDATA is made.}
  ipgui::add_static_text $IPINST -name "Mapping2" -parent ${Page_0} -text {The map thus allows TUSER data to be moved to the TDATA channel or vice-versa.}
  set C_S_AXIS_MAP [ipgui::add_param $IPINST -name "C_S_AXIS_MAP" -parent ${Page_0}]
  set_property tooltip {Reads from right( lsb ) to left.} ${C_S_AXIS_MAP}
  set C_M_AXIS_MAP [ipgui::add_param $IPINST -name "C_M_AXIS_MAP" -parent ${Page_0}]
  set_property tooltip {Reads from right (lsb ) to left} ${C_M_AXIS_MAP}
  ipgui::add_static_text $IPINST -name "blnk2" -parent ${Page_0} -text { }
  ipgui::add_static_text $IPINST -name "Signext1" -parent ${Page_0} -text {Sign-extension is facilitated in two positions, to allow}
  ipgui::add_static_text $IPINST -name "Signext2" -parent ${Page_0} -text {for complex numbers encoded in a single word when up-sizeing.}
  set C_SEXT_R0 [ipgui::add_param $IPINST -name "C_SEXT_R0" -parent ${Page_0}]
  set_property tooltip {When upsizing data, allows sign to be preserved.} ${C_SEXT_R0}
  set C_SEXT_L0 [ipgui::add_param $IPINST -name "C_SEXT_L0" -parent ${Page_0}]
  set_property tooltip {Sign bit will be copied as far as this bit.} ${C_SEXT_L0}
  set C_SEXT_R1 [ipgui::add_param $IPINST -name "C_SEXT_R1" -parent ${Page_0}]
  set_property tooltip {Second sign extend option, intended to help with slicing of complex fixed point numbers stored in a single word.} ${C_SEXT_R1}
  set C_SEXT_L1 [ipgui::add_param $IPINST -name "C_SEXT_L1" -parent ${Page_0}]
  set_property tooltip {Second sign extend option, intended to help with slicing of complex fixed point numbers stored in a single word.} ${C_SEXT_L1}


}

proc update_PARAM_VALUE.C_M_AXIS_MAP { PARAM_VALUE.C_M_AXIS_MAP } {
	# Procedure called to update C_M_AXIS_MAP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_MAP { PARAM_VALUE.C_M_AXIS_MAP } {
	# Procedure called to validate C_M_AXIS_MAP
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_TUSER_WIDTH { PARAM_VALUE.C_M_AXIS_TUSER_WIDTH } {
	# Procedure called to update C_M_AXIS_TUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_TUSER_WIDTH { PARAM_VALUE.C_M_AXIS_TUSER_WIDTH } {
	# Procedure called to validate C_M_AXIS_TUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_SEXT_L0 { PARAM_VALUE.C_SEXT_L0 } {
	# Procedure called to update C_SEXT_L0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_SEXT_L0 { PARAM_VALUE.C_SEXT_L0 } {
	# Procedure called to validate C_SEXT_L0
	return true
}

proc update_PARAM_VALUE.C_SEXT_L1 { PARAM_VALUE.C_SEXT_L1 } {
	# Procedure called to update C_SEXT_L1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_SEXT_L1 { PARAM_VALUE.C_SEXT_L1 } {
	# Procedure called to validate C_SEXT_L1
	return true
}

proc update_PARAM_VALUE.C_SEXT_R0 { PARAM_VALUE.C_SEXT_R0 } {
	# Procedure called to update C_SEXT_R0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_SEXT_R0 { PARAM_VALUE.C_SEXT_R0 } {
	# Procedure called to validate C_SEXT_R0
	return true
}

proc update_PARAM_VALUE.C_SEXT_R1 { PARAM_VALUE.C_SEXT_R1 } {
	# Procedure called to update C_SEXT_R1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_SEXT_R1 { PARAM_VALUE.C_SEXT_R1 } {
	# Procedure called to validate C_SEXT_R1
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_MAP { PARAM_VALUE.C_S_AXIS_MAP } {
	# Procedure called to update C_S_AXIS_MAP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_MAP { PARAM_VALUE.C_S_AXIS_MAP } {
	# Procedure called to validate C_S_AXIS_MAP
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_TUSER_WIDTH { PARAM_VALUE.C_S_AXIS_TUSER_WIDTH } {
	# Procedure called to update C_S_AXIS_TUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_TUSER_WIDTH { PARAM_VALUE.C_S_AXIS_TUSER_WIDTH } {
	# Procedure called to validate C_S_AXIS_TUSER_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.C_S_AXIS_TUSER_WIDTH { MODELPARAM_VALUE.C_S_AXIS_TUSER_WIDTH PARAM_VALUE.C_S_AXIS_TUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_TUSER_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_TUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_TUSER_WIDTH { MODELPARAM_VALUE.C_M_AXIS_TUSER_WIDTH PARAM_VALUE.C_M_AXIS_TUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_TUSER_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_TUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_MAP { MODELPARAM_VALUE.C_S_AXIS_MAP PARAM_VALUE.C_S_AXIS_MAP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_MAP}] ${MODELPARAM_VALUE.C_S_AXIS_MAP}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_MAP { MODELPARAM_VALUE.C_M_AXIS_MAP PARAM_VALUE.C_M_AXIS_MAP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_MAP}] ${MODELPARAM_VALUE.C_M_AXIS_MAP}
}

proc update_MODELPARAM_VALUE.C_SEXT_R0 { MODELPARAM_VALUE.C_SEXT_R0 PARAM_VALUE.C_SEXT_R0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_SEXT_R0}] ${MODELPARAM_VALUE.C_SEXT_R0}
}

proc update_MODELPARAM_VALUE.C_SEXT_L0 { MODELPARAM_VALUE.C_SEXT_L0 PARAM_VALUE.C_SEXT_L0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_SEXT_L0}] ${MODELPARAM_VALUE.C_SEXT_L0}
}

proc update_MODELPARAM_VALUE.C_SEXT_R1 { MODELPARAM_VALUE.C_SEXT_R1 PARAM_VALUE.C_SEXT_R1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_SEXT_R1}] ${MODELPARAM_VALUE.C_SEXT_R1}
}

proc update_MODELPARAM_VALUE.C_SEXT_L1 { MODELPARAM_VALUE.C_SEXT_L1 PARAM_VALUE.C_SEXT_L1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_SEXT_L1}] ${MODELPARAM_VALUE.C_SEXT_L1}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH}
}

