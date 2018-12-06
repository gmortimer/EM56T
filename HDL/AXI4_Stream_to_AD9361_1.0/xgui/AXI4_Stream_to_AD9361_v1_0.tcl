
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AXI4_Stream_to_AD9361_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Configuration}]
  set C_N_CHANS [ipgui::add_param $IPINST -name "C_N_CHANS" -parent ${Page_0} -layout horizontal]
  set_property tooltip {1 or 2 for AD9361, 1 for AD9364} ${C_N_CHANS}
  set C_DAC_DATA_WIDTH [ipgui::add_param $IPINST -name "C_DAC_DATA_WIDTH" -parent ${Page_0}]
  set_property tooltip {For Information, is 16.} ${C_DAC_DATA_WIDTH}
  set C_DAC_BITS [ipgui::add_param $IPINST -name "C_DAC_BITS" -parent ${Page_0}]
  set_property tooltip {For info. Is 12.} ${C_DAC_BITS}
  set C_S_AXIS_DAC_DATA_TDATA_WIDTH [ipgui::add_param $IPINST -name "C_S_AXIS_DAC_DATA_TDATA_WIDTH" -parent ${Page_0}]
  set_property tooltip {For information, is number of chans x 2 x DAC port width} ${C_S_AXIS_DAC_DATA_TDATA_WIDTH}


}

proc update_PARAM_VALUE.C_S_AXIS_DAC_DATA_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_DAC_DATA_TDATA_WIDTH PARAM_VALUE.C_N_CHANS PARAM_VALUE.C_DAC_BITS } {
	# Procedure called to update C_S_AXIS_DAC_DATA_TDATA_WIDTH when any of the dependent parameters in the arguments change
	
	set C_S_AXIS_DAC_DATA_TDATA_WIDTH ${PARAM_VALUE.C_S_AXIS_DAC_DATA_TDATA_WIDTH}
	set C_N_CHANS ${PARAM_VALUE.C_N_CHANS}
	set C_DAC_BITS ${PARAM_VALUE.C_DAC_BITS}
	set values(C_N_CHANS) [get_property value $C_N_CHANS]
	set values(C_DAC_BITS) [get_property value $C_DAC_BITS]
	set_property value [gen_USERPARAMETER_C_S_AXIS_DAC_DATA_TDATA_WIDTH_VALUE $values(C_N_CHANS) $values(C_DAC_BITS)] $C_S_AXIS_DAC_DATA_TDATA_WIDTH
}

proc validate_PARAM_VALUE.C_S_AXIS_DAC_DATA_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_DAC_DATA_TDATA_WIDTH } {
	# Procedure called to validate C_S_AXIS_DAC_DATA_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_DAC_BITS { PARAM_VALUE.C_DAC_BITS } {
	# Procedure called to update C_DAC_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DAC_BITS { PARAM_VALUE.C_DAC_BITS } {
	# Procedure called to validate C_DAC_BITS
	return true
}

proc update_PARAM_VALUE.C_DAC_DATA_WIDTH { PARAM_VALUE.C_DAC_DATA_WIDTH } {
	# Procedure called to update C_DAC_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DAC_DATA_WIDTH { PARAM_VALUE.C_DAC_DATA_WIDTH } {
	# Procedure called to validate C_DAC_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_N_CHANS { PARAM_VALUE.C_N_CHANS } {
	# Procedure called to update C_N_CHANS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_N_CHANS { PARAM_VALUE.C_N_CHANS } {
	# Procedure called to validate C_N_CHANS
	return true
}


proc update_MODELPARAM_VALUE.C_N_CHANS { MODELPARAM_VALUE.C_N_CHANS PARAM_VALUE.C_N_CHANS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_N_CHANS}] ${MODELPARAM_VALUE.C_N_CHANS}
}

proc update_MODELPARAM_VALUE.C_DAC_DATA_WIDTH { MODELPARAM_VALUE.C_DAC_DATA_WIDTH PARAM_VALUE.C_DAC_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DAC_DATA_WIDTH}] ${MODELPARAM_VALUE.C_DAC_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_DAC_DATA_TDATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_DAC_DATA_TDATA_WIDTH PARAM_VALUE.C_S_AXIS_DAC_DATA_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_DAC_DATA_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_DAC_DATA_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_DAC_BITS { MODELPARAM_VALUE.C_DAC_BITS PARAM_VALUE.C_DAC_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DAC_BITS}] ${MODELPARAM_VALUE.C_DAC_BITS}
}

