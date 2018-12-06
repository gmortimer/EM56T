
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/FFT_Controller_v2_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {PL Interface}]
  set C_M_AXIS_CONFIG_TDATA_WIDTH [ipgui::add_param $IPINST -name "C_M_AXIS_CONFIG_TDATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {See Xilinx FFT IP block documentation for various possible sizes} ${C_M_AXIS_CONFIG_TDATA_WIDTH}
  ipgui::add_param $IPINST -name "C_HAS_DIAGS" -parent ${Page_0}
  set CFG_EXT_EN [ipgui::add_param $IPINST -name "CFG_EXT_EN" -parent ${Page_0}]
  set_property tooltip {Can be used in PS mode, mandatory in constant mode} ${CFG_EXT_EN}
  set C_CFG_CONST [ipgui::add_param $IPINST -name "C_CFG_CONST" -parent ${Page_0}]
  set_property tooltip {Needs external config input} ${C_CFG_CONST}
  set C_CFG_FFT_DATA [ipgui::add_param $IPINST -name "C_CFG_FFT_DATA" -parent ${Page_0}]
  set_property tooltip {Use only when constant selected} ${C_CFG_FFT_DATA}
  ipgui::add_static_text $IPINST -name "." -parent ${Page_0} -text {}
  set C_DEVICE_ID [ipgui::add_param $IPINST -name "C_DEVICE_ID" -parent ${Page_0}]
  set_property tooltip {Read this from slave register 1 (31 downto 8)} ${C_DEVICE_ID}

  #Adding Page
  set PS_Interface [ipgui::add_page $IPINST -name "PS Interface"]
  ipgui::add_param $IPINST -name "C_S00_AXI_HIGHADDR" -parent ${PS_Interface}
  ipgui::add_param $IPINST -name "C_S00_AXI_BASEADDR" -parent ${PS_Interface}
  set C_S00_AXI_ADDR_WIDTH [ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_WIDTH" -parent ${PS_Interface}]
  set_property tooltip {Width of S_AXI address bus} ${C_S00_AXI_ADDR_WIDTH}
  set C_S00_AXI_DATA_WIDTH [ipgui::add_param $IPINST -name "C_S00_AXI_DATA_WIDTH" -parent ${PS_Interface} -widget comboBox]
  set_property tooltip {Width of S_AXI data bus} ${C_S00_AXI_DATA_WIDTH}


}

proc update_PARAM_VALUE.CFG_EXT_EN { PARAM_VALUE.CFG_EXT_EN PARAM_VALUE.C_CFG_CONST } {
	# Procedure called to update CFG_EXT_EN when any of the dependent parameters in the arguments change
	
	set CFG_EXT_EN ${PARAM_VALUE.CFG_EXT_EN}
	set C_CFG_CONST ${PARAM_VALUE.C_CFG_CONST}
	set values(C_CFG_CONST) [get_property value $C_CFG_CONST]
	if { [gen_USERPARAMETER_CFG_EXT_EN_ENABLEMENT $values(C_CFG_CONST)] } {
		set_property enabled true $CFG_EXT_EN
	} else {
		set_property enabled false $CFG_EXT_EN
	}
}

proc validate_PARAM_VALUE.CFG_EXT_EN { PARAM_VALUE.CFG_EXT_EN } {
	# Procedure called to validate CFG_EXT_EN
	return true
}

proc update_PARAM_VALUE.C_CFG_EXT_EN { PARAM_VALUE.C_CFG_EXT_EN PARAM_VALUE.C_CFG_CONST PARAM_VALUE.CFG_EXT_EN } {
	# Procedure called to update C_CFG_EXT_EN when any of the dependent parameters in the arguments change
	
	set C_CFG_EXT_EN ${PARAM_VALUE.C_CFG_EXT_EN}
	set C_CFG_CONST ${PARAM_VALUE.C_CFG_CONST}
	set CFG_EXT_EN ${PARAM_VALUE.CFG_EXT_EN}
	set values(C_CFG_CONST) [get_property value $C_CFG_CONST]
	set values(CFG_EXT_EN) [get_property value $CFG_EXT_EN]
	set_property value [gen_USERPARAMETER_C_CFG_EXT_EN_VALUE $values(C_CFG_CONST) $values(CFG_EXT_EN)] $C_CFG_EXT_EN
}

proc validate_PARAM_VALUE.C_CFG_EXT_EN { PARAM_VALUE.C_CFG_EXT_EN } {
	# Procedure called to validate C_CFG_EXT_EN
	return true
}

proc update_PARAM_VALUE.C_CFG_FFT_DATA { PARAM_VALUE.C_CFG_FFT_DATA PARAM_VALUE.C_CFG_CONST } {
	# Procedure called to update C_CFG_FFT_DATA when any of the dependent parameters in the arguments change
	
	set C_CFG_FFT_DATA ${PARAM_VALUE.C_CFG_FFT_DATA}
	set C_CFG_CONST ${PARAM_VALUE.C_CFG_CONST}
	set values(C_CFG_CONST) [get_property value $C_CFG_CONST]
	if { [gen_USERPARAMETER_C_CFG_FFT_DATA_ENABLEMENT $values(C_CFG_CONST)] } {
		set_property enabled true $C_CFG_FFT_DATA
	} else {
		set_property enabled false $C_CFG_FFT_DATA
	}
}

proc validate_PARAM_VALUE.C_CFG_FFT_DATA { PARAM_VALUE.C_CFG_FFT_DATA } {
	# Procedure called to validate C_CFG_FFT_DATA
	return true
}

proc update_PARAM_VALUE.C_CFG_CONST { PARAM_VALUE.C_CFG_CONST } {
	# Procedure called to update C_CFG_CONST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CFG_CONST { PARAM_VALUE.C_CFG_CONST } {
	# Procedure called to validate C_CFG_CONST
	return true
}

proc update_PARAM_VALUE.C_DEVICE_ID { PARAM_VALUE.C_DEVICE_ID } {
	# Procedure called to update C_DEVICE_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DEVICE_ID { PARAM_VALUE.C_DEVICE_ID } {
	# Procedure called to validate C_DEVICE_ID
	return true
}

proc update_PARAM_VALUE.C_HAS_DIAGS { PARAM_VALUE.C_HAS_DIAGS } {
	# Procedure called to update C_HAS_DIAGS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_HAS_DIAGS { PARAM_VALUE.C_HAS_DIAGS } {
	# Procedure called to validate C_HAS_DIAGS
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_CONFIG_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_CONFIG_TDATA_WIDTH } {
	# Procedure called to update C_M_AXIS_CONFIG_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_CONFIG_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_CONFIG_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_CONFIG_TDATA_WIDTH
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

proc update_MODELPARAM_VALUE.C_M_AXIS_CONFIG_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_CONFIG_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_CONFIG_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_CONFIG_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_CONFIG_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_DEVICE_ID { MODELPARAM_VALUE.C_DEVICE_ID PARAM_VALUE.C_DEVICE_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DEVICE_ID}] ${MODELPARAM_VALUE.C_DEVICE_ID}
}

proc update_MODELPARAM_VALUE.C_HAS_DIAGS { MODELPARAM_VALUE.C_HAS_DIAGS PARAM_VALUE.C_HAS_DIAGS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_HAS_DIAGS}] ${MODELPARAM_VALUE.C_HAS_DIAGS}
}

proc update_MODELPARAM_VALUE.C_CFG_EXT_EN { MODELPARAM_VALUE.C_CFG_EXT_EN PARAM_VALUE.C_CFG_EXT_EN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CFG_EXT_EN}] ${MODELPARAM_VALUE.C_CFG_EXT_EN}
}

proc update_MODELPARAM_VALUE.C_CFG_CONST { MODELPARAM_VALUE.C_CFG_CONST PARAM_VALUE.C_CFG_CONST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CFG_CONST}] ${MODELPARAM_VALUE.C_CFG_CONST}
}

proc update_MODELPARAM_VALUE.C_CFG_FFT_DATA { MODELPARAM_VALUE.C_CFG_FFT_DATA PARAM_VALUE.C_CFG_FFT_DATA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CFG_FFT_DATA}] ${MODELPARAM_VALUE.C_CFG_FFT_DATA}
}

proc update_MODELPARAM_VALUE.CFG_EXT_EN { MODELPARAM_VALUE.CFG_EXT_EN PARAM_VALUE.CFG_EXT_EN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_EXT_EN}] ${MODELPARAM_VALUE.CFG_EXT_EN}
}

