# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Configuration}]
  ipgui::add_param $IPINST -name "C_EN_RSTN_I" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_EN_RSTP_I" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_EN_RSTN_O" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_EN_RSTP_O" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_EN_RSTN_I { PARAM_VALUE.C_EN_RSTN_I } {
	# Procedure called to update C_EN_RSTN_I when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_EN_RSTN_I { PARAM_VALUE.C_EN_RSTN_I } {
	# Procedure called to validate C_EN_RSTN_I
	return true
}

proc update_PARAM_VALUE.C_EN_RSTN_O { PARAM_VALUE.C_EN_RSTN_O } {
	# Procedure called to update C_EN_RSTN_O when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_EN_RSTN_O { PARAM_VALUE.C_EN_RSTN_O } {
	# Procedure called to validate C_EN_RSTN_O
	return true
}

proc update_PARAM_VALUE.C_EN_RSTP_I { PARAM_VALUE.C_EN_RSTP_I } {
	# Procedure called to update C_EN_RSTP_I when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_EN_RSTP_I { PARAM_VALUE.C_EN_RSTP_I } {
	# Procedure called to validate C_EN_RSTP_I
	return true
}

proc update_PARAM_VALUE.C_EN_RSTP_O { PARAM_VALUE.C_EN_RSTP_O } {
	# Procedure called to update C_EN_RSTP_O when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_EN_RSTP_O { PARAM_VALUE.C_EN_RSTP_O } {
	# Procedure called to validate C_EN_RSTP_O
	return true
}


proc update_MODELPARAM_VALUE.C_EN_RSTN_I { MODELPARAM_VALUE.C_EN_RSTN_I PARAM_VALUE.C_EN_RSTN_I } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_EN_RSTN_I}] ${MODELPARAM_VALUE.C_EN_RSTN_I}
}

proc update_MODELPARAM_VALUE.C_EN_RSTP_I { MODELPARAM_VALUE.C_EN_RSTP_I PARAM_VALUE.C_EN_RSTP_I } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_EN_RSTP_I}] ${MODELPARAM_VALUE.C_EN_RSTP_I}
}

proc update_MODELPARAM_VALUE.C_EN_RSTN_O { MODELPARAM_VALUE.C_EN_RSTN_O PARAM_VALUE.C_EN_RSTN_O } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_EN_RSTN_O}] ${MODELPARAM_VALUE.C_EN_RSTN_O}
}

proc update_MODELPARAM_VALUE.C_EN_RSTP_O { MODELPARAM_VALUE.C_EN_RSTP_O PARAM_VALUE.C_EN_RSTP_O } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_EN_RSTP_O}] ${MODELPARAM_VALUE.C_EN_RSTP_O}
}

