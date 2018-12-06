# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Setup}]
  ipgui::add_param $IPINST -name "C_M_AXIS_K_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  set C_K_MODE [ipgui::add_param $IPINST -name "C_K_MODE" -parent ${Page_0}]
  set_property tooltip {Continuous (tvalid always = '1') or one-shot (tvalid de-asserted after transfer)} ${C_K_MODE}
  set C_USE_TRIG_IN [ipgui::add_param $IPINST -name "C_USE_TRIG_IN" -parent ${Page_0}]
  set_property tooltip {Use external trigger input to retransmit value} ${C_USE_TRIG_IN}
  ipgui::add_param $IPINST -name "C_K_VALUE" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_K_MODE { PARAM_VALUE.C_K_MODE } {
	# Procedure called to update C_K_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_K_MODE { PARAM_VALUE.C_K_MODE } {
	# Procedure called to validate C_K_MODE
	return true
}

proc update_PARAM_VALUE.C_K_VALUE { PARAM_VALUE.C_K_VALUE } {
	# Procedure called to update C_K_VALUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_K_VALUE { PARAM_VALUE.C_K_VALUE } {
	# Procedure called to validate C_K_VALUE
	return true
}

proc update_PARAM_VALUE.C_USE_TRIG_IN { PARAM_VALUE.C_USE_TRIG_IN } {
	# Procedure called to update C_USE_TRIG_IN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_USE_TRIG_IN { PARAM_VALUE.C_USE_TRIG_IN } {
	# Procedure called to validate C_USE_TRIG_IN
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_K_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_K_TDATA_WIDTH } {
	# Procedure called to update C_M_AXIS_K_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_K_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_K_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_K_TDATA_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.C_M_AXIS_K_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_K_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_K_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_K_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_K_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_K_MODE { MODELPARAM_VALUE.C_K_MODE PARAM_VALUE.C_K_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_K_MODE}] ${MODELPARAM_VALUE.C_K_MODE}
}

proc update_MODELPARAM_VALUE.C_K_VALUE { MODELPARAM_VALUE.C_K_VALUE PARAM_VALUE.C_K_VALUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_K_VALUE}] ${MODELPARAM_VALUE.C_K_VALUE}
}

proc update_MODELPARAM_VALUE.C_USE_TRIG_IN { MODELPARAM_VALUE.C_USE_TRIG_IN PARAM_VALUE.C_USE_TRIG_IN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_USE_TRIG_IN}] ${MODELPARAM_VALUE.C_USE_TRIG_IN}
}

