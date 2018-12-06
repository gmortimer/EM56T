# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Ports}]
  ipgui::add_param $IPINST -name "C_AXIS_DATA_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  set C_N_PORTS_MASTER [ipgui::add_param $IPINST -name "C_N_PORTS_MASTER" -parent ${Page_0}]
  set_property tooltip {Max 32} ${C_N_PORTS_MASTER}
  set C_HAS_DELAY [ipgui::add_param $IPINST -name "C_HAS_DELAY" -parent ${Page_0}]
  set_property tooltip {Behaves as normal broadcaster if unchecked.} ${C_HAS_DELAY}
  set C_HAS_TLAST [ipgui::add_param $IPINST -name "C_HAS_TLAST" -parent ${Page_0}]
  set_property tooltip {If unconnected to input port defaults to constant zero.} ${C_HAS_TLAST}


}

proc update_PARAM_VALUE.C_AXIS_DATA_TDATA_WIDTH { PARAM_VALUE.C_AXIS_DATA_TDATA_WIDTH } {
	# Procedure called to update C_AXIS_DATA_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXIS_DATA_TDATA_WIDTH { PARAM_VALUE.C_AXIS_DATA_TDATA_WIDTH } {
	# Procedure called to validate C_AXIS_DATA_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_HAS_DELAY { PARAM_VALUE.C_HAS_DELAY } {
	# Procedure called to update C_HAS_DELAY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_HAS_DELAY { PARAM_VALUE.C_HAS_DELAY } {
	# Procedure called to validate C_HAS_DELAY
	return true
}

proc update_PARAM_VALUE.C_HAS_TLAST { PARAM_VALUE.C_HAS_TLAST } {
	# Procedure called to update C_HAS_TLAST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_HAS_TLAST { PARAM_VALUE.C_HAS_TLAST } {
	# Procedure called to validate C_HAS_TLAST
	return true
}

proc update_PARAM_VALUE.C_N_PORTS_MASTER { PARAM_VALUE.C_N_PORTS_MASTER } {
	# Procedure called to update C_N_PORTS_MASTER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_N_PORTS_MASTER { PARAM_VALUE.C_N_PORTS_MASTER } {
	# Procedure called to validate C_N_PORTS_MASTER
	return true
}


proc update_MODELPARAM_VALUE.C_AXIS_DATA_TDATA_WIDTH { MODELPARAM_VALUE.C_AXIS_DATA_TDATA_WIDTH PARAM_VALUE.C_AXIS_DATA_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXIS_DATA_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_AXIS_DATA_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_N_PORTS_MASTER { MODELPARAM_VALUE.C_N_PORTS_MASTER PARAM_VALUE.C_N_PORTS_MASTER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_N_PORTS_MASTER}] ${MODELPARAM_VALUE.C_N_PORTS_MASTER}
}

proc update_MODELPARAM_VALUE.C_HAS_TLAST { MODELPARAM_VALUE.C_HAS_TLAST PARAM_VALUE.C_HAS_TLAST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_HAS_TLAST}] ${MODELPARAM_VALUE.C_HAS_TLAST}
}

proc update_MODELPARAM_VALUE.C_HAS_DELAY { MODELPARAM_VALUE.C_HAS_DELAY PARAM_VALUE.C_HAS_DELAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_HAS_DELAY}] ${MODELPARAM_VALUE.C_HAS_DELAY}
}

