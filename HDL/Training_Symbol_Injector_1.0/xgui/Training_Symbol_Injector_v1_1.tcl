# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {PL Interface}]
  ipgui::add_param $IPINST -name "C_S_AXIS_DATA_TDATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_BUF_ADDR_WIDTH" -parent ${Page_0} -widget comboBox
  set C_BRAM_READ_LATENCY [ipgui::add_param $IPINST -name "C_BRAM_READ_LATENCY" -parent ${Page_0}]
  set_property tooltip {Xilinx BRAM defaults to 2 (primitives output register enabled).} ${C_BRAM_READ_LATENCY}
  set C_DEVICE_ID [ipgui::add_param $IPINST -name "C_DEVICE_ID" -parent ${Page_0}]
  set_property tooltip {Read from slave register 1 (31 downto 8)} ${C_DEVICE_ID}

  #Adding Page
  set PS_Interface [ipgui::add_page $IPINST -name "PS Interface"]
  ipgui::add_param $IPINST -name "C_S00_AXI_BASEADDR" -parent ${PS_Interface}
  ipgui::add_param $IPINST -name "C_S00_AXI_HIGHADDR" -parent ${PS_Interface}
  set C_S00_AXI_ADDR_WIDTH [ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_WIDTH" -parent ${PS_Interface}]
  set_property tooltip {Width of S_AXI address bus} ${C_S00_AXI_ADDR_WIDTH}
  set C_S00_AXI_DATA_WIDTH [ipgui::add_param $IPINST -name "C_S00_AXI_DATA_WIDTH" -parent ${PS_Interface} -widget comboBox]
  set_property tooltip {Width of S_AXI data bus} ${C_S00_AXI_DATA_WIDTH}


}

proc update_PARAM_VALUE.C_BRAM_READ_LATENCY { PARAM_VALUE.C_BRAM_READ_LATENCY } {
	# Procedure called to update C_BRAM_READ_LATENCY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BRAM_READ_LATENCY { PARAM_VALUE.C_BRAM_READ_LATENCY } {
	# Procedure called to validate C_BRAM_READ_LATENCY
	return true
}

proc update_PARAM_VALUE.C_BUF_ADDR_WIDTH { PARAM_VALUE.C_BUF_ADDR_WIDTH } {
	# Procedure called to update C_BUF_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BUF_ADDR_WIDTH { PARAM_VALUE.C_BUF_ADDR_WIDTH } {
	# Procedure called to validate C_BUF_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_DEVICE_ID { PARAM_VALUE.C_DEVICE_ID } {
	# Procedure called to update C_DEVICE_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DEVICE_ID { PARAM_VALUE.C_DEVICE_ID } {
	# Procedure called to validate C_DEVICE_ID
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_DATA_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_DATA_TDATA_WIDTH } {
	# Procedure called to update C_S_AXIS_DATA_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_DATA_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_DATA_TDATA_WIDTH } {
	# Procedure called to validate C_S_AXIS_DATA_TDATA_WIDTH
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

proc update_MODELPARAM_VALUE.C_BUF_ADDR_WIDTH { MODELPARAM_VALUE.C_BUF_ADDR_WIDTH PARAM_VALUE.C_BUF_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BUF_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_BUF_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_DATA_TDATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_DATA_TDATA_WIDTH PARAM_VALUE.C_S_AXIS_DATA_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_DATA_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_DATA_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_BRAM_READ_LATENCY { MODELPARAM_VALUE.C_BRAM_READ_LATENCY PARAM_VALUE.C_BRAM_READ_LATENCY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BRAM_READ_LATENCY}] ${MODELPARAM_VALUE.C_BRAM_READ_LATENCY}
}

proc update_MODELPARAM_VALUE.C_DEVICE_ID { MODELPARAM_VALUE.C_DEVICE_ID PARAM_VALUE.C_DEVICE_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DEVICE_ID}] ${MODELPARAM_VALUE.C_DEVICE_ID}
}

