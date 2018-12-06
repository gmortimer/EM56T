
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AXI4_STREAM_FROM_AD9361_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Configuration}]
  set C_N_CHANS [ipgui::add_param $IPINST -name "C_N_CHANS" -parent ${Page_0} -layout horizontal]
  set_property tooltip {For AD9361 1 or 2, for AD9364 1.} ${C_N_CHANS}
  set C_ADC_DATA_WIDTH [ipgui::add_param $IPINST -name "C_ADC_DATA_WIDTH" -parent ${Page_0}]
  set_property tooltip {For info. Is 16} ${C_ADC_DATA_WIDTH}
  set C_ADC_BITS [ipgui::add_param $IPINST -name "C_ADC_BITS" -parent ${Page_0}]
  set_property tooltip {For info. Is 12.} ${C_ADC_BITS}
  set C_M_AXIS_ADC_DATA_TDATA_WIDTH [ipgui::add_param $IPINST -name "C_M_AXIS_ADC_DATA_TDATA_WIDTH" -parent ${Page_0}]
  set_property tooltip {For info. Is 2 x number of channels x ADC bits.} ${C_M_AXIS_ADC_DATA_TDATA_WIDTH}


}

proc update_PARAM_VALUE.C_M_AXIS_ADC_DATA_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_ADC_DATA_TDATA_WIDTH PARAM_VALUE.C_N_CHANS PARAM_VALUE.C_ADC_BITS } {
	# Procedure called to update C_M_AXIS_ADC_DATA_TDATA_WIDTH when any of the dependent parameters in the arguments change
	
	set C_M_AXIS_ADC_DATA_TDATA_WIDTH ${PARAM_VALUE.C_M_AXIS_ADC_DATA_TDATA_WIDTH}
	set C_N_CHANS ${PARAM_VALUE.C_N_CHANS}
	set C_ADC_BITS ${PARAM_VALUE.C_ADC_BITS}
	set values(C_N_CHANS) [get_property value $C_N_CHANS]
	set values(C_ADC_BITS) [get_property value $C_ADC_BITS]
	set_property value [gen_USERPARAMETER_C_M_AXIS_ADC_DATA_TDATA_WIDTH_VALUE $values(C_N_CHANS) $values(C_ADC_BITS)] $C_M_AXIS_ADC_DATA_TDATA_WIDTH
}

proc validate_PARAM_VALUE.C_M_AXIS_ADC_DATA_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_ADC_DATA_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_ADC_DATA_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_ADC_BITS { PARAM_VALUE.C_ADC_BITS } {
	# Procedure called to update C_ADC_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_ADC_BITS { PARAM_VALUE.C_ADC_BITS } {
	# Procedure called to validate C_ADC_BITS
	return true
}

proc update_PARAM_VALUE.C_ADC_DATA_WIDTH { PARAM_VALUE.C_ADC_DATA_WIDTH } {
	# Procedure called to update C_ADC_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_ADC_DATA_WIDTH { PARAM_VALUE.C_ADC_DATA_WIDTH } {
	# Procedure called to validate C_ADC_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_N_CHANS { PARAM_VALUE.C_N_CHANS } {
	# Procedure called to update C_N_CHANS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_N_CHANS { PARAM_VALUE.C_N_CHANS } {
	# Procedure called to validate C_N_CHANS
	return true
}


proc update_MODELPARAM_VALUE.C_M_AXIS_ADC_DATA_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_ADC_DATA_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_ADC_DATA_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_ADC_DATA_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_ADC_DATA_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_N_CHANS { MODELPARAM_VALUE.C_N_CHANS PARAM_VALUE.C_N_CHANS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_N_CHANS}] ${MODELPARAM_VALUE.C_N_CHANS}
}

proc update_MODELPARAM_VALUE.C_ADC_DATA_WIDTH { MODELPARAM_VALUE.C_ADC_DATA_WIDTH PARAM_VALUE.C_ADC_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_ADC_DATA_WIDTH}] ${MODELPARAM_VALUE.C_ADC_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_ADC_BITS { MODELPARAM_VALUE.C_ADC_BITS PARAM_VALUE.C_ADC_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_ADC_BITS}] ${MODELPARAM_VALUE.C_ADC_BITS}
}

