
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/DEMODULATOR_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Demodulator}]
  ipgui::add_param $IPINST -name "C_M_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S_AXIS_TDATA_WIDTH" -parent ${Page_0} -widget comboBox
  set C_DEMOD_ADDR_WIDTH [ipgui::add_param $IPINST -name "C_DEMOD_ADDR_WIDTH" -parent ${Page_0}]
  set_property tooltip {Input To Demodulation Mapping Function. Symbol to be Demodulated.} ${C_DEMOD_ADDR_WIDTH}
  set C_DEMOD_DATA_WIDTH [ipgui::add_param $IPINST -name "C_DEMOD_DATA_WIDTH" -parent ${Page_0}]
  set_property tooltip {Output of Demodulation Mapping Function. Demodulated Information.} ${C_DEMOD_DATA_WIDTH}
  set C_NEG_ADDR_B [ipgui::add_param $IPINST -name "C_NEG_ADDR_B" -parent ${Page_0}]
  set_property tooltip {Allows for ascending lookup on I port and descending lookup on Q port} ${C_NEG_ADDR_B}
  ipgui::add_static_text $IPINST -name "Blank" -parent ${Page_0} -text { }
  ipgui::add_param $IPINST -name "C_DEMOD_MODE" -parent ${Page_0} -layout horizontal
  set C_BRAM_READ_LATENCY [ipgui::add_param $IPINST -name "C_BRAM_READ_LATENCY" -parent ${Page_0}]
  set_property tooltip {See Xilinx Block Memory Generator Manual. Default (Primitives Output Register used) is 2.} ${C_BRAM_READ_LATENCY}

  #Adding Page
  set PS_Interface [ipgui::add_page $IPINST -name "PS Interface"]
  ipgui::add_param $IPINST -name "C_S00_AXI_DATA_WIDTH" -parent ${PS_Interface} -widget comboBox
  set C_S00_AXI_ADDR_WIDTH [ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_WIDTH" -parent ${PS_Interface}]
  set_property tooltip {Width of S_AXI address bus} ${C_S00_AXI_ADDR_WIDTH}
  ipgui::add_param $IPINST -name "C_S00_AXI_BASEADDR" -parent ${PS_Interface}
  ipgui::add_param $IPINST -name "C_S00_AXI_HIGHADDR" -parent ${PS_Interface}


}

proc update_PARAM_VALUE.C_BRAM_READ_LATENCY { PARAM_VALUE.C_BRAM_READ_LATENCY } {
	# Procedure called to update C_BRAM_READ_LATENCY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BRAM_READ_LATENCY { PARAM_VALUE.C_BRAM_READ_LATENCY } {
	# Procedure called to validate C_BRAM_READ_LATENCY
	return true
}

proc update_PARAM_VALUE.C_DEMOD_ADDR_WIDTH { PARAM_VALUE.C_DEMOD_ADDR_WIDTH } {
	# Procedure called to update C_DEMOD_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DEMOD_ADDR_WIDTH { PARAM_VALUE.C_DEMOD_ADDR_WIDTH } {
	# Procedure called to validate C_DEMOD_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_DEMOD_DATA_WIDTH { PARAM_VALUE.C_DEMOD_DATA_WIDTH } {
	# Procedure called to update C_DEMOD_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DEMOD_DATA_WIDTH { PARAM_VALUE.C_DEMOD_DATA_WIDTH } {
	# Procedure called to validate C_DEMOD_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_DEMOD_MODE { PARAM_VALUE.C_DEMOD_MODE } {
	# Procedure called to update C_DEMOD_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DEMOD_MODE { PARAM_VALUE.C_DEMOD_MODE } {
	# Procedure called to validate C_DEMOD_MODE
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_NEG_ADDR_B { PARAM_VALUE.C_NEG_ADDR_B } {
	# Procedure called to update C_NEG_ADDR_B when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_NEG_ADDR_B { PARAM_VALUE.C_NEG_ADDR_B } {
	# Procedure called to validate C_NEG_ADDR_B
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to update C_S00_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to validate C_S00_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to update C_S00_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to validate C_S00_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_DEMOD_DATA_WIDTH { MODELPARAM_VALUE.C_DEMOD_DATA_WIDTH PARAM_VALUE.C_DEMOD_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DEMOD_DATA_WIDTH}] ${MODELPARAM_VALUE.C_DEMOD_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_DEMOD_ADDR_WIDTH { MODELPARAM_VALUE.C_DEMOD_ADDR_WIDTH PARAM_VALUE.C_DEMOD_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DEMOD_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_DEMOD_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_DEMOD_MODE { MODELPARAM_VALUE.C_DEMOD_MODE PARAM_VALUE.C_DEMOD_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DEMOD_MODE}] ${MODELPARAM_VALUE.C_DEMOD_MODE}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_BRAM_READ_LATENCY { MODELPARAM_VALUE.C_BRAM_READ_LATENCY PARAM_VALUE.C_BRAM_READ_LATENCY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BRAM_READ_LATENCY}] ${MODELPARAM_VALUE.C_BRAM_READ_LATENCY}
}

proc update_MODELPARAM_VALUE.C_NEG_ADDR_B { MODELPARAM_VALUE.C_NEG_ADDR_B PARAM_VALUE.C_NEG_ADDR_B } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_NEG_ADDR_B}] ${MODELPARAM_VALUE.C_NEG_ADDR_B}
}

