
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/bitsel_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  set C_INPUT_SIZE [ipgui::add_param $IPINST -name "C_INPUT_SIZE"]
  set_property tooltip {Bus msb referred to input} ${C_INPUT_SIZE}
  #Adding Page
  set Bits_0-31 [ipgui::add_page $IPINST -name "Bits 0-31" -layout horizontal]
  #Adding Group
  set Bits_0-7 [ipgui::add_group $IPINST -name "Bits 0-7" -parent ${Bits_0-31}]
  #Adding Group
  set Bit_0 [ipgui::add_group $IPINST -name "Bit 0" -parent ${Bits_0-7} -layout horizontal]
  set C_BIT_SEL_0 [ipgui::add_param $IPINST -name "C_BIT_SEL_0" -parent ${Bit_0} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_0}
  set C_BIT_EN_0 [ipgui::add_param $IPINST -name "C_BIT_EN_0" -parent ${Bit_0}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_0}

  #Adding Group
  set Bit_1 [ipgui::add_group $IPINST -name "Bit 1" -parent ${Bits_0-7} -layout horizontal]
  set C_BIT_SEL_1 [ipgui::add_param $IPINST -name "C_BIT_SEL_1" -parent ${Bit_1} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_1}
  set C_BIT_EN_1 [ipgui::add_param $IPINST -name "C_BIT_EN_1" -parent ${Bit_1}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_1}

  #Adding Group
  set Bit_2 [ipgui::add_group $IPINST -name "Bit 2" -parent ${Bits_0-7} -layout horizontal]
  set C_BIT_SEL_2 [ipgui::add_param $IPINST -name "C_BIT_SEL_2" -parent ${Bit_2} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_2}
  set C_BIT_EN_2 [ipgui::add_param $IPINST -name "C_BIT_EN_2" -parent ${Bit_2}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_2}

  #Adding Group
  set Bit_3 [ipgui::add_group $IPINST -name "Bit 3" -parent ${Bits_0-7} -layout horizontal]
  set C_BIT_SEL_3 [ipgui::add_param $IPINST -name "C_BIT_SEL_3" -parent ${Bit_3} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_3}
  set C_BIT_EN_3 [ipgui::add_param $IPINST -name "C_BIT_EN_3" -parent ${Bit_3}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_3}

  #Adding Group
  set Bit_4 [ipgui::add_group $IPINST -name "Bit 4" -parent ${Bits_0-7} -layout horizontal]
  set C_BIT_SEL_4 [ipgui::add_param $IPINST -name "C_BIT_SEL_4" -parent ${Bit_4} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_4}
  set C_BIT_EN_4 [ipgui::add_param $IPINST -name "C_BIT_EN_4" -parent ${Bit_4}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_4}

  #Adding Group
  set Bit_5 [ipgui::add_group $IPINST -name "Bit 5" -parent ${Bits_0-7} -layout horizontal]
  set C_BIT_SEL_5 [ipgui::add_param $IPINST -name "C_BIT_SEL_5" -parent ${Bit_5} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_5}
  set C_BIT_EN_5 [ipgui::add_param $IPINST -name "C_BIT_EN_5" -parent ${Bit_5}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_5}

  #Adding Group
  set Bit_6 [ipgui::add_group $IPINST -name "Bit 6" -parent ${Bits_0-7} -layout horizontal]
  set C_BIT_SEL_6 [ipgui::add_param $IPINST -name "C_BIT_SEL_6" -parent ${Bit_6} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_6}
  set C_BIT_EN_6 [ipgui::add_param $IPINST -name "C_BIT_EN_6" -parent ${Bit_6}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_6}

  #Adding Group
  set Bit_7 [ipgui::add_group $IPINST -name "Bit 7" -parent ${Bits_0-7} -layout horizontal]
  set C_BIT_SEL_7 [ipgui::add_param $IPINST -name "C_BIT_SEL_7" -parent ${Bit_7} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_7}
  set C_BIT_EN_7 [ipgui::add_param $IPINST -name "C_BIT_EN_7" -parent ${Bit_7}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_7}


  #Adding Group
  set Bits_8-15 [ipgui::add_group $IPINST -name "Bits 8-15" -parent ${Bits_0-31}]
  #Adding Group
  set Bit_8 [ipgui::add_group $IPINST -name "Bit 8" -parent ${Bits_8-15} -layout horizontal]
  set C_BIT_SEL_8 [ipgui::add_param $IPINST -name "C_BIT_SEL_8" -parent ${Bit_8} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_8}
  set C_BIT_EN_8 [ipgui::add_param $IPINST -name "C_BIT_EN_8" -parent ${Bit_8}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_8}

  #Adding Group
  set Bit_9 [ipgui::add_group $IPINST -name "Bit 9" -parent ${Bits_8-15} -layout horizontal]
  set C_BIT_SEL_9 [ipgui::add_param $IPINST -name "C_BIT_SEL_9" -parent ${Bit_9} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_9}
  set C_BIT_EN_9 [ipgui::add_param $IPINST -name "C_BIT_EN_9" -parent ${Bit_9}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_9}

  #Adding Group
  set Bit_10 [ipgui::add_group $IPINST -name "Bit 10" -parent ${Bits_8-15} -layout horizontal]
  set C_BIT_SEL_10 [ipgui::add_param $IPINST -name "C_BIT_SEL_10" -parent ${Bit_10} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_10}
  set C_BIT_EN_10 [ipgui::add_param $IPINST -name "C_BIT_EN_10" -parent ${Bit_10}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_10}

  #Adding Group
  set Bit_11 [ipgui::add_group $IPINST -name "Bit 11" -parent ${Bits_8-15} -layout horizontal]
  set C_BIT_SEL_11 [ipgui::add_param $IPINST -name "C_BIT_SEL_11" -parent ${Bit_11} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_11}
  set C_BIT_EN_11 [ipgui::add_param $IPINST -name "C_BIT_EN_11" -parent ${Bit_11}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_11}

  #Adding Group
  set Bit_12 [ipgui::add_group $IPINST -name "Bit 12" -parent ${Bits_8-15} -layout horizontal]
  set C_BIT_SEL_12 [ipgui::add_param $IPINST -name "C_BIT_SEL_12" -parent ${Bit_12} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_12}
  set C_BIT_EN_12 [ipgui::add_param $IPINST -name "C_BIT_EN_12" -parent ${Bit_12}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_12}

  #Adding Group
  set Bit_13 [ipgui::add_group $IPINST -name "Bit 13" -parent ${Bits_8-15} -layout horizontal]
  set C_BIT_SEL_13 [ipgui::add_param $IPINST -name "C_BIT_SEL_13" -parent ${Bit_13} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_13}
  set C_BIT_EN_13 [ipgui::add_param $IPINST -name "C_BIT_EN_13" -parent ${Bit_13}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_13}

  #Adding Group
  set Bit_14 [ipgui::add_group $IPINST -name "Bit 14" -parent ${Bits_8-15} -layout horizontal]
  set C_BIT_SEL_14 [ipgui::add_param $IPINST -name "C_BIT_SEL_14" -parent ${Bit_14} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_14}
  set C_BIT_EN_14 [ipgui::add_param $IPINST -name "C_BIT_EN_14" -parent ${Bit_14}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_14}

  #Adding Group
  set Bit_15 [ipgui::add_group $IPINST -name "Bit 15" -parent ${Bits_8-15} -layout horizontal]
  set C_BIT_SEL_15 [ipgui::add_param $IPINST -name "C_BIT_SEL_15" -parent ${Bit_15} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_15}
  set C_BIT_EN_15 [ipgui::add_param $IPINST -name "C_BIT_EN_15" -parent ${Bit_15}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_15}


  #Adding Group
  set Bits_16-23 [ipgui::add_group $IPINST -name "Bits 16-23" -parent ${Bits_0-31}]
  #Adding Group
  set Bit_16 [ipgui::add_group $IPINST -name "Bit 16" -parent ${Bits_16-23} -layout horizontal]
  set C_BIT_SEL_16 [ipgui::add_param $IPINST -name "C_BIT_SEL_16" -parent ${Bit_16} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_16}
  set C_BIT_EN_16 [ipgui::add_param $IPINST -name "C_BIT_EN_16" -parent ${Bit_16}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_16}

  #Adding Group
  set Bit_17 [ipgui::add_group $IPINST -name "Bit 17" -parent ${Bits_16-23} -layout horizontal]
  set C_BIT_SEL_17 [ipgui::add_param $IPINST -name "C_BIT_SEL_17" -parent ${Bit_17} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_17}
  set C_BIT_EN_17 [ipgui::add_param $IPINST -name "C_BIT_EN_17" -parent ${Bit_17}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_17}

  #Adding Group
  set Bit_18 [ipgui::add_group $IPINST -name "Bit 18" -parent ${Bits_16-23} -layout horizontal]
  set C_BIT_SEL_18 [ipgui::add_param $IPINST -name "C_BIT_SEL_18" -parent ${Bit_18} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_18}
  set C_BIT_EN_18 [ipgui::add_param $IPINST -name "C_BIT_EN_18" -parent ${Bit_18}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_18}

  #Adding Group
  set Bit_19 [ipgui::add_group $IPINST -name "Bit 19" -parent ${Bits_16-23} -layout horizontal]
  set C_BIT_SEL_19 [ipgui::add_param $IPINST -name "C_BIT_SEL_19" -parent ${Bit_19} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_19}
  set C_BIT_EN_19 [ipgui::add_param $IPINST -name "C_BIT_EN_19" -parent ${Bit_19}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_19}

  #Adding Group
  set Bit_20 [ipgui::add_group $IPINST -name "Bit 20" -parent ${Bits_16-23} -layout horizontal]
  set C_BIT_SEL_20 [ipgui::add_param $IPINST -name "C_BIT_SEL_20" -parent ${Bit_20} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_20}
  set C_BIT_EN_20 [ipgui::add_param $IPINST -name "C_BIT_EN_20" -parent ${Bit_20}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_20}

  #Adding Group
  set Bit_21 [ipgui::add_group $IPINST -name "Bit 21" -parent ${Bits_16-23} -layout horizontal]
  set C_BIT_SEL_21 [ipgui::add_param $IPINST -name "C_BIT_SEL_21" -parent ${Bit_21} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_21}
  set C_BIT_EN_21 [ipgui::add_param $IPINST -name "C_BIT_EN_21" -parent ${Bit_21}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_21}

  #Adding Group
  set Bit_22 [ipgui::add_group $IPINST -name "Bit 22" -parent ${Bits_16-23} -layout horizontal]
  set C_BIT_SEL_22 [ipgui::add_param $IPINST -name "C_BIT_SEL_22" -parent ${Bit_22} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_22}
  set C_BIT_EN_22 [ipgui::add_param $IPINST -name "C_BIT_EN_22" -parent ${Bit_22}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_22}

  #Adding Group
  set Bit_23 [ipgui::add_group $IPINST -name "Bit 23" -parent ${Bits_16-23} -layout horizontal]
  set C_BIT_SEL_23 [ipgui::add_param $IPINST -name "C_BIT_SEL_23" -parent ${Bit_23} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_23}
  set C_BIT_EN_23 [ipgui::add_param $IPINST -name "C_BIT_EN_23" -parent ${Bit_23}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_23}


  #Adding Group
  set Bits_24-31 [ipgui::add_group $IPINST -name "Bits 24-31" -parent ${Bits_0-31}]
  #Adding Group
  set Bit_24 [ipgui::add_group $IPINST -name "Bit 24" -parent ${Bits_24-31} -layout horizontal]
  set C_BIT_SEL_24 [ipgui::add_param $IPINST -name "C_BIT_SEL_24" -parent ${Bit_24} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_24}
  set C_BIT_EN_24 [ipgui::add_param $IPINST -name "C_BIT_EN_24" -parent ${Bit_24}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_24}

  #Adding Group
  set Bit_25 [ipgui::add_group $IPINST -name "Bit 25" -parent ${Bits_24-31} -layout horizontal]
  set C_BIT_SEL_25 [ipgui::add_param $IPINST -name "C_BIT_SEL_25" -parent ${Bit_25} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_25}
  set C_BIT_EN_25 [ipgui::add_param $IPINST -name "C_BIT_EN_25" -parent ${Bit_25}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_25}

  #Adding Group
  set Bit_26 [ipgui::add_group $IPINST -name "Bit 26" -parent ${Bits_24-31} -layout horizontal]
  set C_BIT_SEL_26 [ipgui::add_param $IPINST -name "C_BIT_SEL_26" -parent ${Bit_26} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_26}
  set C_BIT_EN_26 [ipgui::add_param $IPINST -name "C_BIT_EN_26" -parent ${Bit_26}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_26}

  #Adding Group
  set Bit_27 [ipgui::add_group $IPINST -name "Bit 27" -parent ${Bits_24-31} -layout horizontal]
  set C_BIT_SEL_27 [ipgui::add_param $IPINST -name "C_BIT_SEL_27" -parent ${Bit_27} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_27}
  set C_BIT_EN_27 [ipgui::add_param $IPINST -name "C_BIT_EN_27" -parent ${Bit_27}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_27}

  #Adding Group
  set Bit_28 [ipgui::add_group $IPINST -name "Bit 28" -parent ${Bits_24-31} -layout horizontal]
  set C_BIT_SEL_28 [ipgui::add_param $IPINST -name "C_BIT_SEL_28" -parent ${Bit_28} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_28}
  set C_BIT_EN_28 [ipgui::add_param $IPINST -name "C_BIT_EN_28" -parent ${Bit_28}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_28}

  #Adding Group
  set Bit_29 [ipgui::add_group $IPINST -name "Bit 29" -parent ${Bits_24-31} -layout horizontal]
  set C_BIT_SEL_29 [ipgui::add_param $IPINST -name "C_BIT_SEL_29" -parent ${Bit_29} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_29}
  set C_BIT_EN_29 [ipgui::add_param $IPINST -name "C_BIT_EN_29" -parent ${Bit_29}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_29}

  #Adding Group
  set Bit_30 [ipgui::add_group $IPINST -name "Bit 30" -parent ${Bits_24-31} -layout horizontal]
  set C_BIT_SEL_30 [ipgui::add_param $IPINST -name "C_BIT_SEL_30" -parent ${Bit_30} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_30}
  set C_BIT_EN_30 [ipgui::add_param $IPINST -name "C_BIT_EN_30" -parent ${Bit_30}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_30}

  #Adding Group
  set Bit_31 [ipgui::add_group $IPINST -name "Bit 31" -parent ${Bits_24-31} -layout horizontal]
  set C_BIT_SEL_31 [ipgui::add_param $IPINST -name "C_BIT_SEL_31" -parent ${Bit_31} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_31}
  set C_BIT_EN_31 [ipgui::add_param $IPINST -name "C_BIT_EN_31" -parent ${Bit_31}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_31}



  #Adding Page
  set Bits_32-63 [ipgui::add_page $IPINST -name "Bits 32-63" -layout horizontal]
  #Adding Group
  set Bits_32-39 [ipgui::add_group $IPINST -name "Bits 32-39" -parent ${Bits_32-63}]
  #Adding Group
  set Bit_32 [ipgui::add_group $IPINST -name "Bit 32" -parent ${Bits_32-39} -layout horizontal]
  set C_BIT_SEL_32 [ipgui::add_param $IPINST -name "C_BIT_SEL_32" -parent ${Bit_32} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_32}
  set C_BIT_EN_32 [ipgui::add_param $IPINST -name "C_BIT_EN_32" -parent ${Bit_32}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_32}

  #Adding Group
  set Bit_33 [ipgui::add_group $IPINST -name "Bit 33" -parent ${Bits_32-39} -layout horizontal]
  set C_BIT_SEL_33 [ipgui::add_param $IPINST -name "C_BIT_SEL_33" -parent ${Bit_33} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_33}
  set C_BIT_EN_33 [ipgui::add_param $IPINST -name "C_BIT_EN_33" -parent ${Bit_33}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_33}

  #Adding Group
  set Bit_34 [ipgui::add_group $IPINST -name "Bit 34" -parent ${Bits_32-39} -layout horizontal]
  set C_BIT_SEL_34 [ipgui::add_param $IPINST -name "C_BIT_SEL_34" -parent ${Bit_34} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_34}
  set C_BIT_EN_34 [ipgui::add_param $IPINST -name "C_BIT_EN_34" -parent ${Bit_34}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_34}

  #Adding Group
  set Bit_35 [ipgui::add_group $IPINST -name "Bit 35" -parent ${Bits_32-39} -layout horizontal]
  set C_BIT_SEL_35 [ipgui::add_param $IPINST -name "C_BIT_SEL_35" -parent ${Bit_35} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_35}
  set C_BIT_EN_35 [ipgui::add_param $IPINST -name "C_BIT_EN_35" -parent ${Bit_35}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_35}

  #Adding Group
  set Bit_36 [ipgui::add_group $IPINST -name "Bit 36" -parent ${Bits_32-39} -layout horizontal]
  set C_BIT_SEL_36 [ipgui::add_param $IPINST -name "C_BIT_SEL_36" -parent ${Bit_36} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_36}
  set C_BIT_EN_36 [ipgui::add_param $IPINST -name "C_BIT_EN_36" -parent ${Bit_36}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_36}

  #Adding Group
  set Bit_37 [ipgui::add_group $IPINST -name "Bit 37" -parent ${Bits_32-39} -layout horizontal]
  set C_BIT_SEL_37 [ipgui::add_param $IPINST -name "C_BIT_SEL_37" -parent ${Bit_37} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_37}
  set C_BIT_EN_37 [ipgui::add_param $IPINST -name "C_BIT_EN_37" -parent ${Bit_37}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_37}

  #Adding Group
  set Bit_38 [ipgui::add_group $IPINST -name "Bit 38" -parent ${Bits_32-39} -layout horizontal]
  set C_BIT_SEL_38 [ipgui::add_param $IPINST -name "C_BIT_SEL_38" -parent ${Bit_38} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_38}
  set C_BIT_EN_38 [ipgui::add_param $IPINST -name "C_BIT_EN_38" -parent ${Bit_38}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_38}

  #Adding Group
  set Bit_39 [ipgui::add_group $IPINST -name "Bit 39" -parent ${Bits_32-39} -layout horizontal]
  set C_BIT_SEL_39 [ipgui::add_param $IPINST -name "C_BIT_SEL_39" -parent ${Bit_39} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_39}
  set C_BIT_EN_39 [ipgui::add_param $IPINST -name "C_BIT_EN_39" -parent ${Bit_39}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_39}


  #Adding Group
  set Bits_40-47 [ipgui::add_group $IPINST -name "Bits 40-47" -parent ${Bits_32-63}]
  #Adding Group
  set Bit_40 [ipgui::add_group $IPINST -name "Bit 40" -parent ${Bits_40-47} -layout horizontal]
  set C_BIT_SEL_40 [ipgui::add_param $IPINST -name "C_BIT_SEL_40" -parent ${Bit_40} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_40}
  set C_BIT_EN_40 [ipgui::add_param $IPINST -name "C_BIT_EN_40" -parent ${Bit_40}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_40}

  #Adding Group
  set Bit_41 [ipgui::add_group $IPINST -name "Bit 41" -parent ${Bits_40-47} -layout horizontal]
  set C_BIT_SEL_41 [ipgui::add_param $IPINST -name "C_BIT_SEL_41" -parent ${Bit_41} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_41}
  set C_BIT_EN_41 [ipgui::add_param $IPINST -name "C_BIT_EN_41" -parent ${Bit_41}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_41}

  #Adding Group
  set Bit_42 [ipgui::add_group $IPINST -name "Bit 42" -parent ${Bits_40-47} -layout horizontal]
  set C_BIT_SEL_42 [ipgui::add_param $IPINST -name "C_BIT_SEL_42" -parent ${Bit_42} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_42}
  set C_BIT_EN_42 [ipgui::add_param $IPINST -name "C_BIT_EN_42" -parent ${Bit_42}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_42}

  #Adding Group
  set Bit_43 [ipgui::add_group $IPINST -name "Bit 43" -parent ${Bits_40-47} -layout horizontal]
  set C_BIT_SEL_43 [ipgui::add_param $IPINST -name "C_BIT_SEL_43" -parent ${Bit_43} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_43}
  set C_BIT_EN_43 [ipgui::add_param $IPINST -name "C_BIT_EN_43" -parent ${Bit_43}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_43}

  #Adding Group
  set Bit_44 [ipgui::add_group $IPINST -name "Bit 44" -parent ${Bits_40-47} -layout horizontal]
  set C_BIT_SEL_44 [ipgui::add_param $IPINST -name "C_BIT_SEL_44" -parent ${Bit_44} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_44}
  set C_BIT_EN_44 [ipgui::add_param $IPINST -name "C_BIT_EN_44" -parent ${Bit_44}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_44}

  #Adding Group
  set Bit_45 [ipgui::add_group $IPINST -name "Bit 45" -parent ${Bits_40-47} -layout horizontal]
  set C_BIT_SEL_45 [ipgui::add_param $IPINST -name "C_BIT_SEL_45" -parent ${Bit_45} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_45}
  set C_BIT_EN_45 [ipgui::add_param $IPINST -name "C_BIT_EN_45" -parent ${Bit_45}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_45}

  #Adding Group
  set Bit_46 [ipgui::add_group $IPINST -name "Bit 46" -parent ${Bits_40-47} -layout horizontal]
  set C_BIT_SEL_46 [ipgui::add_param $IPINST -name "C_BIT_SEL_46" -parent ${Bit_46} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_46}
  set C_BIT_EN_46 [ipgui::add_param $IPINST -name "C_BIT_EN_46" -parent ${Bit_46}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_46}

  #Adding Group
  set Bit_47 [ipgui::add_group $IPINST -name "Bit 47" -parent ${Bits_40-47} -layout horizontal]
  set C_BIT_SEL_47 [ipgui::add_param $IPINST -name "C_BIT_SEL_47" -parent ${Bit_47} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_47}
  set C_BIT_EN_47 [ipgui::add_param $IPINST -name "C_BIT_EN_47" -parent ${Bit_47}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_47}


  #Adding Group
  set Bits_48-55 [ipgui::add_group $IPINST -name "Bits 48-55" -parent ${Bits_32-63}]
  #Adding Group
  set Bit_48 [ipgui::add_group $IPINST -name "Bit 48" -parent ${Bits_48-55} -layout horizontal]
  set C_BIT_SEL_48 [ipgui::add_param $IPINST -name "C_BIT_SEL_48" -parent ${Bit_48} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_48}
  set C_BIT_EN_48 [ipgui::add_param $IPINST -name "C_BIT_EN_48" -parent ${Bit_48}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_48}

  #Adding Group
  set Bit_49 [ipgui::add_group $IPINST -name "Bit 49" -parent ${Bits_48-55} -layout horizontal]
  set C_BIT_SEL_49 [ipgui::add_param $IPINST -name "C_BIT_SEL_49" -parent ${Bit_49} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_49}
  set C_BIT_EN_49 [ipgui::add_param $IPINST -name "C_BIT_EN_49" -parent ${Bit_49}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_49}

  #Adding Group
  set Bit_50 [ipgui::add_group $IPINST -name "Bit 50" -parent ${Bits_48-55} -layout horizontal]
  set C_BIT_SEL_50 [ipgui::add_param $IPINST -name "C_BIT_SEL_50" -parent ${Bit_50} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_50}
  set C_BIT_EN_50 [ipgui::add_param $IPINST -name "C_BIT_EN_50" -parent ${Bit_50}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_50}

  #Adding Group
  set Bit_51 [ipgui::add_group $IPINST -name "Bit 51" -parent ${Bits_48-55} -layout horizontal]
  set C_BIT_SEL_51 [ipgui::add_param $IPINST -name "C_BIT_SEL_51" -parent ${Bit_51} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_51}
  set C_BIT_EN_51 [ipgui::add_param $IPINST -name "C_BIT_EN_51" -parent ${Bit_51}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_51}

  #Adding Group
  set Bit_52 [ipgui::add_group $IPINST -name "Bit 52" -parent ${Bits_48-55} -layout horizontal]
  set C_BIT_SEL_52 [ipgui::add_param $IPINST -name "C_BIT_SEL_52" -parent ${Bit_52} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_52}
  set C_BIT_EN_52 [ipgui::add_param $IPINST -name "C_BIT_EN_52" -parent ${Bit_52}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_52}

  #Adding Group
  set Bit_53 [ipgui::add_group $IPINST -name "Bit 53" -parent ${Bits_48-55} -layout horizontal]
  set C_BIT_SEL_53 [ipgui::add_param $IPINST -name "C_BIT_SEL_53" -parent ${Bit_53} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_53}
  set C_BIT_EN_53 [ipgui::add_param $IPINST -name "C_BIT_EN_53" -parent ${Bit_53}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_53}

  #Adding Group
  set Bit_54 [ipgui::add_group $IPINST -name "Bit 54" -parent ${Bits_48-55} -layout horizontal]
  set C_BIT_SEL_54 [ipgui::add_param $IPINST -name "C_BIT_SEL_54" -parent ${Bit_54} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_54}
  set C_BIT_EN_54 [ipgui::add_param $IPINST -name "C_BIT_EN_54" -parent ${Bit_54}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_54}

  #Adding Group
  set Bit_55 [ipgui::add_group $IPINST -name "Bit 55" -parent ${Bits_48-55} -layout horizontal]
  set C_BIT_SEL_55 [ipgui::add_param $IPINST -name "C_BIT_SEL_55" -parent ${Bit_55} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_55}
  set C_BIT_EN_55 [ipgui::add_param $IPINST -name "C_BIT_EN_55" -parent ${Bit_55}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_55}


  #Adding Group
  set Bits_56-63 [ipgui::add_group $IPINST -name "Bits 56-63" -parent ${Bits_32-63}]
  #Adding Group
  set Bit_56 [ipgui::add_group $IPINST -name "Bit 56" -parent ${Bits_56-63} -layout horizontal]
  set C_BIT_SEL_56 [ipgui::add_param $IPINST -name "C_BIT_SEL_56" -parent ${Bit_56} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_56}
  set C_BIT_EN_56 [ipgui::add_param $IPINST -name "C_BIT_EN_56" -parent ${Bit_56}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_56}

  #Adding Group
  set Bit_57 [ipgui::add_group $IPINST -name "Bit 57" -parent ${Bits_56-63} -layout horizontal]
  set C_BIT_SEL_57 [ipgui::add_param $IPINST -name "C_BIT_SEL_57" -parent ${Bit_57} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_57}
  set C_BIT_EN_57 [ipgui::add_param $IPINST -name "C_BIT_EN_57" -parent ${Bit_57}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_57}

  #Adding Group
  set Bit_58 [ipgui::add_group $IPINST -name "Bit 58" -parent ${Bits_56-63} -layout horizontal]
  set C_BIT_SEL_58 [ipgui::add_param $IPINST -name "C_BIT_SEL_58" -parent ${Bit_58} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_58}
  set C_BIT_EN_58 [ipgui::add_param $IPINST -name "C_BIT_EN_58" -parent ${Bit_58}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_58}

  #Adding Group
  set Bit_59 [ipgui::add_group $IPINST -name "Bit 59" -parent ${Bits_56-63} -layout horizontal]
  set C_BIT_SEL_59 [ipgui::add_param $IPINST -name "C_BIT_SEL_59" -parent ${Bit_59} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_59}
  set C_BIT_EN_59 [ipgui::add_param $IPINST -name "C_BIT_EN_59" -parent ${Bit_59}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_59}

  #Adding Group
  set Bit_60 [ipgui::add_group $IPINST -name "Bit 60" -parent ${Bits_56-63} -layout horizontal]
  set C_BIT_SEL_60 [ipgui::add_param $IPINST -name "C_BIT_SEL_60" -parent ${Bit_60} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_60}
  set C_BIT_EN_60 [ipgui::add_param $IPINST -name "C_BIT_EN_60" -parent ${Bit_60}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_60}

  #Adding Group
  set Bit_61 [ipgui::add_group $IPINST -name "Bit 61" -parent ${Bits_56-63} -layout horizontal]
  set C_BIT_SEL_61 [ipgui::add_param $IPINST -name "C_BIT_SEL_61" -parent ${Bit_61} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_61}
  set C_BIT_EN_61 [ipgui::add_param $IPINST -name "C_BIT_EN_61" -parent ${Bit_61}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_61}

  #Adding Group
  set Bit_62 [ipgui::add_group $IPINST -name "Bit 62" -parent ${Bits_56-63} -layout horizontal]
  set C_BIT_SEL_62 [ipgui::add_param $IPINST -name "C_BIT_SEL_62" -parent ${Bit_62} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_62}
  set C_BIT_EN_62 [ipgui::add_param $IPINST -name "C_BIT_EN_62" -parent ${Bit_62}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_62}

  #Adding Group
  set Bit_63 [ipgui::add_group $IPINST -name "Bit 63" -parent ${Bits_56-63} -layout horizontal]
  set C_BIT_SEL_63 [ipgui::add_param $IPINST -name "C_BIT_SEL_63" -parent ${Bit_63} -widget comboBox]
  set_property tooltip {Select behaviour} ${C_BIT_SEL_63}
  set C_BIT_EN_63 [ipgui::add_param $IPINST -name "C_BIT_EN_63" -parent ${Bit_63}]
  set_property tooltip {Individual bit enable} ${C_BIT_EN_63}



  #Adding Page
  set Buses [ipgui::add_page $IPINST -name "Buses"]
  #Adding Group
  set Bus_0: [ipgui::add_group $IPINST -name "Bus 0:" -parent ${Buses} -layout horizontal]
  set C_BUS_0_SEL [ipgui::add_param $IPINST -name "C_BUS_0_SEL" -parent ${Bus_0:}]
  set_property tooltip {Enable bus} ${C_BUS_0_SEL}
  set C_BUS_0_LEFT [ipgui::add_param $IPINST -name "C_BUS_0_LEFT" -parent ${Bus_0:}]
  set_property tooltip {Bus msb referred to input} ${C_BUS_0_LEFT}
  set C_BUS_0_RIGHT [ipgui::add_param $IPINST -name "C_BUS_0_RIGHT" -parent ${Bus_0:}]
  set_property tooltip {Bus lsb referred to input} ${C_BUS_0_RIGHT}

  #Adding Group
  set Bus_1: [ipgui::add_group $IPINST -name "Bus 1:" -parent ${Buses} -layout horizontal]
  set C_BUS_1_SEL [ipgui::add_param $IPINST -name "C_BUS_1_SEL" -parent ${Bus_1:}]
  set_property tooltip {Enable bus} ${C_BUS_1_SEL}
  set C_BUS_1_LEFT [ipgui::add_param $IPINST -name "C_BUS_1_LEFT" -parent ${Bus_1:}]
  set_property tooltip {Bus msb referred to input} ${C_BUS_1_LEFT}
  set C_BUS_1_RIGHT [ipgui::add_param $IPINST -name "C_BUS_1_RIGHT" -parent ${Bus_1:}]
  set_property tooltip {Bus lsb referred to input} ${C_BUS_1_RIGHT}

  #Adding Group
  set Bus_2: [ipgui::add_group $IPINST -name "Bus 2:" -parent ${Buses} -layout horizontal]
  set C_BUS_2_SEL [ipgui::add_param $IPINST -name "C_BUS_2_SEL" -parent ${Bus_2:}]
  set_property tooltip {Enable bus} ${C_BUS_2_SEL}
  set C_BUS_2_LEFT [ipgui::add_param $IPINST -name "C_BUS_2_LEFT" -parent ${Bus_2:}]
  set_property tooltip {Bus msb referred to input} ${C_BUS_2_LEFT}
  set C_BUS_2_RIGHT [ipgui::add_param $IPINST -name "C_BUS_2_RIGHT" -parent ${Bus_2:}]
  set_property tooltip {Bus lsb referred to input} ${C_BUS_2_RIGHT}

  #Adding Group
  set Bus_3: [ipgui::add_group $IPINST -name "Bus 3:" -parent ${Buses} -layout horizontal]
  set C_BUS_3_SEL [ipgui::add_param $IPINST -name "C_BUS_3_SEL" -parent ${Bus_3:}]
  set_property tooltip {Enable bus} ${C_BUS_3_SEL}
  set C_BUS_3_LEFT [ipgui::add_param $IPINST -name "C_BUS_3_LEFT" -parent ${Bus_3:}]
  set_property tooltip {Bus msb referred to input} ${C_BUS_3_LEFT}
  set C_BUS_3_RIGHT [ipgui::add_param $IPINST -name "C_BUS_3_RIGHT" -parent ${Bus_3:}]
  set_property tooltip {Bus lsb referred to input} ${C_BUS_3_RIGHT}



}

proc update_PARAM_VALUE.C_BIT_EN_0 { PARAM_VALUE.C_BIT_EN_0 } {
	# Procedure called to update C_BIT_EN_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_0 { PARAM_VALUE.C_BIT_EN_0 } {
	# Procedure called to validate C_BIT_EN_0
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_1 { PARAM_VALUE.C_BIT_EN_1 } {
	# Procedure called to update C_BIT_EN_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_1 { PARAM_VALUE.C_BIT_EN_1 } {
	# Procedure called to validate C_BIT_EN_1
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_10 { PARAM_VALUE.C_BIT_EN_10 } {
	# Procedure called to update C_BIT_EN_10 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_10 { PARAM_VALUE.C_BIT_EN_10 } {
	# Procedure called to validate C_BIT_EN_10
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_11 { PARAM_VALUE.C_BIT_EN_11 } {
	# Procedure called to update C_BIT_EN_11 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_11 { PARAM_VALUE.C_BIT_EN_11 } {
	# Procedure called to validate C_BIT_EN_11
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_12 { PARAM_VALUE.C_BIT_EN_12 } {
	# Procedure called to update C_BIT_EN_12 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_12 { PARAM_VALUE.C_BIT_EN_12 } {
	# Procedure called to validate C_BIT_EN_12
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_13 { PARAM_VALUE.C_BIT_EN_13 } {
	# Procedure called to update C_BIT_EN_13 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_13 { PARAM_VALUE.C_BIT_EN_13 } {
	# Procedure called to validate C_BIT_EN_13
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_14 { PARAM_VALUE.C_BIT_EN_14 } {
	# Procedure called to update C_BIT_EN_14 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_14 { PARAM_VALUE.C_BIT_EN_14 } {
	# Procedure called to validate C_BIT_EN_14
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_15 { PARAM_VALUE.C_BIT_EN_15 } {
	# Procedure called to update C_BIT_EN_15 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_15 { PARAM_VALUE.C_BIT_EN_15 } {
	# Procedure called to validate C_BIT_EN_15
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_16 { PARAM_VALUE.C_BIT_EN_16 } {
	# Procedure called to update C_BIT_EN_16 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_16 { PARAM_VALUE.C_BIT_EN_16 } {
	# Procedure called to validate C_BIT_EN_16
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_17 { PARAM_VALUE.C_BIT_EN_17 } {
	# Procedure called to update C_BIT_EN_17 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_17 { PARAM_VALUE.C_BIT_EN_17 } {
	# Procedure called to validate C_BIT_EN_17
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_18 { PARAM_VALUE.C_BIT_EN_18 } {
	# Procedure called to update C_BIT_EN_18 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_18 { PARAM_VALUE.C_BIT_EN_18 } {
	# Procedure called to validate C_BIT_EN_18
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_19 { PARAM_VALUE.C_BIT_EN_19 } {
	# Procedure called to update C_BIT_EN_19 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_19 { PARAM_VALUE.C_BIT_EN_19 } {
	# Procedure called to validate C_BIT_EN_19
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_2 { PARAM_VALUE.C_BIT_EN_2 } {
	# Procedure called to update C_BIT_EN_2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_2 { PARAM_VALUE.C_BIT_EN_2 } {
	# Procedure called to validate C_BIT_EN_2
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_20 { PARAM_VALUE.C_BIT_EN_20 } {
	# Procedure called to update C_BIT_EN_20 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_20 { PARAM_VALUE.C_BIT_EN_20 } {
	# Procedure called to validate C_BIT_EN_20
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_21 { PARAM_VALUE.C_BIT_EN_21 } {
	# Procedure called to update C_BIT_EN_21 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_21 { PARAM_VALUE.C_BIT_EN_21 } {
	# Procedure called to validate C_BIT_EN_21
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_22 { PARAM_VALUE.C_BIT_EN_22 } {
	# Procedure called to update C_BIT_EN_22 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_22 { PARAM_VALUE.C_BIT_EN_22 } {
	# Procedure called to validate C_BIT_EN_22
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_23 { PARAM_VALUE.C_BIT_EN_23 } {
	# Procedure called to update C_BIT_EN_23 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_23 { PARAM_VALUE.C_BIT_EN_23 } {
	# Procedure called to validate C_BIT_EN_23
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_24 { PARAM_VALUE.C_BIT_EN_24 } {
	# Procedure called to update C_BIT_EN_24 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_24 { PARAM_VALUE.C_BIT_EN_24 } {
	# Procedure called to validate C_BIT_EN_24
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_25 { PARAM_VALUE.C_BIT_EN_25 } {
	# Procedure called to update C_BIT_EN_25 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_25 { PARAM_VALUE.C_BIT_EN_25 } {
	# Procedure called to validate C_BIT_EN_25
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_26 { PARAM_VALUE.C_BIT_EN_26 } {
	# Procedure called to update C_BIT_EN_26 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_26 { PARAM_VALUE.C_BIT_EN_26 } {
	# Procedure called to validate C_BIT_EN_26
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_27 { PARAM_VALUE.C_BIT_EN_27 } {
	# Procedure called to update C_BIT_EN_27 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_27 { PARAM_VALUE.C_BIT_EN_27 } {
	# Procedure called to validate C_BIT_EN_27
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_28 { PARAM_VALUE.C_BIT_EN_28 } {
	# Procedure called to update C_BIT_EN_28 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_28 { PARAM_VALUE.C_BIT_EN_28 } {
	# Procedure called to validate C_BIT_EN_28
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_29 { PARAM_VALUE.C_BIT_EN_29 } {
	# Procedure called to update C_BIT_EN_29 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_29 { PARAM_VALUE.C_BIT_EN_29 } {
	# Procedure called to validate C_BIT_EN_29
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_3 { PARAM_VALUE.C_BIT_EN_3 } {
	# Procedure called to update C_BIT_EN_3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_3 { PARAM_VALUE.C_BIT_EN_3 } {
	# Procedure called to validate C_BIT_EN_3
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_30 { PARAM_VALUE.C_BIT_EN_30 } {
	# Procedure called to update C_BIT_EN_30 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_30 { PARAM_VALUE.C_BIT_EN_30 } {
	# Procedure called to validate C_BIT_EN_30
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_31 { PARAM_VALUE.C_BIT_EN_31 } {
	# Procedure called to update C_BIT_EN_31 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_31 { PARAM_VALUE.C_BIT_EN_31 } {
	# Procedure called to validate C_BIT_EN_31
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_32 { PARAM_VALUE.C_BIT_EN_32 } {
	# Procedure called to update C_BIT_EN_32 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_32 { PARAM_VALUE.C_BIT_EN_32 } {
	# Procedure called to validate C_BIT_EN_32
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_33 { PARAM_VALUE.C_BIT_EN_33 } {
	# Procedure called to update C_BIT_EN_33 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_33 { PARAM_VALUE.C_BIT_EN_33 } {
	# Procedure called to validate C_BIT_EN_33
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_34 { PARAM_VALUE.C_BIT_EN_34 } {
	# Procedure called to update C_BIT_EN_34 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_34 { PARAM_VALUE.C_BIT_EN_34 } {
	# Procedure called to validate C_BIT_EN_34
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_35 { PARAM_VALUE.C_BIT_EN_35 } {
	# Procedure called to update C_BIT_EN_35 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_35 { PARAM_VALUE.C_BIT_EN_35 } {
	# Procedure called to validate C_BIT_EN_35
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_36 { PARAM_VALUE.C_BIT_EN_36 } {
	# Procedure called to update C_BIT_EN_36 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_36 { PARAM_VALUE.C_BIT_EN_36 } {
	# Procedure called to validate C_BIT_EN_36
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_37 { PARAM_VALUE.C_BIT_EN_37 } {
	# Procedure called to update C_BIT_EN_37 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_37 { PARAM_VALUE.C_BIT_EN_37 } {
	# Procedure called to validate C_BIT_EN_37
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_38 { PARAM_VALUE.C_BIT_EN_38 } {
	# Procedure called to update C_BIT_EN_38 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_38 { PARAM_VALUE.C_BIT_EN_38 } {
	# Procedure called to validate C_BIT_EN_38
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_39 { PARAM_VALUE.C_BIT_EN_39 } {
	# Procedure called to update C_BIT_EN_39 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_39 { PARAM_VALUE.C_BIT_EN_39 } {
	# Procedure called to validate C_BIT_EN_39
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_4 { PARAM_VALUE.C_BIT_EN_4 } {
	# Procedure called to update C_BIT_EN_4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_4 { PARAM_VALUE.C_BIT_EN_4 } {
	# Procedure called to validate C_BIT_EN_4
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_40 { PARAM_VALUE.C_BIT_EN_40 } {
	# Procedure called to update C_BIT_EN_40 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_40 { PARAM_VALUE.C_BIT_EN_40 } {
	# Procedure called to validate C_BIT_EN_40
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_41 { PARAM_VALUE.C_BIT_EN_41 } {
	# Procedure called to update C_BIT_EN_41 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_41 { PARAM_VALUE.C_BIT_EN_41 } {
	# Procedure called to validate C_BIT_EN_41
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_42 { PARAM_VALUE.C_BIT_EN_42 } {
	# Procedure called to update C_BIT_EN_42 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_42 { PARAM_VALUE.C_BIT_EN_42 } {
	# Procedure called to validate C_BIT_EN_42
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_43 { PARAM_VALUE.C_BIT_EN_43 } {
	# Procedure called to update C_BIT_EN_43 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_43 { PARAM_VALUE.C_BIT_EN_43 } {
	# Procedure called to validate C_BIT_EN_43
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_44 { PARAM_VALUE.C_BIT_EN_44 } {
	# Procedure called to update C_BIT_EN_44 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_44 { PARAM_VALUE.C_BIT_EN_44 } {
	# Procedure called to validate C_BIT_EN_44
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_45 { PARAM_VALUE.C_BIT_EN_45 } {
	# Procedure called to update C_BIT_EN_45 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_45 { PARAM_VALUE.C_BIT_EN_45 } {
	# Procedure called to validate C_BIT_EN_45
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_46 { PARAM_VALUE.C_BIT_EN_46 } {
	# Procedure called to update C_BIT_EN_46 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_46 { PARAM_VALUE.C_BIT_EN_46 } {
	# Procedure called to validate C_BIT_EN_46
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_47 { PARAM_VALUE.C_BIT_EN_47 } {
	# Procedure called to update C_BIT_EN_47 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_47 { PARAM_VALUE.C_BIT_EN_47 } {
	# Procedure called to validate C_BIT_EN_47
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_48 { PARAM_VALUE.C_BIT_EN_48 } {
	# Procedure called to update C_BIT_EN_48 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_48 { PARAM_VALUE.C_BIT_EN_48 } {
	# Procedure called to validate C_BIT_EN_48
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_49 { PARAM_VALUE.C_BIT_EN_49 } {
	# Procedure called to update C_BIT_EN_49 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_49 { PARAM_VALUE.C_BIT_EN_49 } {
	# Procedure called to validate C_BIT_EN_49
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_5 { PARAM_VALUE.C_BIT_EN_5 } {
	# Procedure called to update C_BIT_EN_5 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_5 { PARAM_VALUE.C_BIT_EN_5 } {
	# Procedure called to validate C_BIT_EN_5
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_50 { PARAM_VALUE.C_BIT_EN_50 } {
	# Procedure called to update C_BIT_EN_50 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_50 { PARAM_VALUE.C_BIT_EN_50 } {
	# Procedure called to validate C_BIT_EN_50
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_51 { PARAM_VALUE.C_BIT_EN_51 } {
	# Procedure called to update C_BIT_EN_51 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_51 { PARAM_VALUE.C_BIT_EN_51 } {
	# Procedure called to validate C_BIT_EN_51
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_52 { PARAM_VALUE.C_BIT_EN_52 } {
	# Procedure called to update C_BIT_EN_52 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_52 { PARAM_VALUE.C_BIT_EN_52 } {
	# Procedure called to validate C_BIT_EN_52
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_53 { PARAM_VALUE.C_BIT_EN_53 } {
	# Procedure called to update C_BIT_EN_53 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_53 { PARAM_VALUE.C_BIT_EN_53 } {
	# Procedure called to validate C_BIT_EN_53
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_54 { PARAM_VALUE.C_BIT_EN_54 } {
	# Procedure called to update C_BIT_EN_54 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_54 { PARAM_VALUE.C_BIT_EN_54 } {
	# Procedure called to validate C_BIT_EN_54
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_55 { PARAM_VALUE.C_BIT_EN_55 } {
	# Procedure called to update C_BIT_EN_55 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_55 { PARAM_VALUE.C_BIT_EN_55 } {
	# Procedure called to validate C_BIT_EN_55
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_56 { PARAM_VALUE.C_BIT_EN_56 } {
	# Procedure called to update C_BIT_EN_56 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_56 { PARAM_VALUE.C_BIT_EN_56 } {
	# Procedure called to validate C_BIT_EN_56
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_57 { PARAM_VALUE.C_BIT_EN_57 } {
	# Procedure called to update C_BIT_EN_57 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_57 { PARAM_VALUE.C_BIT_EN_57 } {
	# Procedure called to validate C_BIT_EN_57
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_58 { PARAM_VALUE.C_BIT_EN_58 } {
	# Procedure called to update C_BIT_EN_58 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_58 { PARAM_VALUE.C_BIT_EN_58 } {
	# Procedure called to validate C_BIT_EN_58
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_59 { PARAM_VALUE.C_BIT_EN_59 } {
	# Procedure called to update C_BIT_EN_59 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_59 { PARAM_VALUE.C_BIT_EN_59 } {
	# Procedure called to validate C_BIT_EN_59
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_6 { PARAM_VALUE.C_BIT_EN_6 } {
	# Procedure called to update C_BIT_EN_6 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_6 { PARAM_VALUE.C_BIT_EN_6 } {
	# Procedure called to validate C_BIT_EN_6
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_60 { PARAM_VALUE.C_BIT_EN_60 } {
	# Procedure called to update C_BIT_EN_60 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_60 { PARAM_VALUE.C_BIT_EN_60 } {
	# Procedure called to validate C_BIT_EN_60
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_61 { PARAM_VALUE.C_BIT_EN_61 } {
	# Procedure called to update C_BIT_EN_61 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_61 { PARAM_VALUE.C_BIT_EN_61 } {
	# Procedure called to validate C_BIT_EN_61
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_62 { PARAM_VALUE.C_BIT_EN_62 } {
	# Procedure called to update C_BIT_EN_62 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_62 { PARAM_VALUE.C_BIT_EN_62 } {
	# Procedure called to validate C_BIT_EN_62
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_63 { PARAM_VALUE.C_BIT_EN_63 } {
	# Procedure called to update C_BIT_EN_63 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_63 { PARAM_VALUE.C_BIT_EN_63 } {
	# Procedure called to validate C_BIT_EN_63
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_7 { PARAM_VALUE.C_BIT_EN_7 } {
	# Procedure called to update C_BIT_EN_7 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_7 { PARAM_VALUE.C_BIT_EN_7 } {
	# Procedure called to validate C_BIT_EN_7
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_8 { PARAM_VALUE.C_BIT_EN_8 } {
	# Procedure called to update C_BIT_EN_8 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_8 { PARAM_VALUE.C_BIT_EN_8 } {
	# Procedure called to validate C_BIT_EN_8
	return true
}

proc update_PARAM_VALUE.C_BIT_EN_9 { PARAM_VALUE.C_BIT_EN_9 } {
	# Procedure called to update C_BIT_EN_9 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_EN_9 { PARAM_VALUE.C_BIT_EN_9 } {
	# Procedure called to validate C_BIT_EN_9
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_0 { PARAM_VALUE.C_BIT_SEL_0 } {
	# Procedure called to update C_BIT_SEL_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_0 { PARAM_VALUE.C_BIT_SEL_0 } {
	# Procedure called to validate C_BIT_SEL_0
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_1 { PARAM_VALUE.C_BIT_SEL_1 } {
	# Procedure called to update C_BIT_SEL_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_1 { PARAM_VALUE.C_BIT_SEL_1 } {
	# Procedure called to validate C_BIT_SEL_1
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_10 { PARAM_VALUE.C_BIT_SEL_10 } {
	# Procedure called to update C_BIT_SEL_10 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_10 { PARAM_VALUE.C_BIT_SEL_10 } {
	# Procedure called to validate C_BIT_SEL_10
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_11 { PARAM_VALUE.C_BIT_SEL_11 } {
	# Procedure called to update C_BIT_SEL_11 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_11 { PARAM_VALUE.C_BIT_SEL_11 } {
	# Procedure called to validate C_BIT_SEL_11
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_12 { PARAM_VALUE.C_BIT_SEL_12 } {
	# Procedure called to update C_BIT_SEL_12 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_12 { PARAM_VALUE.C_BIT_SEL_12 } {
	# Procedure called to validate C_BIT_SEL_12
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_13 { PARAM_VALUE.C_BIT_SEL_13 } {
	# Procedure called to update C_BIT_SEL_13 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_13 { PARAM_VALUE.C_BIT_SEL_13 } {
	# Procedure called to validate C_BIT_SEL_13
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_14 { PARAM_VALUE.C_BIT_SEL_14 } {
	# Procedure called to update C_BIT_SEL_14 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_14 { PARAM_VALUE.C_BIT_SEL_14 } {
	# Procedure called to validate C_BIT_SEL_14
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_15 { PARAM_VALUE.C_BIT_SEL_15 } {
	# Procedure called to update C_BIT_SEL_15 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_15 { PARAM_VALUE.C_BIT_SEL_15 } {
	# Procedure called to validate C_BIT_SEL_15
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_16 { PARAM_VALUE.C_BIT_SEL_16 } {
	# Procedure called to update C_BIT_SEL_16 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_16 { PARAM_VALUE.C_BIT_SEL_16 } {
	# Procedure called to validate C_BIT_SEL_16
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_17 { PARAM_VALUE.C_BIT_SEL_17 } {
	# Procedure called to update C_BIT_SEL_17 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_17 { PARAM_VALUE.C_BIT_SEL_17 } {
	# Procedure called to validate C_BIT_SEL_17
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_18 { PARAM_VALUE.C_BIT_SEL_18 } {
	# Procedure called to update C_BIT_SEL_18 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_18 { PARAM_VALUE.C_BIT_SEL_18 } {
	# Procedure called to validate C_BIT_SEL_18
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_19 { PARAM_VALUE.C_BIT_SEL_19 } {
	# Procedure called to update C_BIT_SEL_19 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_19 { PARAM_VALUE.C_BIT_SEL_19 } {
	# Procedure called to validate C_BIT_SEL_19
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_2 { PARAM_VALUE.C_BIT_SEL_2 } {
	# Procedure called to update C_BIT_SEL_2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_2 { PARAM_VALUE.C_BIT_SEL_2 } {
	# Procedure called to validate C_BIT_SEL_2
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_20 { PARAM_VALUE.C_BIT_SEL_20 } {
	# Procedure called to update C_BIT_SEL_20 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_20 { PARAM_VALUE.C_BIT_SEL_20 } {
	# Procedure called to validate C_BIT_SEL_20
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_21 { PARAM_VALUE.C_BIT_SEL_21 } {
	# Procedure called to update C_BIT_SEL_21 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_21 { PARAM_VALUE.C_BIT_SEL_21 } {
	# Procedure called to validate C_BIT_SEL_21
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_22 { PARAM_VALUE.C_BIT_SEL_22 } {
	# Procedure called to update C_BIT_SEL_22 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_22 { PARAM_VALUE.C_BIT_SEL_22 } {
	# Procedure called to validate C_BIT_SEL_22
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_23 { PARAM_VALUE.C_BIT_SEL_23 } {
	# Procedure called to update C_BIT_SEL_23 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_23 { PARAM_VALUE.C_BIT_SEL_23 } {
	# Procedure called to validate C_BIT_SEL_23
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_24 { PARAM_VALUE.C_BIT_SEL_24 } {
	# Procedure called to update C_BIT_SEL_24 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_24 { PARAM_VALUE.C_BIT_SEL_24 } {
	# Procedure called to validate C_BIT_SEL_24
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_25 { PARAM_VALUE.C_BIT_SEL_25 } {
	# Procedure called to update C_BIT_SEL_25 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_25 { PARAM_VALUE.C_BIT_SEL_25 } {
	# Procedure called to validate C_BIT_SEL_25
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_26 { PARAM_VALUE.C_BIT_SEL_26 } {
	# Procedure called to update C_BIT_SEL_26 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_26 { PARAM_VALUE.C_BIT_SEL_26 } {
	# Procedure called to validate C_BIT_SEL_26
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_27 { PARAM_VALUE.C_BIT_SEL_27 } {
	# Procedure called to update C_BIT_SEL_27 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_27 { PARAM_VALUE.C_BIT_SEL_27 } {
	# Procedure called to validate C_BIT_SEL_27
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_28 { PARAM_VALUE.C_BIT_SEL_28 } {
	# Procedure called to update C_BIT_SEL_28 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_28 { PARAM_VALUE.C_BIT_SEL_28 } {
	# Procedure called to validate C_BIT_SEL_28
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_29 { PARAM_VALUE.C_BIT_SEL_29 } {
	# Procedure called to update C_BIT_SEL_29 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_29 { PARAM_VALUE.C_BIT_SEL_29 } {
	# Procedure called to validate C_BIT_SEL_29
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_3 { PARAM_VALUE.C_BIT_SEL_3 } {
	# Procedure called to update C_BIT_SEL_3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_3 { PARAM_VALUE.C_BIT_SEL_3 } {
	# Procedure called to validate C_BIT_SEL_3
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_30 { PARAM_VALUE.C_BIT_SEL_30 } {
	# Procedure called to update C_BIT_SEL_30 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_30 { PARAM_VALUE.C_BIT_SEL_30 } {
	# Procedure called to validate C_BIT_SEL_30
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_31 { PARAM_VALUE.C_BIT_SEL_31 } {
	# Procedure called to update C_BIT_SEL_31 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_31 { PARAM_VALUE.C_BIT_SEL_31 } {
	# Procedure called to validate C_BIT_SEL_31
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_32 { PARAM_VALUE.C_BIT_SEL_32 } {
	# Procedure called to update C_BIT_SEL_32 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_32 { PARAM_VALUE.C_BIT_SEL_32 } {
	# Procedure called to validate C_BIT_SEL_32
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_33 { PARAM_VALUE.C_BIT_SEL_33 } {
	# Procedure called to update C_BIT_SEL_33 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_33 { PARAM_VALUE.C_BIT_SEL_33 } {
	# Procedure called to validate C_BIT_SEL_33
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_34 { PARAM_VALUE.C_BIT_SEL_34 } {
	# Procedure called to update C_BIT_SEL_34 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_34 { PARAM_VALUE.C_BIT_SEL_34 } {
	# Procedure called to validate C_BIT_SEL_34
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_35 { PARAM_VALUE.C_BIT_SEL_35 } {
	# Procedure called to update C_BIT_SEL_35 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_35 { PARAM_VALUE.C_BIT_SEL_35 } {
	# Procedure called to validate C_BIT_SEL_35
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_36 { PARAM_VALUE.C_BIT_SEL_36 } {
	# Procedure called to update C_BIT_SEL_36 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_36 { PARAM_VALUE.C_BIT_SEL_36 } {
	# Procedure called to validate C_BIT_SEL_36
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_37 { PARAM_VALUE.C_BIT_SEL_37 } {
	# Procedure called to update C_BIT_SEL_37 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_37 { PARAM_VALUE.C_BIT_SEL_37 } {
	# Procedure called to validate C_BIT_SEL_37
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_38 { PARAM_VALUE.C_BIT_SEL_38 } {
	# Procedure called to update C_BIT_SEL_38 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_38 { PARAM_VALUE.C_BIT_SEL_38 } {
	# Procedure called to validate C_BIT_SEL_38
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_39 { PARAM_VALUE.C_BIT_SEL_39 } {
	# Procedure called to update C_BIT_SEL_39 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_39 { PARAM_VALUE.C_BIT_SEL_39 } {
	# Procedure called to validate C_BIT_SEL_39
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_4 { PARAM_VALUE.C_BIT_SEL_4 } {
	# Procedure called to update C_BIT_SEL_4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_4 { PARAM_VALUE.C_BIT_SEL_4 } {
	# Procedure called to validate C_BIT_SEL_4
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_40 { PARAM_VALUE.C_BIT_SEL_40 } {
	# Procedure called to update C_BIT_SEL_40 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_40 { PARAM_VALUE.C_BIT_SEL_40 } {
	# Procedure called to validate C_BIT_SEL_40
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_41 { PARAM_VALUE.C_BIT_SEL_41 } {
	# Procedure called to update C_BIT_SEL_41 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_41 { PARAM_VALUE.C_BIT_SEL_41 } {
	# Procedure called to validate C_BIT_SEL_41
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_42 { PARAM_VALUE.C_BIT_SEL_42 } {
	# Procedure called to update C_BIT_SEL_42 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_42 { PARAM_VALUE.C_BIT_SEL_42 } {
	# Procedure called to validate C_BIT_SEL_42
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_43 { PARAM_VALUE.C_BIT_SEL_43 } {
	# Procedure called to update C_BIT_SEL_43 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_43 { PARAM_VALUE.C_BIT_SEL_43 } {
	# Procedure called to validate C_BIT_SEL_43
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_44 { PARAM_VALUE.C_BIT_SEL_44 } {
	# Procedure called to update C_BIT_SEL_44 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_44 { PARAM_VALUE.C_BIT_SEL_44 } {
	# Procedure called to validate C_BIT_SEL_44
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_45 { PARAM_VALUE.C_BIT_SEL_45 } {
	# Procedure called to update C_BIT_SEL_45 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_45 { PARAM_VALUE.C_BIT_SEL_45 } {
	# Procedure called to validate C_BIT_SEL_45
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_46 { PARAM_VALUE.C_BIT_SEL_46 } {
	# Procedure called to update C_BIT_SEL_46 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_46 { PARAM_VALUE.C_BIT_SEL_46 } {
	# Procedure called to validate C_BIT_SEL_46
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_47 { PARAM_VALUE.C_BIT_SEL_47 } {
	# Procedure called to update C_BIT_SEL_47 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_47 { PARAM_VALUE.C_BIT_SEL_47 } {
	# Procedure called to validate C_BIT_SEL_47
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_48 { PARAM_VALUE.C_BIT_SEL_48 } {
	# Procedure called to update C_BIT_SEL_48 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_48 { PARAM_VALUE.C_BIT_SEL_48 } {
	# Procedure called to validate C_BIT_SEL_48
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_49 { PARAM_VALUE.C_BIT_SEL_49 } {
	# Procedure called to update C_BIT_SEL_49 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_49 { PARAM_VALUE.C_BIT_SEL_49 } {
	# Procedure called to validate C_BIT_SEL_49
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_5 { PARAM_VALUE.C_BIT_SEL_5 } {
	# Procedure called to update C_BIT_SEL_5 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_5 { PARAM_VALUE.C_BIT_SEL_5 } {
	# Procedure called to validate C_BIT_SEL_5
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_50 { PARAM_VALUE.C_BIT_SEL_50 } {
	# Procedure called to update C_BIT_SEL_50 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_50 { PARAM_VALUE.C_BIT_SEL_50 } {
	# Procedure called to validate C_BIT_SEL_50
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_51 { PARAM_VALUE.C_BIT_SEL_51 } {
	# Procedure called to update C_BIT_SEL_51 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_51 { PARAM_VALUE.C_BIT_SEL_51 } {
	# Procedure called to validate C_BIT_SEL_51
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_52 { PARAM_VALUE.C_BIT_SEL_52 } {
	# Procedure called to update C_BIT_SEL_52 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_52 { PARAM_VALUE.C_BIT_SEL_52 } {
	# Procedure called to validate C_BIT_SEL_52
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_53 { PARAM_VALUE.C_BIT_SEL_53 } {
	# Procedure called to update C_BIT_SEL_53 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_53 { PARAM_VALUE.C_BIT_SEL_53 } {
	# Procedure called to validate C_BIT_SEL_53
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_54 { PARAM_VALUE.C_BIT_SEL_54 } {
	# Procedure called to update C_BIT_SEL_54 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_54 { PARAM_VALUE.C_BIT_SEL_54 } {
	# Procedure called to validate C_BIT_SEL_54
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_55 { PARAM_VALUE.C_BIT_SEL_55 } {
	# Procedure called to update C_BIT_SEL_55 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_55 { PARAM_VALUE.C_BIT_SEL_55 } {
	# Procedure called to validate C_BIT_SEL_55
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_56 { PARAM_VALUE.C_BIT_SEL_56 } {
	# Procedure called to update C_BIT_SEL_56 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_56 { PARAM_VALUE.C_BIT_SEL_56 } {
	# Procedure called to validate C_BIT_SEL_56
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_57 { PARAM_VALUE.C_BIT_SEL_57 } {
	# Procedure called to update C_BIT_SEL_57 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_57 { PARAM_VALUE.C_BIT_SEL_57 } {
	# Procedure called to validate C_BIT_SEL_57
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_58 { PARAM_VALUE.C_BIT_SEL_58 } {
	# Procedure called to update C_BIT_SEL_58 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_58 { PARAM_VALUE.C_BIT_SEL_58 } {
	# Procedure called to validate C_BIT_SEL_58
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_59 { PARAM_VALUE.C_BIT_SEL_59 } {
	# Procedure called to update C_BIT_SEL_59 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_59 { PARAM_VALUE.C_BIT_SEL_59 } {
	# Procedure called to validate C_BIT_SEL_59
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_6 { PARAM_VALUE.C_BIT_SEL_6 } {
	# Procedure called to update C_BIT_SEL_6 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_6 { PARAM_VALUE.C_BIT_SEL_6 } {
	# Procedure called to validate C_BIT_SEL_6
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_60 { PARAM_VALUE.C_BIT_SEL_60 } {
	# Procedure called to update C_BIT_SEL_60 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_60 { PARAM_VALUE.C_BIT_SEL_60 } {
	# Procedure called to validate C_BIT_SEL_60
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_61 { PARAM_VALUE.C_BIT_SEL_61 } {
	# Procedure called to update C_BIT_SEL_61 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_61 { PARAM_VALUE.C_BIT_SEL_61 } {
	# Procedure called to validate C_BIT_SEL_61
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_62 { PARAM_VALUE.C_BIT_SEL_62 } {
	# Procedure called to update C_BIT_SEL_62 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_62 { PARAM_VALUE.C_BIT_SEL_62 } {
	# Procedure called to validate C_BIT_SEL_62
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_63 { PARAM_VALUE.C_BIT_SEL_63 } {
	# Procedure called to update C_BIT_SEL_63 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_63 { PARAM_VALUE.C_BIT_SEL_63 } {
	# Procedure called to validate C_BIT_SEL_63
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_7 { PARAM_VALUE.C_BIT_SEL_7 } {
	# Procedure called to update C_BIT_SEL_7 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_7 { PARAM_VALUE.C_BIT_SEL_7 } {
	# Procedure called to validate C_BIT_SEL_7
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_8 { PARAM_VALUE.C_BIT_SEL_8 } {
	# Procedure called to update C_BIT_SEL_8 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_8 { PARAM_VALUE.C_BIT_SEL_8 } {
	# Procedure called to validate C_BIT_SEL_8
	return true
}

proc update_PARAM_VALUE.C_BIT_SEL_9 { PARAM_VALUE.C_BIT_SEL_9 } {
	# Procedure called to update C_BIT_SEL_9 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BIT_SEL_9 { PARAM_VALUE.C_BIT_SEL_9 } {
	# Procedure called to validate C_BIT_SEL_9
	return true
}

proc update_PARAM_VALUE.C_BUS_0_LEFT { PARAM_VALUE.C_BUS_0_LEFT } {
	# Procedure called to update C_BUS_0_LEFT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BUS_0_LEFT { PARAM_VALUE.C_BUS_0_LEFT } {
	# Procedure called to validate C_BUS_0_LEFT
	return true
}

proc update_PARAM_VALUE.C_BUS_0_RIGHT { PARAM_VALUE.C_BUS_0_RIGHT } {
	# Procedure called to update C_BUS_0_RIGHT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BUS_0_RIGHT { PARAM_VALUE.C_BUS_0_RIGHT } {
	# Procedure called to validate C_BUS_0_RIGHT
	return true
}

proc update_PARAM_VALUE.C_BUS_0_SEL { PARAM_VALUE.C_BUS_0_SEL } {
	# Procedure called to update C_BUS_0_SEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BUS_0_SEL { PARAM_VALUE.C_BUS_0_SEL } {
	# Procedure called to validate C_BUS_0_SEL
	return true
}

proc update_PARAM_VALUE.C_BUS_1_LEFT { PARAM_VALUE.C_BUS_1_LEFT } {
	# Procedure called to update C_BUS_1_LEFT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BUS_1_LEFT { PARAM_VALUE.C_BUS_1_LEFT } {
	# Procedure called to validate C_BUS_1_LEFT
	return true
}

proc update_PARAM_VALUE.C_BUS_1_RIGHT { PARAM_VALUE.C_BUS_1_RIGHT } {
	# Procedure called to update C_BUS_1_RIGHT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BUS_1_RIGHT { PARAM_VALUE.C_BUS_1_RIGHT } {
	# Procedure called to validate C_BUS_1_RIGHT
	return true
}

proc update_PARAM_VALUE.C_BUS_1_SEL { PARAM_VALUE.C_BUS_1_SEL } {
	# Procedure called to update C_BUS_1_SEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BUS_1_SEL { PARAM_VALUE.C_BUS_1_SEL } {
	# Procedure called to validate C_BUS_1_SEL
	return true
}

proc update_PARAM_VALUE.C_BUS_2_LEFT { PARAM_VALUE.C_BUS_2_LEFT } {
	# Procedure called to update C_BUS_2_LEFT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BUS_2_LEFT { PARAM_VALUE.C_BUS_2_LEFT } {
	# Procedure called to validate C_BUS_2_LEFT
	return true
}

proc update_PARAM_VALUE.C_BUS_2_RIGHT { PARAM_VALUE.C_BUS_2_RIGHT } {
	# Procedure called to update C_BUS_2_RIGHT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BUS_2_RIGHT { PARAM_VALUE.C_BUS_2_RIGHT } {
	# Procedure called to validate C_BUS_2_RIGHT
	return true
}

proc update_PARAM_VALUE.C_BUS_2_SEL { PARAM_VALUE.C_BUS_2_SEL } {
	# Procedure called to update C_BUS_2_SEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BUS_2_SEL { PARAM_VALUE.C_BUS_2_SEL } {
	# Procedure called to validate C_BUS_2_SEL
	return true
}

proc update_PARAM_VALUE.C_BUS_3_LEFT { PARAM_VALUE.C_BUS_3_LEFT } {
	# Procedure called to update C_BUS_3_LEFT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BUS_3_LEFT { PARAM_VALUE.C_BUS_3_LEFT } {
	# Procedure called to validate C_BUS_3_LEFT
	return true
}

proc update_PARAM_VALUE.C_BUS_3_RIGHT { PARAM_VALUE.C_BUS_3_RIGHT } {
	# Procedure called to update C_BUS_3_RIGHT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BUS_3_RIGHT { PARAM_VALUE.C_BUS_3_RIGHT } {
	# Procedure called to validate C_BUS_3_RIGHT
	return true
}

proc update_PARAM_VALUE.C_BUS_3_SEL { PARAM_VALUE.C_BUS_3_SEL } {
	# Procedure called to update C_BUS_3_SEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BUS_3_SEL { PARAM_VALUE.C_BUS_3_SEL } {
	# Procedure called to validate C_BUS_3_SEL
	return true
}

proc update_PARAM_VALUE.C_INPUT_SIZE { PARAM_VALUE.C_INPUT_SIZE } {
	# Procedure called to update C_INPUT_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_INPUT_SIZE { PARAM_VALUE.C_INPUT_SIZE } {
	# Procedure called to validate C_INPUT_SIZE
	return true
}


proc update_MODELPARAM_VALUE.C_INPUT_SIZE { MODELPARAM_VALUE.C_INPUT_SIZE PARAM_VALUE.C_INPUT_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_INPUT_SIZE}] ${MODELPARAM_VALUE.C_INPUT_SIZE}
}

proc update_MODELPARAM_VALUE.C_BUS_0_SEL { MODELPARAM_VALUE.C_BUS_0_SEL PARAM_VALUE.C_BUS_0_SEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BUS_0_SEL}] ${MODELPARAM_VALUE.C_BUS_0_SEL}
}

proc update_MODELPARAM_VALUE.C_BUS_0_LEFT { MODELPARAM_VALUE.C_BUS_0_LEFT PARAM_VALUE.C_BUS_0_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BUS_0_LEFT}] ${MODELPARAM_VALUE.C_BUS_0_LEFT}
}

proc update_MODELPARAM_VALUE.C_BUS_0_RIGHT { MODELPARAM_VALUE.C_BUS_0_RIGHT PARAM_VALUE.C_BUS_0_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BUS_0_RIGHT}] ${MODELPARAM_VALUE.C_BUS_0_RIGHT}
}

proc update_MODELPARAM_VALUE.C_BUS_1_SEL { MODELPARAM_VALUE.C_BUS_1_SEL PARAM_VALUE.C_BUS_1_SEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BUS_1_SEL}] ${MODELPARAM_VALUE.C_BUS_1_SEL}
}

proc update_MODELPARAM_VALUE.C_BUS_1_LEFT { MODELPARAM_VALUE.C_BUS_1_LEFT PARAM_VALUE.C_BUS_1_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BUS_1_LEFT}] ${MODELPARAM_VALUE.C_BUS_1_LEFT}
}

proc update_MODELPARAM_VALUE.C_BUS_1_RIGHT { MODELPARAM_VALUE.C_BUS_1_RIGHT PARAM_VALUE.C_BUS_1_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BUS_1_RIGHT}] ${MODELPARAM_VALUE.C_BUS_1_RIGHT}
}

proc update_MODELPARAM_VALUE.C_BUS_2_SEL { MODELPARAM_VALUE.C_BUS_2_SEL PARAM_VALUE.C_BUS_2_SEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BUS_2_SEL}] ${MODELPARAM_VALUE.C_BUS_2_SEL}
}

proc update_MODELPARAM_VALUE.C_BUS_2_LEFT { MODELPARAM_VALUE.C_BUS_2_LEFT PARAM_VALUE.C_BUS_2_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BUS_2_LEFT}] ${MODELPARAM_VALUE.C_BUS_2_LEFT}
}

proc update_MODELPARAM_VALUE.C_BUS_2_RIGHT { MODELPARAM_VALUE.C_BUS_2_RIGHT PARAM_VALUE.C_BUS_2_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BUS_2_RIGHT}] ${MODELPARAM_VALUE.C_BUS_2_RIGHT}
}

proc update_MODELPARAM_VALUE.C_BUS_3_SEL { MODELPARAM_VALUE.C_BUS_3_SEL PARAM_VALUE.C_BUS_3_SEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BUS_3_SEL}] ${MODELPARAM_VALUE.C_BUS_3_SEL}
}

proc update_MODELPARAM_VALUE.C_BUS_3_LEFT { MODELPARAM_VALUE.C_BUS_3_LEFT PARAM_VALUE.C_BUS_3_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BUS_3_LEFT}] ${MODELPARAM_VALUE.C_BUS_3_LEFT}
}

proc update_MODELPARAM_VALUE.C_BUS_3_RIGHT { MODELPARAM_VALUE.C_BUS_3_RIGHT PARAM_VALUE.C_BUS_3_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BUS_3_RIGHT}] ${MODELPARAM_VALUE.C_BUS_3_RIGHT}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_0 { MODELPARAM_VALUE.C_BIT_SEL_0 PARAM_VALUE.C_BIT_SEL_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_0}] ${MODELPARAM_VALUE.C_BIT_SEL_0}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_1 { MODELPARAM_VALUE.C_BIT_SEL_1 PARAM_VALUE.C_BIT_SEL_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_1}] ${MODELPARAM_VALUE.C_BIT_SEL_1}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_2 { MODELPARAM_VALUE.C_BIT_SEL_2 PARAM_VALUE.C_BIT_SEL_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_2}] ${MODELPARAM_VALUE.C_BIT_SEL_2}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_3 { MODELPARAM_VALUE.C_BIT_SEL_3 PARAM_VALUE.C_BIT_SEL_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_3}] ${MODELPARAM_VALUE.C_BIT_SEL_3}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_4 { MODELPARAM_VALUE.C_BIT_SEL_4 PARAM_VALUE.C_BIT_SEL_4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_4}] ${MODELPARAM_VALUE.C_BIT_SEL_4}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_5 { MODELPARAM_VALUE.C_BIT_SEL_5 PARAM_VALUE.C_BIT_SEL_5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_5}] ${MODELPARAM_VALUE.C_BIT_SEL_5}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_6 { MODELPARAM_VALUE.C_BIT_SEL_6 PARAM_VALUE.C_BIT_SEL_6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_6}] ${MODELPARAM_VALUE.C_BIT_SEL_6}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_7 { MODELPARAM_VALUE.C_BIT_SEL_7 PARAM_VALUE.C_BIT_SEL_7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_7}] ${MODELPARAM_VALUE.C_BIT_SEL_7}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_8 { MODELPARAM_VALUE.C_BIT_SEL_8 PARAM_VALUE.C_BIT_SEL_8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_8}] ${MODELPARAM_VALUE.C_BIT_SEL_8}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_9 { MODELPARAM_VALUE.C_BIT_SEL_9 PARAM_VALUE.C_BIT_SEL_9 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_9}] ${MODELPARAM_VALUE.C_BIT_SEL_9}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_10 { MODELPARAM_VALUE.C_BIT_SEL_10 PARAM_VALUE.C_BIT_SEL_10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_10}] ${MODELPARAM_VALUE.C_BIT_SEL_10}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_11 { MODELPARAM_VALUE.C_BIT_SEL_11 PARAM_VALUE.C_BIT_SEL_11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_11}] ${MODELPARAM_VALUE.C_BIT_SEL_11}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_12 { MODELPARAM_VALUE.C_BIT_SEL_12 PARAM_VALUE.C_BIT_SEL_12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_12}] ${MODELPARAM_VALUE.C_BIT_SEL_12}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_13 { MODELPARAM_VALUE.C_BIT_SEL_13 PARAM_VALUE.C_BIT_SEL_13 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_13}] ${MODELPARAM_VALUE.C_BIT_SEL_13}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_14 { MODELPARAM_VALUE.C_BIT_SEL_14 PARAM_VALUE.C_BIT_SEL_14 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_14}] ${MODELPARAM_VALUE.C_BIT_SEL_14}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_15 { MODELPARAM_VALUE.C_BIT_SEL_15 PARAM_VALUE.C_BIT_SEL_15 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_15}] ${MODELPARAM_VALUE.C_BIT_SEL_15}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_16 { MODELPARAM_VALUE.C_BIT_SEL_16 PARAM_VALUE.C_BIT_SEL_16 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_16}] ${MODELPARAM_VALUE.C_BIT_SEL_16}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_17 { MODELPARAM_VALUE.C_BIT_SEL_17 PARAM_VALUE.C_BIT_SEL_17 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_17}] ${MODELPARAM_VALUE.C_BIT_SEL_17}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_18 { MODELPARAM_VALUE.C_BIT_SEL_18 PARAM_VALUE.C_BIT_SEL_18 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_18}] ${MODELPARAM_VALUE.C_BIT_SEL_18}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_19 { MODELPARAM_VALUE.C_BIT_SEL_19 PARAM_VALUE.C_BIT_SEL_19 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_19}] ${MODELPARAM_VALUE.C_BIT_SEL_19}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_20 { MODELPARAM_VALUE.C_BIT_SEL_20 PARAM_VALUE.C_BIT_SEL_20 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_20}] ${MODELPARAM_VALUE.C_BIT_SEL_20}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_21 { MODELPARAM_VALUE.C_BIT_SEL_21 PARAM_VALUE.C_BIT_SEL_21 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_21}] ${MODELPARAM_VALUE.C_BIT_SEL_21}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_22 { MODELPARAM_VALUE.C_BIT_SEL_22 PARAM_VALUE.C_BIT_SEL_22 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_22}] ${MODELPARAM_VALUE.C_BIT_SEL_22}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_23 { MODELPARAM_VALUE.C_BIT_SEL_23 PARAM_VALUE.C_BIT_SEL_23 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_23}] ${MODELPARAM_VALUE.C_BIT_SEL_23}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_24 { MODELPARAM_VALUE.C_BIT_SEL_24 PARAM_VALUE.C_BIT_SEL_24 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_24}] ${MODELPARAM_VALUE.C_BIT_SEL_24}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_25 { MODELPARAM_VALUE.C_BIT_SEL_25 PARAM_VALUE.C_BIT_SEL_25 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_25}] ${MODELPARAM_VALUE.C_BIT_SEL_25}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_26 { MODELPARAM_VALUE.C_BIT_SEL_26 PARAM_VALUE.C_BIT_SEL_26 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_26}] ${MODELPARAM_VALUE.C_BIT_SEL_26}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_27 { MODELPARAM_VALUE.C_BIT_SEL_27 PARAM_VALUE.C_BIT_SEL_27 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_27}] ${MODELPARAM_VALUE.C_BIT_SEL_27}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_28 { MODELPARAM_VALUE.C_BIT_SEL_28 PARAM_VALUE.C_BIT_SEL_28 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_28}] ${MODELPARAM_VALUE.C_BIT_SEL_28}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_29 { MODELPARAM_VALUE.C_BIT_SEL_29 PARAM_VALUE.C_BIT_SEL_29 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_29}] ${MODELPARAM_VALUE.C_BIT_SEL_29}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_30 { MODELPARAM_VALUE.C_BIT_SEL_30 PARAM_VALUE.C_BIT_SEL_30 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_30}] ${MODELPARAM_VALUE.C_BIT_SEL_30}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_31 { MODELPARAM_VALUE.C_BIT_SEL_31 PARAM_VALUE.C_BIT_SEL_31 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_31}] ${MODELPARAM_VALUE.C_BIT_SEL_31}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_32 { MODELPARAM_VALUE.C_BIT_SEL_32 PARAM_VALUE.C_BIT_SEL_32 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_32}] ${MODELPARAM_VALUE.C_BIT_SEL_32}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_33 { MODELPARAM_VALUE.C_BIT_SEL_33 PARAM_VALUE.C_BIT_SEL_33 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_33}] ${MODELPARAM_VALUE.C_BIT_SEL_33}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_34 { MODELPARAM_VALUE.C_BIT_SEL_34 PARAM_VALUE.C_BIT_SEL_34 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_34}] ${MODELPARAM_VALUE.C_BIT_SEL_34}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_35 { MODELPARAM_VALUE.C_BIT_SEL_35 PARAM_VALUE.C_BIT_SEL_35 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_35}] ${MODELPARAM_VALUE.C_BIT_SEL_35}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_36 { MODELPARAM_VALUE.C_BIT_SEL_36 PARAM_VALUE.C_BIT_SEL_36 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_36}] ${MODELPARAM_VALUE.C_BIT_SEL_36}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_37 { MODELPARAM_VALUE.C_BIT_SEL_37 PARAM_VALUE.C_BIT_SEL_37 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_37}] ${MODELPARAM_VALUE.C_BIT_SEL_37}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_38 { MODELPARAM_VALUE.C_BIT_SEL_38 PARAM_VALUE.C_BIT_SEL_38 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_38}] ${MODELPARAM_VALUE.C_BIT_SEL_38}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_39 { MODELPARAM_VALUE.C_BIT_SEL_39 PARAM_VALUE.C_BIT_SEL_39 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_39}] ${MODELPARAM_VALUE.C_BIT_SEL_39}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_40 { MODELPARAM_VALUE.C_BIT_SEL_40 PARAM_VALUE.C_BIT_SEL_40 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_40}] ${MODELPARAM_VALUE.C_BIT_SEL_40}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_41 { MODELPARAM_VALUE.C_BIT_SEL_41 PARAM_VALUE.C_BIT_SEL_41 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_41}] ${MODELPARAM_VALUE.C_BIT_SEL_41}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_42 { MODELPARAM_VALUE.C_BIT_SEL_42 PARAM_VALUE.C_BIT_SEL_42 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_42}] ${MODELPARAM_VALUE.C_BIT_SEL_42}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_43 { MODELPARAM_VALUE.C_BIT_SEL_43 PARAM_VALUE.C_BIT_SEL_43 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_43}] ${MODELPARAM_VALUE.C_BIT_SEL_43}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_44 { MODELPARAM_VALUE.C_BIT_SEL_44 PARAM_VALUE.C_BIT_SEL_44 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_44}] ${MODELPARAM_VALUE.C_BIT_SEL_44}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_45 { MODELPARAM_VALUE.C_BIT_SEL_45 PARAM_VALUE.C_BIT_SEL_45 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_45}] ${MODELPARAM_VALUE.C_BIT_SEL_45}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_46 { MODELPARAM_VALUE.C_BIT_SEL_46 PARAM_VALUE.C_BIT_SEL_46 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_46}] ${MODELPARAM_VALUE.C_BIT_SEL_46}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_47 { MODELPARAM_VALUE.C_BIT_SEL_47 PARAM_VALUE.C_BIT_SEL_47 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_47}] ${MODELPARAM_VALUE.C_BIT_SEL_47}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_48 { MODELPARAM_VALUE.C_BIT_SEL_48 PARAM_VALUE.C_BIT_SEL_48 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_48}] ${MODELPARAM_VALUE.C_BIT_SEL_48}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_49 { MODELPARAM_VALUE.C_BIT_SEL_49 PARAM_VALUE.C_BIT_SEL_49 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_49}] ${MODELPARAM_VALUE.C_BIT_SEL_49}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_50 { MODELPARAM_VALUE.C_BIT_SEL_50 PARAM_VALUE.C_BIT_SEL_50 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_50}] ${MODELPARAM_VALUE.C_BIT_SEL_50}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_51 { MODELPARAM_VALUE.C_BIT_SEL_51 PARAM_VALUE.C_BIT_SEL_51 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_51}] ${MODELPARAM_VALUE.C_BIT_SEL_51}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_52 { MODELPARAM_VALUE.C_BIT_SEL_52 PARAM_VALUE.C_BIT_SEL_52 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_52}] ${MODELPARAM_VALUE.C_BIT_SEL_52}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_53 { MODELPARAM_VALUE.C_BIT_SEL_53 PARAM_VALUE.C_BIT_SEL_53 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_53}] ${MODELPARAM_VALUE.C_BIT_SEL_53}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_54 { MODELPARAM_VALUE.C_BIT_SEL_54 PARAM_VALUE.C_BIT_SEL_54 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_54}] ${MODELPARAM_VALUE.C_BIT_SEL_54}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_55 { MODELPARAM_VALUE.C_BIT_SEL_55 PARAM_VALUE.C_BIT_SEL_55 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_55}] ${MODELPARAM_VALUE.C_BIT_SEL_55}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_56 { MODELPARAM_VALUE.C_BIT_SEL_56 PARAM_VALUE.C_BIT_SEL_56 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_56}] ${MODELPARAM_VALUE.C_BIT_SEL_56}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_57 { MODELPARAM_VALUE.C_BIT_SEL_57 PARAM_VALUE.C_BIT_SEL_57 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_57}] ${MODELPARAM_VALUE.C_BIT_SEL_57}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_58 { MODELPARAM_VALUE.C_BIT_SEL_58 PARAM_VALUE.C_BIT_SEL_58 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_58}] ${MODELPARAM_VALUE.C_BIT_SEL_58}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_59 { MODELPARAM_VALUE.C_BIT_SEL_59 PARAM_VALUE.C_BIT_SEL_59 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_59}] ${MODELPARAM_VALUE.C_BIT_SEL_59}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_60 { MODELPARAM_VALUE.C_BIT_SEL_60 PARAM_VALUE.C_BIT_SEL_60 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_60}] ${MODELPARAM_VALUE.C_BIT_SEL_60}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_61 { MODELPARAM_VALUE.C_BIT_SEL_61 PARAM_VALUE.C_BIT_SEL_61 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_61}] ${MODELPARAM_VALUE.C_BIT_SEL_61}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_62 { MODELPARAM_VALUE.C_BIT_SEL_62 PARAM_VALUE.C_BIT_SEL_62 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_62}] ${MODELPARAM_VALUE.C_BIT_SEL_62}
}

proc update_MODELPARAM_VALUE.C_BIT_SEL_63 { MODELPARAM_VALUE.C_BIT_SEL_63 PARAM_VALUE.C_BIT_SEL_63 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_SEL_63}] ${MODELPARAM_VALUE.C_BIT_SEL_63}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_0 { MODELPARAM_VALUE.C_BIT_EN_0 PARAM_VALUE.C_BIT_EN_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_0}] ${MODELPARAM_VALUE.C_BIT_EN_0}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_1 { MODELPARAM_VALUE.C_BIT_EN_1 PARAM_VALUE.C_BIT_EN_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_1}] ${MODELPARAM_VALUE.C_BIT_EN_1}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_2 { MODELPARAM_VALUE.C_BIT_EN_2 PARAM_VALUE.C_BIT_EN_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_2}] ${MODELPARAM_VALUE.C_BIT_EN_2}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_3 { MODELPARAM_VALUE.C_BIT_EN_3 PARAM_VALUE.C_BIT_EN_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_3}] ${MODELPARAM_VALUE.C_BIT_EN_3}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_4 { MODELPARAM_VALUE.C_BIT_EN_4 PARAM_VALUE.C_BIT_EN_4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_4}] ${MODELPARAM_VALUE.C_BIT_EN_4}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_5 { MODELPARAM_VALUE.C_BIT_EN_5 PARAM_VALUE.C_BIT_EN_5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_5}] ${MODELPARAM_VALUE.C_BIT_EN_5}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_6 { MODELPARAM_VALUE.C_BIT_EN_6 PARAM_VALUE.C_BIT_EN_6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_6}] ${MODELPARAM_VALUE.C_BIT_EN_6}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_7 { MODELPARAM_VALUE.C_BIT_EN_7 PARAM_VALUE.C_BIT_EN_7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_7}] ${MODELPARAM_VALUE.C_BIT_EN_7}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_8 { MODELPARAM_VALUE.C_BIT_EN_8 PARAM_VALUE.C_BIT_EN_8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_8}] ${MODELPARAM_VALUE.C_BIT_EN_8}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_9 { MODELPARAM_VALUE.C_BIT_EN_9 PARAM_VALUE.C_BIT_EN_9 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_9}] ${MODELPARAM_VALUE.C_BIT_EN_9}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_10 { MODELPARAM_VALUE.C_BIT_EN_10 PARAM_VALUE.C_BIT_EN_10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_10}] ${MODELPARAM_VALUE.C_BIT_EN_10}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_11 { MODELPARAM_VALUE.C_BIT_EN_11 PARAM_VALUE.C_BIT_EN_11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_11}] ${MODELPARAM_VALUE.C_BIT_EN_11}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_12 { MODELPARAM_VALUE.C_BIT_EN_12 PARAM_VALUE.C_BIT_EN_12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_12}] ${MODELPARAM_VALUE.C_BIT_EN_12}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_13 { MODELPARAM_VALUE.C_BIT_EN_13 PARAM_VALUE.C_BIT_EN_13 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_13}] ${MODELPARAM_VALUE.C_BIT_EN_13}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_14 { MODELPARAM_VALUE.C_BIT_EN_14 PARAM_VALUE.C_BIT_EN_14 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_14}] ${MODELPARAM_VALUE.C_BIT_EN_14}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_15 { MODELPARAM_VALUE.C_BIT_EN_15 PARAM_VALUE.C_BIT_EN_15 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_15}] ${MODELPARAM_VALUE.C_BIT_EN_15}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_16 { MODELPARAM_VALUE.C_BIT_EN_16 PARAM_VALUE.C_BIT_EN_16 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_16}] ${MODELPARAM_VALUE.C_BIT_EN_16}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_17 { MODELPARAM_VALUE.C_BIT_EN_17 PARAM_VALUE.C_BIT_EN_17 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_17}] ${MODELPARAM_VALUE.C_BIT_EN_17}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_18 { MODELPARAM_VALUE.C_BIT_EN_18 PARAM_VALUE.C_BIT_EN_18 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_18}] ${MODELPARAM_VALUE.C_BIT_EN_18}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_19 { MODELPARAM_VALUE.C_BIT_EN_19 PARAM_VALUE.C_BIT_EN_19 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_19}] ${MODELPARAM_VALUE.C_BIT_EN_19}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_20 { MODELPARAM_VALUE.C_BIT_EN_20 PARAM_VALUE.C_BIT_EN_20 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_20}] ${MODELPARAM_VALUE.C_BIT_EN_20}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_21 { MODELPARAM_VALUE.C_BIT_EN_21 PARAM_VALUE.C_BIT_EN_21 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_21}] ${MODELPARAM_VALUE.C_BIT_EN_21}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_22 { MODELPARAM_VALUE.C_BIT_EN_22 PARAM_VALUE.C_BIT_EN_22 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_22}] ${MODELPARAM_VALUE.C_BIT_EN_22}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_23 { MODELPARAM_VALUE.C_BIT_EN_23 PARAM_VALUE.C_BIT_EN_23 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_23}] ${MODELPARAM_VALUE.C_BIT_EN_23}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_24 { MODELPARAM_VALUE.C_BIT_EN_24 PARAM_VALUE.C_BIT_EN_24 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_24}] ${MODELPARAM_VALUE.C_BIT_EN_24}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_25 { MODELPARAM_VALUE.C_BIT_EN_25 PARAM_VALUE.C_BIT_EN_25 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_25}] ${MODELPARAM_VALUE.C_BIT_EN_25}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_26 { MODELPARAM_VALUE.C_BIT_EN_26 PARAM_VALUE.C_BIT_EN_26 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_26}] ${MODELPARAM_VALUE.C_BIT_EN_26}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_27 { MODELPARAM_VALUE.C_BIT_EN_27 PARAM_VALUE.C_BIT_EN_27 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_27}] ${MODELPARAM_VALUE.C_BIT_EN_27}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_28 { MODELPARAM_VALUE.C_BIT_EN_28 PARAM_VALUE.C_BIT_EN_28 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_28}] ${MODELPARAM_VALUE.C_BIT_EN_28}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_29 { MODELPARAM_VALUE.C_BIT_EN_29 PARAM_VALUE.C_BIT_EN_29 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_29}] ${MODELPARAM_VALUE.C_BIT_EN_29}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_30 { MODELPARAM_VALUE.C_BIT_EN_30 PARAM_VALUE.C_BIT_EN_30 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_30}] ${MODELPARAM_VALUE.C_BIT_EN_30}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_31 { MODELPARAM_VALUE.C_BIT_EN_31 PARAM_VALUE.C_BIT_EN_31 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_31}] ${MODELPARAM_VALUE.C_BIT_EN_31}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_32 { MODELPARAM_VALUE.C_BIT_EN_32 PARAM_VALUE.C_BIT_EN_32 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_32}] ${MODELPARAM_VALUE.C_BIT_EN_32}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_33 { MODELPARAM_VALUE.C_BIT_EN_33 PARAM_VALUE.C_BIT_EN_33 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_33}] ${MODELPARAM_VALUE.C_BIT_EN_33}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_34 { MODELPARAM_VALUE.C_BIT_EN_34 PARAM_VALUE.C_BIT_EN_34 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_34}] ${MODELPARAM_VALUE.C_BIT_EN_34}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_35 { MODELPARAM_VALUE.C_BIT_EN_35 PARAM_VALUE.C_BIT_EN_35 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_35}] ${MODELPARAM_VALUE.C_BIT_EN_35}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_36 { MODELPARAM_VALUE.C_BIT_EN_36 PARAM_VALUE.C_BIT_EN_36 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_36}] ${MODELPARAM_VALUE.C_BIT_EN_36}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_37 { MODELPARAM_VALUE.C_BIT_EN_37 PARAM_VALUE.C_BIT_EN_37 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_37}] ${MODELPARAM_VALUE.C_BIT_EN_37}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_38 { MODELPARAM_VALUE.C_BIT_EN_38 PARAM_VALUE.C_BIT_EN_38 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_38}] ${MODELPARAM_VALUE.C_BIT_EN_38}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_39 { MODELPARAM_VALUE.C_BIT_EN_39 PARAM_VALUE.C_BIT_EN_39 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_39}] ${MODELPARAM_VALUE.C_BIT_EN_39}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_40 { MODELPARAM_VALUE.C_BIT_EN_40 PARAM_VALUE.C_BIT_EN_40 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_40}] ${MODELPARAM_VALUE.C_BIT_EN_40}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_41 { MODELPARAM_VALUE.C_BIT_EN_41 PARAM_VALUE.C_BIT_EN_41 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_41}] ${MODELPARAM_VALUE.C_BIT_EN_41}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_42 { MODELPARAM_VALUE.C_BIT_EN_42 PARAM_VALUE.C_BIT_EN_42 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_42}] ${MODELPARAM_VALUE.C_BIT_EN_42}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_43 { MODELPARAM_VALUE.C_BIT_EN_43 PARAM_VALUE.C_BIT_EN_43 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_43}] ${MODELPARAM_VALUE.C_BIT_EN_43}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_44 { MODELPARAM_VALUE.C_BIT_EN_44 PARAM_VALUE.C_BIT_EN_44 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_44}] ${MODELPARAM_VALUE.C_BIT_EN_44}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_45 { MODELPARAM_VALUE.C_BIT_EN_45 PARAM_VALUE.C_BIT_EN_45 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_45}] ${MODELPARAM_VALUE.C_BIT_EN_45}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_46 { MODELPARAM_VALUE.C_BIT_EN_46 PARAM_VALUE.C_BIT_EN_46 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_46}] ${MODELPARAM_VALUE.C_BIT_EN_46}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_47 { MODELPARAM_VALUE.C_BIT_EN_47 PARAM_VALUE.C_BIT_EN_47 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_47}] ${MODELPARAM_VALUE.C_BIT_EN_47}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_48 { MODELPARAM_VALUE.C_BIT_EN_48 PARAM_VALUE.C_BIT_EN_48 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_48}] ${MODELPARAM_VALUE.C_BIT_EN_48}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_49 { MODELPARAM_VALUE.C_BIT_EN_49 PARAM_VALUE.C_BIT_EN_49 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_49}] ${MODELPARAM_VALUE.C_BIT_EN_49}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_50 { MODELPARAM_VALUE.C_BIT_EN_50 PARAM_VALUE.C_BIT_EN_50 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_50}] ${MODELPARAM_VALUE.C_BIT_EN_50}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_51 { MODELPARAM_VALUE.C_BIT_EN_51 PARAM_VALUE.C_BIT_EN_51 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_51}] ${MODELPARAM_VALUE.C_BIT_EN_51}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_52 { MODELPARAM_VALUE.C_BIT_EN_52 PARAM_VALUE.C_BIT_EN_52 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_52}] ${MODELPARAM_VALUE.C_BIT_EN_52}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_53 { MODELPARAM_VALUE.C_BIT_EN_53 PARAM_VALUE.C_BIT_EN_53 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_53}] ${MODELPARAM_VALUE.C_BIT_EN_53}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_54 { MODELPARAM_VALUE.C_BIT_EN_54 PARAM_VALUE.C_BIT_EN_54 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_54}] ${MODELPARAM_VALUE.C_BIT_EN_54}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_55 { MODELPARAM_VALUE.C_BIT_EN_55 PARAM_VALUE.C_BIT_EN_55 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_55}] ${MODELPARAM_VALUE.C_BIT_EN_55}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_56 { MODELPARAM_VALUE.C_BIT_EN_56 PARAM_VALUE.C_BIT_EN_56 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_56}] ${MODELPARAM_VALUE.C_BIT_EN_56}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_57 { MODELPARAM_VALUE.C_BIT_EN_57 PARAM_VALUE.C_BIT_EN_57 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_57}] ${MODELPARAM_VALUE.C_BIT_EN_57}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_58 { MODELPARAM_VALUE.C_BIT_EN_58 PARAM_VALUE.C_BIT_EN_58 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_58}] ${MODELPARAM_VALUE.C_BIT_EN_58}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_59 { MODELPARAM_VALUE.C_BIT_EN_59 PARAM_VALUE.C_BIT_EN_59 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_59}] ${MODELPARAM_VALUE.C_BIT_EN_59}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_60 { MODELPARAM_VALUE.C_BIT_EN_60 PARAM_VALUE.C_BIT_EN_60 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_60}] ${MODELPARAM_VALUE.C_BIT_EN_60}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_61 { MODELPARAM_VALUE.C_BIT_EN_61 PARAM_VALUE.C_BIT_EN_61 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_61}] ${MODELPARAM_VALUE.C_BIT_EN_61}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_62 { MODELPARAM_VALUE.C_BIT_EN_62 PARAM_VALUE.C_BIT_EN_62 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_62}] ${MODELPARAM_VALUE.C_BIT_EN_62}
}

proc update_MODELPARAM_VALUE.C_BIT_EN_63 { MODELPARAM_VALUE.C_BIT_EN_63 PARAM_VALUE.C_BIT_EN_63 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BIT_EN_63}] ${MODELPARAM_VALUE.C_BIT_EN_63}
}

