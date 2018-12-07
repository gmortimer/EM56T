
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/X_IOBUF_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "N_PORTS"
  ipgui::add_param $IPINST -name "GPIO_WIDTH"
  #Adding Page
  set Ports_00-07 [ipgui::add_page $IPINST -name "Ports 00-07"]
  #Adding Group
  set Port_00 [ipgui::add_group $IPINST -name "Port 00" -parent ${Ports_00-07} -layout horizontal]
  ipgui::add_param $IPINST -name "IN00_LEFT" -parent ${Port_00}
  ipgui::add_param $IPINST -name "IN00_RIGHT" -parent ${Port_00}
  ipgui::add_param $IPINST -name "CFG_00" -parent ${Port_00} -widget comboBox

  #Adding Group
  set Port_01 [ipgui::add_group $IPINST -name "Port 01" -parent ${Ports_00-07} -layout horizontal]
  ipgui::add_param $IPINST -name "IN01_LEFT" -parent ${Port_01}
  ipgui::add_param $IPINST -name "IN01_RIGHT" -parent ${Port_01}
  ipgui::add_param $IPINST -name "CFG_01" -parent ${Port_01} -widget comboBox

  #Adding Group
  set Port_02 [ipgui::add_group $IPINST -name "Port 02" -parent ${Ports_00-07} -layout horizontal]
  ipgui::add_param $IPINST -name "IN02_LEFT" -parent ${Port_02}
  ipgui::add_param $IPINST -name "IN02_RIGHT" -parent ${Port_02}
  ipgui::add_param $IPINST -name "CFG_02" -parent ${Port_02} -widget comboBox

  #Adding Group
  set Port_03 [ipgui::add_group $IPINST -name "Port 03" -parent ${Ports_00-07} -layout horizontal]
  ipgui::add_param $IPINST -name "IN03_LEFT" -parent ${Port_03}
  ipgui::add_param $IPINST -name "IN03_RIGHT" -parent ${Port_03}
  ipgui::add_param $IPINST -name "CFG_03" -parent ${Port_03} -widget comboBox

  #Adding Group
  set Port_04 [ipgui::add_group $IPINST -name "Port 04" -parent ${Ports_00-07} -layout horizontal]
  ipgui::add_param $IPINST -name "IN04_LEFT" -parent ${Port_04}
  ipgui::add_param $IPINST -name "IN04_RIGHT" -parent ${Port_04}
  ipgui::add_param $IPINST -name "CFG_04" -parent ${Port_04} -widget comboBox

  #Adding Group
  set Port_05 [ipgui::add_group $IPINST -name "Port 05" -parent ${Ports_00-07} -layout horizontal]
  ipgui::add_param $IPINST -name "IN05_LEFT" -parent ${Port_05}
  ipgui::add_param $IPINST -name "IN05_RIGHT" -parent ${Port_05}
  ipgui::add_param $IPINST -name "CFG_05" -parent ${Port_05} -widget comboBox

  #Adding Group
  set Port_06 [ipgui::add_group $IPINST -name "Port 06" -parent ${Ports_00-07} -layout horizontal]
  ipgui::add_param $IPINST -name "IN06_LEFT" -parent ${Port_06}
  ipgui::add_param $IPINST -name "IN06_RIGHT" -parent ${Port_06}
  ipgui::add_param $IPINST -name "CFG_06" -parent ${Port_06} -widget comboBox

  #Adding Group
  set Port_07 [ipgui::add_group $IPINST -name "Port 07" -parent ${Ports_00-07} -layout horizontal]
  ipgui::add_param $IPINST -name "IN07_LEFT" -parent ${Port_07}
  ipgui::add_param $IPINST -name "IN07_RIGHT" -parent ${Port_07}
  ipgui::add_param $IPINST -name "CFG_07" -parent ${Port_07} -widget comboBox


  #Adding Page
  set Ports_08-15 [ipgui::add_page $IPINST -name "Ports 08-15"]
  #Adding Group
  set Port_08 [ipgui::add_group $IPINST -name "Port 08" -parent ${Ports_08-15} -layout horizontal]
  ipgui::add_param $IPINST -name "IN08_LEFT" -parent ${Port_08}
  ipgui::add_param $IPINST -name "IN08_RIGHT" -parent ${Port_08}
  ipgui::add_param $IPINST -name "CFG_08" -parent ${Port_08} -widget comboBox

  #Adding Group
  set Port_09 [ipgui::add_group $IPINST -name "Port 09" -parent ${Ports_08-15} -layout horizontal]
  ipgui::add_param $IPINST -name "IN09_LEFT" -parent ${Port_09}
  ipgui::add_param $IPINST -name "IN09_RIGHT" -parent ${Port_09}
  ipgui::add_param $IPINST -name "CFG_09" -parent ${Port_09} -widget comboBox

  #Adding Group
  set Port_10 [ipgui::add_group $IPINST -name "Port 10" -parent ${Ports_08-15} -layout horizontal]
  ipgui::add_param $IPINST -name "IN10_LEFT" -parent ${Port_10}
  ipgui::add_param $IPINST -name "IN10_RIGHT" -parent ${Port_10}
  ipgui::add_param $IPINST -name "CFG_10" -parent ${Port_10} -widget comboBox

  #Adding Group
  set Port_11 [ipgui::add_group $IPINST -name "Port 11" -parent ${Ports_08-15} -layout horizontal]
  ipgui::add_param $IPINST -name "IN11_LEFT" -parent ${Port_11}
  ipgui::add_param $IPINST -name "IN11_RIGHT" -parent ${Port_11}
  ipgui::add_param $IPINST -name "CFG_11" -parent ${Port_11} -widget comboBox

  #Adding Group
  set Port_12 [ipgui::add_group $IPINST -name "Port 12" -parent ${Ports_08-15} -layout horizontal]
  ipgui::add_param $IPINST -name "IN12_LEFT" -parent ${Port_12}
  ipgui::add_param $IPINST -name "IN12_RIGHT" -parent ${Port_12}
  ipgui::add_param $IPINST -name "CFG_12" -parent ${Port_12} -widget comboBox

  #Adding Group
  set Port_13 [ipgui::add_group $IPINST -name "Port 13" -parent ${Ports_08-15} -layout horizontal]
  ipgui::add_param $IPINST -name "IN13_LEFT" -parent ${Port_13}
  ipgui::add_param $IPINST -name "IN13_RIGHT" -parent ${Port_13}
  ipgui::add_param $IPINST -name "CFG_13" -parent ${Port_13} -widget comboBox

  #Adding Group
  set Port_14 [ipgui::add_group $IPINST -name "Port 14" -parent ${Ports_08-15} -layout horizontal]
  ipgui::add_param $IPINST -name "IN14_LEFT" -parent ${Port_14}
  ipgui::add_param $IPINST -name "IN14_RIGHT" -parent ${Port_14}
  ipgui::add_param $IPINST -name "CFG_14" -parent ${Port_14} -widget comboBox

  #Adding Group
  set Port_15 [ipgui::add_group $IPINST -name "Port 15" -parent ${Ports_08-15} -layout horizontal]
  ipgui::add_param $IPINST -name "IN15_LEFT" -parent ${Port_15}
  ipgui::add_param $IPINST -name "IN15_RIGHT" -parent ${Port_15}
  ipgui::add_param $IPINST -name "CFG_15" -parent ${Port_15} -widget comboBox


  #Adding Page
  set Ports_16-23 [ipgui::add_page $IPINST -name "Ports 16-23"]
  #Adding Group
  set Port_16 [ipgui::add_group $IPINST -name "Port 16" -parent ${Ports_16-23} -layout horizontal]
  ipgui::add_param $IPINST -name "IN16_LEFT" -parent ${Port_16}
  ipgui::add_param $IPINST -name "IN16_RIGHT" -parent ${Port_16}
  ipgui::add_param $IPINST -name "CFG_16" -parent ${Port_16} -widget comboBox

  #Adding Group
  set Port_17 [ipgui::add_group $IPINST -name "Port 17" -parent ${Ports_16-23} -layout horizontal]
  ipgui::add_param $IPINST -name "IN17_LEFT" -parent ${Port_17}
  ipgui::add_param $IPINST -name "IN17_RIGHT" -parent ${Port_17}
  ipgui::add_param $IPINST -name "CFG_17" -parent ${Port_17} -widget comboBox

  #Adding Group
  set Port_18 [ipgui::add_group $IPINST -name "Port 18" -parent ${Ports_16-23} -layout horizontal]
  ipgui::add_param $IPINST -name "IN18_LEFT" -parent ${Port_18}
  ipgui::add_param $IPINST -name "IN18_RIGHT" -parent ${Port_18}
  ipgui::add_param $IPINST -name "CFG_18" -parent ${Port_18} -widget comboBox

  #Adding Group
  set Port_19 [ipgui::add_group $IPINST -name "Port 19" -parent ${Ports_16-23} -layout horizontal]
  ipgui::add_param $IPINST -name "IN19_LEFT" -parent ${Port_19}
  ipgui::add_param $IPINST -name "IN19_RIGHT" -parent ${Port_19}
  ipgui::add_param $IPINST -name "CFG_19" -parent ${Port_19} -widget comboBox

  #Adding Group
  set Port_20 [ipgui::add_group $IPINST -name "Port 20" -parent ${Ports_16-23} -layout horizontal]
  ipgui::add_param $IPINST -name "IN20_LEFT" -parent ${Port_20}
  ipgui::add_param $IPINST -name "IN20_RIGHT" -parent ${Port_20}
  ipgui::add_param $IPINST -name "CFG_20" -parent ${Port_20} -widget comboBox

  #Adding Group
  set Port_21 [ipgui::add_group $IPINST -name "Port 21" -parent ${Ports_16-23} -layout horizontal]
  ipgui::add_param $IPINST -name "IN21_LEFT" -parent ${Port_21}
  ipgui::add_param $IPINST -name "IN21_RIGHT" -parent ${Port_21}
  ipgui::add_param $IPINST -name "CFG_21" -parent ${Port_21} -widget comboBox

  #Adding Group
  set Port_22 [ipgui::add_group $IPINST -name "Port 22" -parent ${Ports_16-23} -layout horizontal]
  ipgui::add_param $IPINST -name "IN22_LEFT" -parent ${Port_22}
  ipgui::add_param $IPINST -name "IN22_RIGHT" -parent ${Port_22}
  ipgui::add_param $IPINST -name "CFG_22" -parent ${Port_22} -widget comboBox

  #Adding Group
  set Port_23 [ipgui::add_group $IPINST -name "Port 23" -parent ${Ports_16-23} -layout horizontal]
  ipgui::add_param $IPINST -name "IN23_LEFT" -parent ${Port_23}
  ipgui::add_param $IPINST -name "IN23_RIGHT" -parent ${Port_23}
  ipgui::add_param $IPINST -name "CFG_23" -parent ${Port_23} -widget comboBox


  #Adding Page
  set Ports_24-31 [ipgui::add_page $IPINST -name "Ports 24-31"]
  #Adding Group
  set Port_24 [ipgui::add_group $IPINST -name "Port 24" -parent ${Ports_24-31} -layout horizontal]
  ipgui::add_param $IPINST -name "IN24_LEFT" -parent ${Port_24}
  ipgui::add_param $IPINST -name "IN24_RIGHT" -parent ${Port_24}
  ipgui::add_param $IPINST -name "CFG_24" -parent ${Port_24} -widget comboBox

  #Adding Group
  set Port_25 [ipgui::add_group $IPINST -name "Port 25" -parent ${Ports_24-31} -layout horizontal]
  ipgui::add_param $IPINST -name "IN25_LEFT" -parent ${Port_25}
  ipgui::add_param $IPINST -name "IN25_RIGHT" -parent ${Port_25}
  ipgui::add_param $IPINST -name "CFG_25" -parent ${Port_25} -widget comboBox

  #Adding Group
  set Port_26 [ipgui::add_group $IPINST -name "Port 26" -parent ${Ports_24-31} -layout horizontal]
  ipgui::add_param $IPINST -name "IN26_LEFT" -parent ${Port_26}
  ipgui::add_param $IPINST -name "IN26_RIGHT" -parent ${Port_26}
  ipgui::add_param $IPINST -name "CFG_26" -parent ${Port_26} -widget comboBox

  #Adding Group
  set Port_27 [ipgui::add_group $IPINST -name "Port 27" -parent ${Ports_24-31} -layout horizontal]
  ipgui::add_param $IPINST -name "IN27_LEFT" -parent ${Port_27}
  ipgui::add_param $IPINST -name "IN27_RIGHT" -parent ${Port_27}
  ipgui::add_param $IPINST -name "CFG_27" -parent ${Port_27} -widget comboBox

  #Adding Group
  set Port_28 [ipgui::add_group $IPINST -name "Port 28" -parent ${Ports_24-31} -layout horizontal]
  ipgui::add_param $IPINST -name "IN28_LEFT" -parent ${Port_28}
  ipgui::add_param $IPINST -name "IN28_RIGHT" -parent ${Port_28}
  ipgui::add_param $IPINST -name "CFG_28" -parent ${Port_28} -widget comboBox

  #Adding Group
  set Port_29 [ipgui::add_group $IPINST -name "Port 29" -parent ${Ports_24-31} -layout horizontal]
  ipgui::add_param $IPINST -name "IN29_LEFT" -parent ${Port_29}
  ipgui::add_param $IPINST -name "IN29_RIGHT" -parent ${Port_29}
  ipgui::add_param $IPINST -name "CFG_29" -parent ${Port_29} -widget comboBox

  #Adding Group
  set Port_30 [ipgui::add_group $IPINST -name "Port 30" -parent ${Ports_24-31} -layout horizontal]
  ipgui::add_param $IPINST -name "IN30_LEFT" -parent ${Port_30}
  ipgui::add_param $IPINST -name "IN30_RIGHT" -parent ${Port_30}
  ipgui::add_param $IPINST -name "CFG_30" -parent ${Port_30} -widget comboBox

  #Adding Group
  set Port_31 [ipgui::add_group $IPINST -name "Port 31" -parent ${Ports_24-31} -layout horizontal]
  ipgui::add_param $IPINST -name "IN31_LEFT" -parent ${Port_31}
  ipgui::add_param $IPINST -name "IN31_RIGHT" -parent ${Port_31}
  ipgui::add_param $IPINST -name "CFG_31" -parent ${Port_31} -widget comboBox


  #Adding Page
  set Ports_32-39 [ipgui::add_page $IPINST -name "Ports 32-39"]
  #Adding Group
  set Port_32 [ipgui::add_group $IPINST -name "Port 32" -parent ${Ports_32-39} -layout horizontal]
  ipgui::add_param $IPINST -name "IN32_LEFT" -parent ${Port_32}
  ipgui::add_param $IPINST -name "IN32_RIGHT" -parent ${Port_32}
  ipgui::add_param $IPINST -name "CFG_32" -parent ${Port_32} -widget comboBox

  #Adding Group
  set Port_33 [ipgui::add_group $IPINST -name "Port 33" -parent ${Ports_32-39} -layout horizontal]
  ipgui::add_param $IPINST -name "IN33_LEFT" -parent ${Port_33}
  ipgui::add_param $IPINST -name "IN33_RIGHT" -parent ${Port_33}
  ipgui::add_param $IPINST -name "CFG_33" -parent ${Port_33} -widget comboBox

  #Adding Group
  set Port_34 [ipgui::add_group $IPINST -name "Port 34" -parent ${Ports_32-39} -layout horizontal]
  ipgui::add_param $IPINST -name "IN34_LEFT" -parent ${Port_34}
  ipgui::add_param $IPINST -name "IN34_RIGHT" -parent ${Port_34}
  ipgui::add_param $IPINST -name "CFG_34" -parent ${Port_34} -widget comboBox

  #Adding Group
  set Port_35 [ipgui::add_group $IPINST -name "Port 35" -parent ${Ports_32-39} -layout horizontal]
  ipgui::add_param $IPINST -name "IN35_LEFT" -parent ${Port_35}
  ipgui::add_param $IPINST -name "IN35_RIGHT" -parent ${Port_35}
  ipgui::add_param $IPINST -name "CFG_35" -parent ${Port_35} -widget comboBox

  #Adding Group
  set Port_36 [ipgui::add_group $IPINST -name "Port 36" -parent ${Ports_32-39} -layout horizontal]
  ipgui::add_param $IPINST -name "IN36_LEFT" -parent ${Port_36}
  ipgui::add_param $IPINST -name "IN36_RIGHT" -parent ${Port_36}
  ipgui::add_param $IPINST -name "CFG_36" -parent ${Port_36} -widget comboBox

  #Adding Group
  set Port_37 [ipgui::add_group $IPINST -name "Port 37" -parent ${Ports_32-39} -layout horizontal]
  ipgui::add_param $IPINST -name "IN37_LEFT" -parent ${Port_37}
  ipgui::add_param $IPINST -name "IN37_RIGHT" -parent ${Port_37}
  ipgui::add_param $IPINST -name "CFG_37" -parent ${Port_37} -widget comboBox

  #Adding Group
  set Port_38 [ipgui::add_group $IPINST -name "Port 38" -parent ${Ports_32-39} -layout horizontal]
  ipgui::add_param $IPINST -name "IN38_LEFT" -parent ${Port_38}
  ipgui::add_param $IPINST -name "IN38_RIGHT" -parent ${Port_38}
  ipgui::add_param $IPINST -name "CFG_38" -parent ${Port_38} -widget comboBox

  #Adding Group
  set Port_39 [ipgui::add_group $IPINST -name "Port 39" -parent ${Ports_32-39} -layout horizontal]
  ipgui::add_param $IPINST -name "IN39_LEFT" -parent ${Port_39}
  ipgui::add_param $IPINST -name "IN39_RIGHT" -parent ${Port_39}
  ipgui::add_param $IPINST -name "CFG_39" -parent ${Port_39} -widget comboBox


  #Adding Page
  set Ports_40-47 [ipgui::add_page $IPINST -name "Ports 40-47"]
  #Adding Group
  set Port_40 [ipgui::add_group $IPINST -name "Port 40" -parent ${Ports_40-47} -layout horizontal]
  ipgui::add_param $IPINST -name "IN40_LEFT" -parent ${Port_40}
  ipgui::add_param $IPINST -name "IN40_RIGHT" -parent ${Port_40}
  ipgui::add_param $IPINST -name "CFG_40" -parent ${Port_40} -widget comboBox

  #Adding Group
  set Port_41 [ipgui::add_group $IPINST -name "Port 41" -parent ${Ports_40-47} -layout horizontal]
  ipgui::add_param $IPINST -name "IN41_LEFT" -parent ${Port_41}
  ipgui::add_param $IPINST -name "IN41_RIGHT" -parent ${Port_41}
  ipgui::add_param $IPINST -name "CFG_41" -parent ${Port_41} -widget comboBox

  #Adding Group
  set Port_42 [ipgui::add_group $IPINST -name "Port 42" -parent ${Ports_40-47} -layout horizontal]
  ipgui::add_param $IPINST -name "IN42_LEFT" -parent ${Port_42}
  ipgui::add_param $IPINST -name "IN42_RIGHT" -parent ${Port_42}
  ipgui::add_param $IPINST -name "CFG_42" -parent ${Port_42} -widget comboBox

  #Adding Group
  set Port_43 [ipgui::add_group $IPINST -name "Port 43" -parent ${Ports_40-47} -layout horizontal]
  ipgui::add_param $IPINST -name "IN43_LEFT" -parent ${Port_43}
  ipgui::add_param $IPINST -name "IN43_RIGHT" -parent ${Port_43}
  ipgui::add_param $IPINST -name "CFG_43" -parent ${Port_43} -widget comboBox

  #Adding Group
  set Port_44 [ipgui::add_group $IPINST -name "Port 44" -parent ${Ports_40-47} -layout horizontal]
  ipgui::add_param $IPINST -name "IN44_LEFT" -parent ${Port_44}
  ipgui::add_param $IPINST -name "IN44_RIGHT" -parent ${Port_44}
  ipgui::add_param $IPINST -name "CFG_44" -parent ${Port_44} -widget comboBox

  #Adding Group
  set Port_45 [ipgui::add_group $IPINST -name "Port 45" -parent ${Ports_40-47} -layout horizontal]
  ipgui::add_param $IPINST -name "IN45_LEFT" -parent ${Port_45}
  ipgui::add_param $IPINST -name "IN45_RIGHT" -parent ${Port_45}
  ipgui::add_param $IPINST -name "CFG_45" -parent ${Port_45} -widget comboBox

  #Adding Group
  set Port_46 [ipgui::add_group $IPINST -name "Port 46" -parent ${Ports_40-47} -layout horizontal]
  ipgui::add_param $IPINST -name "IN46_LEFT" -parent ${Port_46}
  ipgui::add_param $IPINST -name "IN46_RIGHT" -parent ${Port_46}
  ipgui::add_param $IPINST -name "CFG_46" -parent ${Port_46} -widget comboBox

  #Adding Group
  set Port_47 [ipgui::add_group $IPINST -name "Port 47" -parent ${Ports_40-47} -layout horizontal]
  ipgui::add_param $IPINST -name "IN47_LEFT" -parent ${Port_47}
  ipgui::add_param $IPINST -name "IN47_RIGHT" -parent ${Port_47}
  ipgui::add_param $IPINST -name "CFG_47" -parent ${Port_47} -widget comboBox


  #Adding Page
  set Ports_48-55 [ipgui::add_page $IPINST -name "Ports 48-55"]
  #Adding Group
  set Port_48 [ipgui::add_group $IPINST -name "Port 48" -parent ${Ports_48-55} -layout horizontal]
  ipgui::add_param $IPINST -name "IN48_LEFT" -parent ${Port_48}
  ipgui::add_param $IPINST -name "IN48_RIGHT" -parent ${Port_48}
  ipgui::add_param $IPINST -name "CFG_48" -parent ${Port_48} -widget comboBox

  #Adding Group
  set Port_49 [ipgui::add_group $IPINST -name "Port 49" -parent ${Ports_48-55} -layout horizontal]
  ipgui::add_param $IPINST -name "IN49_LEFT" -parent ${Port_49}
  ipgui::add_param $IPINST -name "IN49_RIGHT" -parent ${Port_49}
  ipgui::add_param $IPINST -name "CFG_49" -parent ${Port_49} -widget comboBox

  #Adding Group
  set Port_50 [ipgui::add_group $IPINST -name "Port 50" -parent ${Ports_48-55} -layout horizontal]
  ipgui::add_param $IPINST -name "IN50_LEFT" -parent ${Port_50}
  ipgui::add_param $IPINST -name "IN50_RIGHT" -parent ${Port_50}
  ipgui::add_param $IPINST -name "CFG_50" -parent ${Port_50} -widget comboBox

  #Adding Group
  set Port_51 [ipgui::add_group $IPINST -name "Port 51" -parent ${Ports_48-55} -layout horizontal]
  ipgui::add_param $IPINST -name "IN51_LEFT" -parent ${Port_51}
  ipgui::add_param $IPINST -name "IN51_RIGHT" -parent ${Port_51}
  ipgui::add_param $IPINST -name "CFG_51" -parent ${Port_51} -widget comboBox

  #Adding Group
  set Port_52 [ipgui::add_group $IPINST -name "Port 52" -parent ${Ports_48-55} -layout horizontal]
  ipgui::add_param $IPINST -name "IN52_LEFT" -parent ${Port_52}
  ipgui::add_param $IPINST -name "IN52_RIGHT" -parent ${Port_52}
  ipgui::add_param $IPINST -name "CFG_52" -parent ${Port_52} -widget comboBox

  #Adding Group
  set Port_53 [ipgui::add_group $IPINST -name "Port 53" -parent ${Ports_48-55} -layout horizontal]
  ipgui::add_param $IPINST -name "IN53_LEFT" -parent ${Port_53}
  ipgui::add_param $IPINST -name "IN53_RIGHT" -parent ${Port_53}
  ipgui::add_param $IPINST -name "CFG_53" -parent ${Port_53} -widget comboBox

  #Adding Group
  set Port_54 [ipgui::add_group $IPINST -name "Port 54" -parent ${Ports_48-55} -layout horizontal]
  ipgui::add_param $IPINST -name "IN54_LEFT" -parent ${Port_54}
  ipgui::add_param $IPINST -name "IN54_RIGHT" -parent ${Port_54}
  ipgui::add_param $IPINST -name "CFG_54" -parent ${Port_54} -widget comboBox

  #Adding Group
  set Port_55 [ipgui::add_group $IPINST -name "Port 55" -parent ${Ports_48-55} -layout horizontal]
  ipgui::add_param $IPINST -name "IN55_LEFT" -parent ${Port_55}
  ipgui::add_param $IPINST -name "IN55_RIGHT" -parent ${Port_55}
  ipgui::add_param $IPINST -name "CFG_55" -parent ${Port_55} -widget comboBox


  #Adding Page
  set Ports_56-63 [ipgui::add_page $IPINST -name "Ports 56-63"]
  #Adding Group
  set Port_56 [ipgui::add_group $IPINST -name "Port 56" -parent ${Ports_56-63} -layout horizontal]
  ipgui::add_param $IPINST -name "IN56_LEFT" -parent ${Port_56}
  ipgui::add_param $IPINST -name "IN56_RIGHT" -parent ${Port_56}
  ipgui::add_param $IPINST -name "CFG_56" -parent ${Port_56} -widget comboBox

  #Adding Group
  set Port_57 [ipgui::add_group $IPINST -name "Port 57" -parent ${Ports_56-63} -layout horizontal]
  ipgui::add_param $IPINST -name "IN57_LEFT" -parent ${Port_57}
  ipgui::add_param $IPINST -name "IN57_RIGHT" -parent ${Port_57}
  ipgui::add_param $IPINST -name "CFG_57" -parent ${Port_57} -widget comboBox

  #Adding Group
  set Port_58 [ipgui::add_group $IPINST -name "Port 58" -parent ${Ports_56-63} -layout horizontal]
  ipgui::add_param $IPINST -name "IN58_LEFT" -parent ${Port_58}
  ipgui::add_param $IPINST -name "IN58_RIGHT" -parent ${Port_58}
  ipgui::add_param $IPINST -name "CFG_58" -parent ${Port_58} -widget comboBox

  #Adding Group
  set Port_59 [ipgui::add_group $IPINST -name "Port 59" -parent ${Ports_56-63} -layout horizontal]
  ipgui::add_param $IPINST -name "IN59_LEFT" -parent ${Port_59}
  ipgui::add_param $IPINST -name "IN59_RIGHT" -parent ${Port_59}
  ipgui::add_param $IPINST -name "CFG_59" -parent ${Port_59} -widget comboBox

  #Adding Group
  set Port_60 [ipgui::add_group $IPINST -name "Port 60" -parent ${Ports_56-63} -layout horizontal]
  ipgui::add_param $IPINST -name "IN60_LEFT" -parent ${Port_60}
  ipgui::add_param $IPINST -name "IN60_RIGHT" -parent ${Port_60}
  ipgui::add_param $IPINST -name "CFG_60" -parent ${Port_60} -widget comboBox

  #Adding Group
  set Port_61 [ipgui::add_group $IPINST -name "Port 61" -parent ${Ports_56-63} -layout horizontal]
  ipgui::add_param $IPINST -name "IN61_LEFT" -parent ${Port_61}
  ipgui::add_param $IPINST -name "IN61_RIGHT" -parent ${Port_61}
  ipgui::add_param $IPINST -name "CFG_61" -parent ${Port_61} -widget comboBox

  #Adding Group
  set Port_62 [ipgui::add_group $IPINST -name "Port 62" -parent ${Ports_56-63} -layout horizontal]
  ipgui::add_param $IPINST -name "IN62_LEFT" -parent ${Port_62}
  ipgui::add_param $IPINST -name "IN62_RIGHT" -parent ${Port_62}
  ipgui::add_param $IPINST -name "CFG_62" -parent ${Port_62} -widget comboBox

  #Adding Group
  set Port_63 [ipgui::add_group $IPINST -name "Port 63" -parent ${Ports_56-63} -layout horizontal]
  ipgui::add_param $IPINST -name "IN63_LEFT" -parent ${Port_63}
  ipgui::add_param $IPINST -name "IN63_RIGHT" -parent ${Port_63}
  ipgui::add_param $IPINST -name "CFG_63" -parent ${Port_63} -widget comboBox



}

proc update_PARAM_VALUE.CFG_00 { PARAM_VALUE.CFG_00 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_00 when any of the dependent parameters in the arguments change
	
	set CFG_00 ${PARAM_VALUE.CFG_00}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_00_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_00
	} else {
		set_property enabled false $CFG_00
	}
}

proc validate_PARAM_VALUE.CFG_00 { PARAM_VALUE.CFG_00 } {
	# Procedure called to validate CFG_00
	return true
}

proc update_PARAM_VALUE.CFG_01 { PARAM_VALUE.CFG_01 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_01 when any of the dependent parameters in the arguments change
	
	set CFG_01 ${PARAM_VALUE.CFG_01}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_01_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_01
	} else {
		set_property enabled false $CFG_01
	}
}

proc validate_PARAM_VALUE.CFG_01 { PARAM_VALUE.CFG_01 } {
	# Procedure called to validate CFG_01
	return true
}

proc update_PARAM_VALUE.CFG_02 { PARAM_VALUE.CFG_02 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_02 when any of the dependent parameters in the arguments change
	
	set CFG_02 ${PARAM_VALUE.CFG_02}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_02_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_02
	} else {
		set_property enabled false $CFG_02
	}
}

proc validate_PARAM_VALUE.CFG_02 { PARAM_VALUE.CFG_02 } {
	# Procedure called to validate CFG_02
	return true
}

proc update_PARAM_VALUE.CFG_03 { PARAM_VALUE.CFG_03 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_03 when any of the dependent parameters in the arguments change
	
	set CFG_03 ${PARAM_VALUE.CFG_03}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_03_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_03
	} else {
		set_property enabled false $CFG_03
	}
}

proc validate_PARAM_VALUE.CFG_03 { PARAM_VALUE.CFG_03 } {
	# Procedure called to validate CFG_03
	return true
}

proc update_PARAM_VALUE.CFG_04 { PARAM_VALUE.CFG_04 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_04 when any of the dependent parameters in the arguments change
	
	set CFG_04 ${PARAM_VALUE.CFG_04}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_04_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_04
	} else {
		set_property enabled false $CFG_04
	}
}

proc validate_PARAM_VALUE.CFG_04 { PARAM_VALUE.CFG_04 } {
	# Procedure called to validate CFG_04
	return true
}

proc update_PARAM_VALUE.CFG_05 { PARAM_VALUE.CFG_05 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_05 when any of the dependent parameters in the arguments change
	
	set CFG_05 ${PARAM_VALUE.CFG_05}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_05_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_05
	} else {
		set_property enabled false $CFG_05
	}
}

proc validate_PARAM_VALUE.CFG_05 { PARAM_VALUE.CFG_05 } {
	# Procedure called to validate CFG_05
	return true
}

proc update_PARAM_VALUE.CFG_06 { PARAM_VALUE.CFG_06 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_06 when any of the dependent parameters in the arguments change
	
	set CFG_06 ${PARAM_VALUE.CFG_06}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_06_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_06
	} else {
		set_property enabled false $CFG_06
	}
}

proc validate_PARAM_VALUE.CFG_06 { PARAM_VALUE.CFG_06 } {
	# Procedure called to validate CFG_06
	return true
}

proc update_PARAM_VALUE.CFG_07 { PARAM_VALUE.CFG_07 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_07 when any of the dependent parameters in the arguments change
	
	set CFG_07 ${PARAM_VALUE.CFG_07}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_07_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_07
	} else {
		set_property enabled false $CFG_07
	}
}

proc validate_PARAM_VALUE.CFG_07 { PARAM_VALUE.CFG_07 } {
	# Procedure called to validate CFG_07
	return true
}

proc update_PARAM_VALUE.CFG_08 { PARAM_VALUE.CFG_08 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_08 when any of the dependent parameters in the arguments change
	
	set CFG_08 ${PARAM_VALUE.CFG_08}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_08_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_08
	} else {
		set_property enabled false $CFG_08
	}
}

proc validate_PARAM_VALUE.CFG_08 { PARAM_VALUE.CFG_08 } {
	# Procedure called to validate CFG_08
	return true
}

proc update_PARAM_VALUE.CFG_09 { PARAM_VALUE.CFG_09 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_09 when any of the dependent parameters in the arguments change
	
	set CFG_09 ${PARAM_VALUE.CFG_09}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_09_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_09
	} else {
		set_property enabled false $CFG_09
	}
}

proc validate_PARAM_VALUE.CFG_09 { PARAM_VALUE.CFG_09 } {
	# Procedure called to validate CFG_09
	return true
}

proc update_PARAM_VALUE.CFG_10 { PARAM_VALUE.CFG_10 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_10 when any of the dependent parameters in the arguments change
	
	set CFG_10 ${PARAM_VALUE.CFG_10}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_10_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_10
	} else {
		set_property enabled false $CFG_10
	}
}

proc validate_PARAM_VALUE.CFG_10 { PARAM_VALUE.CFG_10 } {
	# Procedure called to validate CFG_10
	return true
}

proc update_PARAM_VALUE.CFG_11 { PARAM_VALUE.CFG_11 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_11 when any of the dependent parameters in the arguments change
	
	set CFG_11 ${PARAM_VALUE.CFG_11}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_11_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_11
	} else {
		set_property enabled false $CFG_11
	}
}

proc validate_PARAM_VALUE.CFG_11 { PARAM_VALUE.CFG_11 } {
	# Procedure called to validate CFG_11
	return true
}

proc update_PARAM_VALUE.CFG_12 { PARAM_VALUE.CFG_12 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_12 when any of the dependent parameters in the arguments change
	
	set CFG_12 ${PARAM_VALUE.CFG_12}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_12_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_12
	} else {
		set_property enabled false $CFG_12
	}
}

proc validate_PARAM_VALUE.CFG_12 { PARAM_VALUE.CFG_12 } {
	# Procedure called to validate CFG_12
	return true
}

proc update_PARAM_VALUE.CFG_13 { PARAM_VALUE.CFG_13 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_13 when any of the dependent parameters in the arguments change
	
	set CFG_13 ${PARAM_VALUE.CFG_13}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_13_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_13
	} else {
		set_property enabled false $CFG_13
	}
}

proc validate_PARAM_VALUE.CFG_13 { PARAM_VALUE.CFG_13 } {
	# Procedure called to validate CFG_13
	return true
}

proc update_PARAM_VALUE.CFG_14 { PARAM_VALUE.CFG_14 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_14 when any of the dependent parameters in the arguments change
	
	set CFG_14 ${PARAM_VALUE.CFG_14}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_14_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_14
	} else {
		set_property enabled false $CFG_14
	}
}

proc validate_PARAM_VALUE.CFG_14 { PARAM_VALUE.CFG_14 } {
	# Procedure called to validate CFG_14
	return true
}

proc update_PARAM_VALUE.CFG_15 { PARAM_VALUE.CFG_15 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_15 when any of the dependent parameters in the arguments change
	
	set CFG_15 ${PARAM_VALUE.CFG_15}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_15_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_15
	} else {
		set_property enabled false $CFG_15
	}
}

proc validate_PARAM_VALUE.CFG_15 { PARAM_VALUE.CFG_15 } {
	# Procedure called to validate CFG_15
	return true
}

proc update_PARAM_VALUE.CFG_16 { PARAM_VALUE.CFG_16 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_16 when any of the dependent parameters in the arguments change
	
	set CFG_16 ${PARAM_VALUE.CFG_16}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_16_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_16
	} else {
		set_property enabled false $CFG_16
	}
}

proc validate_PARAM_VALUE.CFG_16 { PARAM_VALUE.CFG_16 } {
	# Procedure called to validate CFG_16
	return true
}

proc update_PARAM_VALUE.CFG_17 { PARAM_VALUE.CFG_17 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_17 when any of the dependent parameters in the arguments change
	
	set CFG_17 ${PARAM_VALUE.CFG_17}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_17_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_17
	} else {
		set_property enabled false $CFG_17
	}
}

proc validate_PARAM_VALUE.CFG_17 { PARAM_VALUE.CFG_17 } {
	# Procedure called to validate CFG_17
	return true
}

proc update_PARAM_VALUE.CFG_18 { PARAM_VALUE.CFG_18 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_18 when any of the dependent parameters in the arguments change
	
	set CFG_18 ${PARAM_VALUE.CFG_18}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_18_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_18
	} else {
		set_property enabled false $CFG_18
	}
}

proc validate_PARAM_VALUE.CFG_18 { PARAM_VALUE.CFG_18 } {
	# Procedure called to validate CFG_18
	return true
}

proc update_PARAM_VALUE.CFG_19 { PARAM_VALUE.CFG_19 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_19 when any of the dependent parameters in the arguments change
	
	set CFG_19 ${PARAM_VALUE.CFG_19}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_19_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_19
	} else {
		set_property enabled false $CFG_19
	}
}

proc validate_PARAM_VALUE.CFG_19 { PARAM_VALUE.CFG_19 } {
	# Procedure called to validate CFG_19
	return true
}

proc update_PARAM_VALUE.CFG_20 { PARAM_VALUE.CFG_20 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_20 when any of the dependent parameters in the arguments change
	
	set CFG_20 ${PARAM_VALUE.CFG_20}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_20_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_20
	} else {
		set_property enabled false $CFG_20
	}
}

proc validate_PARAM_VALUE.CFG_20 { PARAM_VALUE.CFG_20 } {
	# Procedure called to validate CFG_20
	return true
}

proc update_PARAM_VALUE.CFG_21 { PARAM_VALUE.CFG_21 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_21 when any of the dependent parameters in the arguments change
	
	set CFG_21 ${PARAM_VALUE.CFG_21}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_21_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_21
	} else {
		set_property enabled false $CFG_21
	}
}

proc validate_PARAM_VALUE.CFG_21 { PARAM_VALUE.CFG_21 } {
	# Procedure called to validate CFG_21
	return true
}

proc update_PARAM_VALUE.CFG_22 { PARAM_VALUE.CFG_22 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_22 when any of the dependent parameters in the arguments change
	
	set CFG_22 ${PARAM_VALUE.CFG_22}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_22_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_22
	} else {
		set_property enabled false $CFG_22
	}
}

proc validate_PARAM_VALUE.CFG_22 { PARAM_VALUE.CFG_22 } {
	# Procedure called to validate CFG_22
	return true
}

proc update_PARAM_VALUE.CFG_23 { PARAM_VALUE.CFG_23 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_23 when any of the dependent parameters in the arguments change
	
	set CFG_23 ${PARAM_VALUE.CFG_23}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_23_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_23
	} else {
		set_property enabled false $CFG_23
	}
}

proc validate_PARAM_VALUE.CFG_23 { PARAM_VALUE.CFG_23 } {
	# Procedure called to validate CFG_23
	return true
}

proc update_PARAM_VALUE.CFG_24 { PARAM_VALUE.CFG_24 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_24 when any of the dependent parameters in the arguments change
	
	set CFG_24 ${PARAM_VALUE.CFG_24}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_24_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_24
	} else {
		set_property enabled false $CFG_24
	}
}

proc validate_PARAM_VALUE.CFG_24 { PARAM_VALUE.CFG_24 } {
	# Procedure called to validate CFG_24
	return true
}

proc update_PARAM_VALUE.CFG_25 { PARAM_VALUE.CFG_25 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_25 when any of the dependent parameters in the arguments change
	
	set CFG_25 ${PARAM_VALUE.CFG_25}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_25_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_25
	} else {
		set_property enabled false $CFG_25
	}
}

proc validate_PARAM_VALUE.CFG_25 { PARAM_VALUE.CFG_25 } {
	# Procedure called to validate CFG_25
	return true
}

proc update_PARAM_VALUE.CFG_26 { PARAM_VALUE.CFG_26 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_26 when any of the dependent parameters in the arguments change
	
	set CFG_26 ${PARAM_VALUE.CFG_26}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_26_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_26
	} else {
		set_property enabled false $CFG_26
	}
}

proc validate_PARAM_VALUE.CFG_26 { PARAM_VALUE.CFG_26 } {
	# Procedure called to validate CFG_26
	return true
}

proc update_PARAM_VALUE.CFG_27 { PARAM_VALUE.CFG_27 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_27 when any of the dependent parameters in the arguments change
	
	set CFG_27 ${PARAM_VALUE.CFG_27}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_27_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_27
	} else {
		set_property enabled false $CFG_27
	}
}

proc validate_PARAM_VALUE.CFG_27 { PARAM_VALUE.CFG_27 } {
	# Procedure called to validate CFG_27
	return true
}

proc update_PARAM_VALUE.CFG_28 { PARAM_VALUE.CFG_28 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_28 when any of the dependent parameters in the arguments change
	
	set CFG_28 ${PARAM_VALUE.CFG_28}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_28_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_28
	} else {
		set_property enabled false $CFG_28
	}
}

proc validate_PARAM_VALUE.CFG_28 { PARAM_VALUE.CFG_28 } {
	# Procedure called to validate CFG_28
	return true
}

proc update_PARAM_VALUE.CFG_29 { PARAM_VALUE.CFG_29 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_29 when any of the dependent parameters in the arguments change
	
	set CFG_29 ${PARAM_VALUE.CFG_29}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_29_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_29
	} else {
		set_property enabled false $CFG_29
	}
}

proc validate_PARAM_VALUE.CFG_29 { PARAM_VALUE.CFG_29 } {
	# Procedure called to validate CFG_29
	return true
}

proc update_PARAM_VALUE.CFG_30 { PARAM_VALUE.CFG_30 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_30 when any of the dependent parameters in the arguments change
	
	set CFG_30 ${PARAM_VALUE.CFG_30}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_30_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_30
	} else {
		set_property enabled false $CFG_30
	}
}

proc validate_PARAM_VALUE.CFG_30 { PARAM_VALUE.CFG_30 } {
	# Procedure called to validate CFG_30
	return true
}

proc update_PARAM_VALUE.CFG_31 { PARAM_VALUE.CFG_31 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_31 when any of the dependent parameters in the arguments change
	
	set CFG_31 ${PARAM_VALUE.CFG_31}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_31_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_31
	} else {
		set_property enabled false $CFG_31
	}
}

proc validate_PARAM_VALUE.CFG_31 { PARAM_VALUE.CFG_31 } {
	# Procedure called to validate CFG_31
	return true
}

proc update_PARAM_VALUE.CFG_32 { PARAM_VALUE.CFG_32 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_32 when any of the dependent parameters in the arguments change
	
	set CFG_32 ${PARAM_VALUE.CFG_32}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_32_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_32
	} else {
		set_property enabled false $CFG_32
	}
}

proc validate_PARAM_VALUE.CFG_32 { PARAM_VALUE.CFG_32 } {
	# Procedure called to validate CFG_32
	return true
}

proc update_PARAM_VALUE.CFG_33 { PARAM_VALUE.CFG_33 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_33 when any of the dependent parameters in the arguments change
	
	set CFG_33 ${PARAM_VALUE.CFG_33}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_33_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_33
	} else {
		set_property enabled false $CFG_33
	}
}

proc validate_PARAM_VALUE.CFG_33 { PARAM_VALUE.CFG_33 } {
	# Procedure called to validate CFG_33
	return true
}

proc update_PARAM_VALUE.CFG_34 { PARAM_VALUE.CFG_34 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_34 when any of the dependent parameters in the arguments change
	
	set CFG_34 ${PARAM_VALUE.CFG_34}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_34_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_34
	} else {
		set_property enabled false $CFG_34
	}
}

proc validate_PARAM_VALUE.CFG_34 { PARAM_VALUE.CFG_34 } {
	# Procedure called to validate CFG_34
	return true
}

proc update_PARAM_VALUE.CFG_35 { PARAM_VALUE.CFG_35 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_35 when any of the dependent parameters in the arguments change
	
	set CFG_35 ${PARAM_VALUE.CFG_35}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_35_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_35
	} else {
		set_property enabled false $CFG_35
	}
}

proc validate_PARAM_VALUE.CFG_35 { PARAM_VALUE.CFG_35 } {
	# Procedure called to validate CFG_35
	return true
}

proc update_PARAM_VALUE.CFG_36 { PARAM_VALUE.CFG_36 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_36 when any of the dependent parameters in the arguments change
	
	set CFG_36 ${PARAM_VALUE.CFG_36}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_36_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_36
	} else {
		set_property enabled false $CFG_36
	}
}

proc validate_PARAM_VALUE.CFG_36 { PARAM_VALUE.CFG_36 } {
	# Procedure called to validate CFG_36
	return true
}

proc update_PARAM_VALUE.CFG_37 { PARAM_VALUE.CFG_37 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_37 when any of the dependent parameters in the arguments change
	
	set CFG_37 ${PARAM_VALUE.CFG_37}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_37_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_37
	} else {
		set_property enabled false $CFG_37
	}
}

proc validate_PARAM_VALUE.CFG_37 { PARAM_VALUE.CFG_37 } {
	# Procedure called to validate CFG_37
	return true
}

proc update_PARAM_VALUE.CFG_38 { PARAM_VALUE.CFG_38 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_38 when any of the dependent parameters in the arguments change
	
	set CFG_38 ${PARAM_VALUE.CFG_38}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_38_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_38
	} else {
		set_property enabled false $CFG_38
	}
}

proc validate_PARAM_VALUE.CFG_38 { PARAM_VALUE.CFG_38 } {
	# Procedure called to validate CFG_38
	return true
}

proc update_PARAM_VALUE.CFG_39 { PARAM_VALUE.CFG_39 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_39 when any of the dependent parameters in the arguments change
	
	set CFG_39 ${PARAM_VALUE.CFG_39}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_39_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_39
	} else {
		set_property enabled false $CFG_39
	}
}

proc validate_PARAM_VALUE.CFG_39 { PARAM_VALUE.CFG_39 } {
	# Procedure called to validate CFG_39
	return true
}

proc update_PARAM_VALUE.CFG_40 { PARAM_VALUE.CFG_40 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_40 when any of the dependent parameters in the arguments change
	
	set CFG_40 ${PARAM_VALUE.CFG_40}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_40_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_40
	} else {
		set_property enabled false $CFG_40
	}
}

proc validate_PARAM_VALUE.CFG_40 { PARAM_VALUE.CFG_40 } {
	# Procedure called to validate CFG_40
	return true
}

proc update_PARAM_VALUE.CFG_41 { PARAM_VALUE.CFG_41 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_41 when any of the dependent parameters in the arguments change
	
	set CFG_41 ${PARAM_VALUE.CFG_41}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_41_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_41
	} else {
		set_property enabled false $CFG_41
	}
}

proc validate_PARAM_VALUE.CFG_41 { PARAM_VALUE.CFG_41 } {
	# Procedure called to validate CFG_41
	return true
}

proc update_PARAM_VALUE.CFG_42 { PARAM_VALUE.CFG_42 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_42 when any of the dependent parameters in the arguments change
	
	set CFG_42 ${PARAM_VALUE.CFG_42}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_42_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_42
	} else {
		set_property enabled false $CFG_42
	}
}

proc validate_PARAM_VALUE.CFG_42 { PARAM_VALUE.CFG_42 } {
	# Procedure called to validate CFG_42
	return true
}

proc update_PARAM_VALUE.CFG_43 { PARAM_VALUE.CFG_43 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_43 when any of the dependent parameters in the arguments change
	
	set CFG_43 ${PARAM_VALUE.CFG_43}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_43_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_43
	} else {
		set_property enabled false $CFG_43
	}
}

proc validate_PARAM_VALUE.CFG_43 { PARAM_VALUE.CFG_43 } {
	# Procedure called to validate CFG_43
	return true
}

proc update_PARAM_VALUE.CFG_44 { PARAM_VALUE.CFG_44 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_44 when any of the dependent parameters in the arguments change
	
	set CFG_44 ${PARAM_VALUE.CFG_44}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_44_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_44
	} else {
		set_property enabled false $CFG_44
	}
}

proc validate_PARAM_VALUE.CFG_44 { PARAM_VALUE.CFG_44 } {
	# Procedure called to validate CFG_44
	return true
}

proc update_PARAM_VALUE.CFG_45 { PARAM_VALUE.CFG_45 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_45 when any of the dependent parameters in the arguments change
	
	set CFG_45 ${PARAM_VALUE.CFG_45}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_45_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_45
	} else {
		set_property enabled false $CFG_45
	}
}

proc validate_PARAM_VALUE.CFG_45 { PARAM_VALUE.CFG_45 } {
	# Procedure called to validate CFG_45
	return true
}

proc update_PARAM_VALUE.CFG_46 { PARAM_VALUE.CFG_46 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_46 when any of the dependent parameters in the arguments change
	
	set CFG_46 ${PARAM_VALUE.CFG_46}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_46_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_46
	} else {
		set_property enabled false $CFG_46
	}
}

proc validate_PARAM_VALUE.CFG_46 { PARAM_VALUE.CFG_46 } {
	# Procedure called to validate CFG_46
	return true
}

proc update_PARAM_VALUE.CFG_47 { PARAM_VALUE.CFG_47 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_47 when any of the dependent parameters in the arguments change
	
	set CFG_47 ${PARAM_VALUE.CFG_47}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_47_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_47
	} else {
		set_property enabled false $CFG_47
	}
}

proc validate_PARAM_VALUE.CFG_47 { PARAM_VALUE.CFG_47 } {
	# Procedure called to validate CFG_47
	return true
}

proc update_PARAM_VALUE.CFG_48 { PARAM_VALUE.CFG_48 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_48 when any of the dependent parameters in the arguments change
	
	set CFG_48 ${PARAM_VALUE.CFG_48}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_48_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_48
	} else {
		set_property enabled false $CFG_48
	}
}

proc validate_PARAM_VALUE.CFG_48 { PARAM_VALUE.CFG_48 } {
	# Procedure called to validate CFG_48
	return true
}

proc update_PARAM_VALUE.CFG_49 { PARAM_VALUE.CFG_49 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_49 when any of the dependent parameters in the arguments change
	
	set CFG_49 ${PARAM_VALUE.CFG_49}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_49_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_49
	} else {
		set_property enabled false $CFG_49
	}
}

proc validate_PARAM_VALUE.CFG_49 { PARAM_VALUE.CFG_49 } {
	# Procedure called to validate CFG_49
	return true
}

proc update_PARAM_VALUE.CFG_50 { PARAM_VALUE.CFG_50 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_50 when any of the dependent parameters in the arguments change
	
	set CFG_50 ${PARAM_VALUE.CFG_50}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_50_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_50
	} else {
		set_property enabled false $CFG_50
	}
}

proc validate_PARAM_VALUE.CFG_50 { PARAM_VALUE.CFG_50 } {
	# Procedure called to validate CFG_50
	return true
}

proc update_PARAM_VALUE.CFG_51 { PARAM_VALUE.CFG_51 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_51 when any of the dependent parameters in the arguments change
	
	set CFG_51 ${PARAM_VALUE.CFG_51}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_51_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_51
	} else {
		set_property enabled false $CFG_51
	}
}

proc validate_PARAM_VALUE.CFG_51 { PARAM_VALUE.CFG_51 } {
	# Procedure called to validate CFG_51
	return true
}

proc update_PARAM_VALUE.CFG_52 { PARAM_VALUE.CFG_52 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_52 when any of the dependent parameters in the arguments change
	
	set CFG_52 ${PARAM_VALUE.CFG_52}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_52_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_52
	} else {
		set_property enabled false $CFG_52
	}
}

proc validate_PARAM_VALUE.CFG_52 { PARAM_VALUE.CFG_52 } {
	# Procedure called to validate CFG_52
	return true
}

proc update_PARAM_VALUE.CFG_53 { PARAM_VALUE.CFG_53 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_53 when any of the dependent parameters in the arguments change
	
	set CFG_53 ${PARAM_VALUE.CFG_53}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_53_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_53
	} else {
		set_property enabled false $CFG_53
	}
}

proc validate_PARAM_VALUE.CFG_53 { PARAM_VALUE.CFG_53 } {
	# Procedure called to validate CFG_53
	return true
}

proc update_PARAM_VALUE.CFG_54 { PARAM_VALUE.CFG_54 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_54 when any of the dependent parameters in the arguments change
	
	set CFG_54 ${PARAM_VALUE.CFG_54}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_54_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_54
	} else {
		set_property enabled false $CFG_54
	}
}

proc validate_PARAM_VALUE.CFG_54 { PARAM_VALUE.CFG_54 } {
	# Procedure called to validate CFG_54
	return true
}

proc update_PARAM_VALUE.CFG_55 { PARAM_VALUE.CFG_55 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_55 when any of the dependent parameters in the arguments change
	
	set CFG_55 ${PARAM_VALUE.CFG_55}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_55_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_55
	} else {
		set_property enabled false $CFG_55
	}
}

proc validate_PARAM_VALUE.CFG_55 { PARAM_VALUE.CFG_55 } {
	# Procedure called to validate CFG_55
	return true
}

proc update_PARAM_VALUE.CFG_56 { PARAM_VALUE.CFG_56 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_56 when any of the dependent parameters in the arguments change
	
	set CFG_56 ${PARAM_VALUE.CFG_56}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_56_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_56
	} else {
		set_property enabled false $CFG_56
	}
}

proc validate_PARAM_VALUE.CFG_56 { PARAM_VALUE.CFG_56 } {
	# Procedure called to validate CFG_56
	return true
}

proc update_PARAM_VALUE.CFG_57 { PARAM_VALUE.CFG_57 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_57 when any of the dependent parameters in the arguments change
	
	set CFG_57 ${PARAM_VALUE.CFG_57}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_57_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_57
	} else {
		set_property enabled false $CFG_57
	}
}

proc validate_PARAM_VALUE.CFG_57 { PARAM_VALUE.CFG_57 } {
	# Procedure called to validate CFG_57
	return true
}

proc update_PARAM_VALUE.CFG_58 { PARAM_VALUE.CFG_58 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_58 when any of the dependent parameters in the arguments change
	
	set CFG_58 ${PARAM_VALUE.CFG_58}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_58_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_58
	} else {
		set_property enabled false $CFG_58
	}
}

proc validate_PARAM_VALUE.CFG_58 { PARAM_VALUE.CFG_58 } {
	# Procedure called to validate CFG_58
	return true
}

proc update_PARAM_VALUE.CFG_59 { PARAM_VALUE.CFG_59 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_59 when any of the dependent parameters in the arguments change
	
	set CFG_59 ${PARAM_VALUE.CFG_59}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_59_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_59
	} else {
		set_property enabled false $CFG_59
	}
}

proc validate_PARAM_VALUE.CFG_59 { PARAM_VALUE.CFG_59 } {
	# Procedure called to validate CFG_59
	return true
}

proc update_PARAM_VALUE.CFG_60 { PARAM_VALUE.CFG_60 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_60 when any of the dependent parameters in the arguments change
	
	set CFG_60 ${PARAM_VALUE.CFG_60}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_60_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_60
	} else {
		set_property enabled false $CFG_60
	}
}

proc validate_PARAM_VALUE.CFG_60 { PARAM_VALUE.CFG_60 } {
	# Procedure called to validate CFG_60
	return true
}

proc update_PARAM_VALUE.CFG_61 { PARAM_VALUE.CFG_61 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_61 when any of the dependent parameters in the arguments change
	
	set CFG_61 ${PARAM_VALUE.CFG_61}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_61_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_61
	} else {
		set_property enabled false $CFG_61
	}
}

proc validate_PARAM_VALUE.CFG_61 { PARAM_VALUE.CFG_61 } {
	# Procedure called to validate CFG_61
	return true
}

proc update_PARAM_VALUE.CFG_62 { PARAM_VALUE.CFG_62 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_62 when any of the dependent parameters in the arguments change
	
	set CFG_62 ${PARAM_VALUE.CFG_62}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_62_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_62
	} else {
		set_property enabled false $CFG_62
	}
}

proc validate_PARAM_VALUE.CFG_62 { PARAM_VALUE.CFG_62 } {
	# Procedure called to validate CFG_62
	return true
}

proc update_PARAM_VALUE.CFG_63 { PARAM_VALUE.CFG_63 PARAM_VALUE.N_PORTS } {
	# Procedure called to update CFG_63 when any of the dependent parameters in the arguments change
	
	set CFG_63 ${PARAM_VALUE.CFG_63}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_CFG_63_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $CFG_63
	} else {
		set_property enabled false $CFG_63
	}
}

proc validate_PARAM_VALUE.CFG_63 { PARAM_VALUE.CFG_63 } {
	# Procedure called to validate CFG_63
	return true
}

proc update_PARAM_VALUE.IN00_LEFT { PARAM_VALUE.IN00_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN00_LEFT when any of the dependent parameters in the arguments change
	
	set IN00_LEFT ${PARAM_VALUE.IN00_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN00_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN00_LEFT
	} else {
		set_property enabled false $IN00_LEFT
	}
}

proc validate_PARAM_VALUE.IN00_LEFT { PARAM_VALUE.IN00_LEFT } {
	# Procedure called to validate IN00_LEFT
	return true
}

proc update_PARAM_VALUE.IN00_RIGHT { PARAM_VALUE.IN00_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN00_RIGHT when any of the dependent parameters in the arguments change
	
	set IN00_RIGHT ${PARAM_VALUE.IN00_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN00_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN00_RIGHT
	} else {
		set_property enabled false $IN00_RIGHT
	}
}

proc validate_PARAM_VALUE.IN00_RIGHT { PARAM_VALUE.IN00_RIGHT } {
	# Procedure called to validate IN00_RIGHT
	return true
}

proc update_PARAM_VALUE.IN01_LEFT { PARAM_VALUE.IN01_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN01_LEFT when any of the dependent parameters in the arguments change
	
	set IN01_LEFT ${PARAM_VALUE.IN01_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN01_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN01_LEFT
	} else {
		set_property enabled false $IN01_LEFT
	}
}

proc validate_PARAM_VALUE.IN01_LEFT { PARAM_VALUE.IN01_LEFT } {
	# Procedure called to validate IN01_LEFT
	return true
}

proc update_PARAM_VALUE.IN01_RIGHT { PARAM_VALUE.IN01_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN01_RIGHT when any of the dependent parameters in the arguments change
	
	set IN01_RIGHT ${PARAM_VALUE.IN01_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN01_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN01_RIGHT
	} else {
		set_property enabled false $IN01_RIGHT
	}
}

proc validate_PARAM_VALUE.IN01_RIGHT { PARAM_VALUE.IN01_RIGHT } {
	# Procedure called to validate IN01_RIGHT
	return true
}

proc update_PARAM_VALUE.IN02_LEFT { PARAM_VALUE.IN02_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN02_LEFT when any of the dependent parameters in the arguments change
	
	set IN02_LEFT ${PARAM_VALUE.IN02_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN02_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN02_LEFT
	} else {
		set_property enabled false $IN02_LEFT
	}
}

proc validate_PARAM_VALUE.IN02_LEFT { PARAM_VALUE.IN02_LEFT } {
	# Procedure called to validate IN02_LEFT
	return true
}

proc update_PARAM_VALUE.IN02_RIGHT { PARAM_VALUE.IN02_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN02_RIGHT when any of the dependent parameters in the arguments change
	
	set IN02_RIGHT ${PARAM_VALUE.IN02_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN02_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN02_RIGHT
	} else {
		set_property enabled false $IN02_RIGHT
	}
}

proc validate_PARAM_VALUE.IN02_RIGHT { PARAM_VALUE.IN02_RIGHT } {
	# Procedure called to validate IN02_RIGHT
	return true
}

proc update_PARAM_VALUE.IN03_LEFT { PARAM_VALUE.IN03_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN03_LEFT when any of the dependent parameters in the arguments change
	
	set IN03_LEFT ${PARAM_VALUE.IN03_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN03_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN03_LEFT
	} else {
		set_property enabled false $IN03_LEFT
	}
}

proc validate_PARAM_VALUE.IN03_LEFT { PARAM_VALUE.IN03_LEFT } {
	# Procedure called to validate IN03_LEFT
	return true
}

proc update_PARAM_VALUE.IN03_RIGHT { PARAM_VALUE.IN03_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN03_RIGHT when any of the dependent parameters in the arguments change
	
	set IN03_RIGHT ${PARAM_VALUE.IN03_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN03_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN03_RIGHT
	} else {
		set_property enabled false $IN03_RIGHT
	}
}

proc validate_PARAM_VALUE.IN03_RIGHT { PARAM_VALUE.IN03_RIGHT } {
	# Procedure called to validate IN03_RIGHT
	return true
}

proc update_PARAM_VALUE.IN04_LEFT { PARAM_VALUE.IN04_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN04_LEFT when any of the dependent parameters in the arguments change
	
	set IN04_LEFT ${PARAM_VALUE.IN04_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN04_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN04_LEFT
	} else {
		set_property enabled false $IN04_LEFT
	}
}

proc validate_PARAM_VALUE.IN04_LEFT { PARAM_VALUE.IN04_LEFT } {
	# Procedure called to validate IN04_LEFT
	return true
}

proc update_PARAM_VALUE.IN04_RIGHT { PARAM_VALUE.IN04_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN04_RIGHT when any of the dependent parameters in the arguments change
	
	set IN04_RIGHT ${PARAM_VALUE.IN04_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN04_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN04_RIGHT
	} else {
		set_property enabled false $IN04_RIGHT
	}
}

proc validate_PARAM_VALUE.IN04_RIGHT { PARAM_VALUE.IN04_RIGHT } {
	# Procedure called to validate IN04_RIGHT
	return true
}

proc update_PARAM_VALUE.IN05_LEFT { PARAM_VALUE.IN05_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN05_LEFT when any of the dependent parameters in the arguments change
	
	set IN05_LEFT ${PARAM_VALUE.IN05_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN05_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN05_LEFT
	} else {
		set_property enabled false $IN05_LEFT
	}
}

proc validate_PARAM_VALUE.IN05_LEFT { PARAM_VALUE.IN05_LEFT } {
	# Procedure called to validate IN05_LEFT
	return true
}

proc update_PARAM_VALUE.IN05_RIGHT { PARAM_VALUE.IN05_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN05_RIGHT when any of the dependent parameters in the arguments change
	
	set IN05_RIGHT ${PARAM_VALUE.IN05_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN05_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN05_RIGHT
	} else {
		set_property enabled false $IN05_RIGHT
	}
}

proc validate_PARAM_VALUE.IN05_RIGHT { PARAM_VALUE.IN05_RIGHT } {
	# Procedure called to validate IN05_RIGHT
	return true
}

proc update_PARAM_VALUE.IN06_LEFT { PARAM_VALUE.IN06_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN06_LEFT when any of the dependent parameters in the arguments change
	
	set IN06_LEFT ${PARAM_VALUE.IN06_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN06_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN06_LEFT
	} else {
		set_property enabled false $IN06_LEFT
	}
}

proc validate_PARAM_VALUE.IN06_LEFT { PARAM_VALUE.IN06_LEFT } {
	# Procedure called to validate IN06_LEFT
	return true
}

proc update_PARAM_VALUE.IN06_RIGHT { PARAM_VALUE.IN06_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN06_RIGHT when any of the dependent parameters in the arguments change
	
	set IN06_RIGHT ${PARAM_VALUE.IN06_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN06_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN06_RIGHT
	} else {
		set_property enabled false $IN06_RIGHT
	}
}

proc validate_PARAM_VALUE.IN06_RIGHT { PARAM_VALUE.IN06_RIGHT } {
	# Procedure called to validate IN06_RIGHT
	return true
}

proc update_PARAM_VALUE.IN07_LEFT { PARAM_VALUE.IN07_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN07_LEFT when any of the dependent parameters in the arguments change
	
	set IN07_LEFT ${PARAM_VALUE.IN07_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN07_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN07_LEFT
	} else {
		set_property enabled false $IN07_LEFT
	}
}

proc validate_PARAM_VALUE.IN07_LEFT { PARAM_VALUE.IN07_LEFT } {
	# Procedure called to validate IN07_LEFT
	return true
}

proc update_PARAM_VALUE.IN07_RIGHT { PARAM_VALUE.IN07_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN07_RIGHT when any of the dependent parameters in the arguments change
	
	set IN07_RIGHT ${PARAM_VALUE.IN07_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN07_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN07_RIGHT
	} else {
		set_property enabled false $IN07_RIGHT
	}
}

proc validate_PARAM_VALUE.IN07_RIGHT { PARAM_VALUE.IN07_RIGHT } {
	# Procedure called to validate IN07_RIGHT
	return true
}

proc update_PARAM_VALUE.IN08_LEFT { PARAM_VALUE.IN08_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN08_LEFT when any of the dependent parameters in the arguments change
	
	set IN08_LEFT ${PARAM_VALUE.IN08_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN08_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN08_LEFT
	} else {
		set_property enabled false $IN08_LEFT
	}
}

proc validate_PARAM_VALUE.IN08_LEFT { PARAM_VALUE.IN08_LEFT } {
	# Procedure called to validate IN08_LEFT
	return true
}

proc update_PARAM_VALUE.IN08_RIGHT { PARAM_VALUE.IN08_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN08_RIGHT when any of the dependent parameters in the arguments change
	
	set IN08_RIGHT ${PARAM_VALUE.IN08_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN08_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN08_RIGHT
	} else {
		set_property enabled false $IN08_RIGHT
	}
}

proc validate_PARAM_VALUE.IN08_RIGHT { PARAM_VALUE.IN08_RIGHT } {
	# Procedure called to validate IN08_RIGHT
	return true
}

proc update_PARAM_VALUE.IN09_LEFT { PARAM_VALUE.IN09_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN09_LEFT when any of the dependent parameters in the arguments change
	
	set IN09_LEFT ${PARAM_VALUE.IN09_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN09_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN09_LEFT
	} else {
		set_property enabled false $IN09_LEFT
	}
}

proc validate_PARAM_VALUE.IN09_LEFT { PARAM_VALUE.IN09_LEFT } {
	# Procedure called to validate IN09_LEFT
	return true
}

proc update_PARAM_VALUE.IN09_RIGHT { PARAM_VALUE.IN09_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN09_RIGHT when any of the dependent parameters in the arguments change
	
	set IN09_RIGHT ${PARAM_VALUE.IN09_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN09_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN09_RIGHT
	} else {
		set_property enabled false $IN09_RIGHT
	}
}

proc validate_PARAM_VALUE.IN09_RIGHT { PARAM_VALUE.IN09_RIGHT } {
	# Procedure called to validate IN09_RIGHT
	return true
}

proc update_PARAM_VALUE.IN10_LEFT { PARAM_VALUE.IN10_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN10_LEFT when any of the dependent parameters in the arguments change
	
	set IN10_LEFT ${PARAM_VALUE.IN10_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN10_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN10_LEFT
	} else {
		set_property enabled false $IN10_LEFT
	}
}

proc validate_PARAM_VALUE.IN10_LEFT { PARAM_VALUE.IN10_LEFT } {
	# Procedure called to validate IN10_LEFT
	return true
}

proc update_PARAM_VALUE.IN10_RIGHT { PARAM_VALUE.IN10_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN10_RIGHT when any of the dependent parameters in the arguments change
	
	set IN10_RIGHT ${PARAM_VALUE.IN10_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN10_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN10_RIGHT
	} else {
		set_property enabled false $IN10_RIGHT
	}
}

proc validate_PARAM_VALUE.IN10_RIGHT { PARAM_VALUE.IN10_RIGHT } {
	# Procedure called to validate IN10_RIGHT
	return true
}

proc update_PARAM_VALUE.IN11_LEFT { PARAM_VALUE.IN11_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN11_LEFT when any of the dependent parameters in the arguments change
	
	set IN11_LEFT ${PARAM_VALUE.IN11_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN11_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN11_LEFT
	} else {
		set_property enabled false $IN11_LEFT
	}
}

proc validate_PARAM_VALUE.IN11_LEFT { PARAM_VALUE.IN11_LEFT } {
	# Procedure called to validate IN11_LEFT
	return true
}

proc update_PARAM_VALUE.IN11_RIGHT { PARAM_VALUE.IN11_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN11_RIGHT when any of the dependent parameters in the arguments change
	
	set IN11_RIGHT ${PARAM_VALUE.IN11_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN11_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN11_RIGHT
	} else {
		set_property enabled false $IN11_RIGHT
	}
}

proc validate_PARAM_VALUE.IN11_RIGHT { PARAM_VALUE.IN11_RIGHT } {
	# Procedure called to validate IN11_RIGHT
	return true
}

proc update_PARAM_VALUE.IN12_LEFT { PARAM_VALUE.IN12_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN12_LEFT when any of the dependent parameters in the arguments change
	
	set IN12_LEFT ${PARAM_VALUE.IN12_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN12_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN12_LEFT
	} else {
		set_property enabled false $IN12_LEFT
	}
}

proc validate_PARAM_VALUE.IN12_LEFT { PARAM_VALUE.IN12_LEFT } {
	# Procedure called to validate IN12_LEFT
	return true
}

proc update_PARAM_VALUE.IN12_RIGHT { PARAM_VALUE.IN12_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN12_RIGHT when any of the dependent parameters in the arguments change
	
	set IN12_RIGHT ${PARAM_VALUE.IN12_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN12_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN12_RIGHT
	} else {
		set_property enabled false $IN12_RIGHT
	}
}

proc validate_PARAM_VALUE.IN12_RIGHT { PARAM_VALUE.IN12_RIGHT } {
	# Procedure called to validate IN12_RIGHT
	return true
}

proc update_PARAM_VALUE.IN13_LEFT { PARAM_VALUE.IN13_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN13_LEFT when any of the dependent parameters in the arguments change
	
	set IN13_LEFT ${PARAM_VALUE.IN13_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN13_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN13_LEFT
	} else {
		set_property enabled false $IN13_LEFT
	}
}

proc validate_PARAM_VALUE.IN13_LEFT { PARAM_VALUE.IN13_LEFT } {
	# Procedure called to validate IN13_LEFT
	return true
}

proc update_PARAM_VALUE.IN13_RIGHT { PARAM_VALUE.IN13_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN13_RIGHT when any of the dependent parameters in the arguments change
	
	set IN13_RIGHT ${PARAM_VALUE.IN13_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN13_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN13_RIGHT
	} else {
		set_property enabled false $IN13_RIGHT
	}
}

proc validate_PARAM_VALUE.IN13_RIGHT { PARAM_VALUE.IN13_RIGHT } {
	# Procedure called to validate IN13_RIGHT
	return true
}

proc update_PARAM_VALUE.IN14_LEFT { PARAM_VALUE.IN14_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN14_LEFT when any of the dependent parameters in the arguments change
	
	set IN14_LEFT ${PARAM_VALUE.IN14_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN14_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN14_LEFT
	} else {
		set_property enabled false $IN14_LEFT
	}
}

proc validate_PARAM_VALUE.IN14_LEFT { PARAM_VALUE.IN14_LEFT } {
	# Procedure called to validate IN14_LEFT
	return true
}

proc update_PARAM_VALUE.IN14_RIGHT { PARAM_VALUE.IN14_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN14_RIGHT when any of the dependent parameters in the arguments change
	
	set IN14_RIGHT ${PARAM_VALUE.IN14_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN14_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN14_RIGHT
	} else {
		set_property enabled false $IN14_RIGHT
	}
}

proc validate_PARAM_VALUE.IN14_RIGHT { PARAM_VALUE.IN14_RIGHT } {
	# Procedure called to validate IN14_RIGHT
	return true
}

proc update_PARAM_VALUE.IN15_LEFT { PARAM_VALUE.IN15_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN15_LEFT when any of the dependent parameters in the arguments change
	
	set IN15_LEFT ${PARAM_VALUE.IN15_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN15_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN15_LEFT
	} else {
		set_property enabled false $IN15_LEFT
	}
}

proc validate_PARAM_VALUE.IN15_LEFT { PARAM_VALUE.IN15_LEFT } {
	# Procedure called to validate IN15_LEFT
	return true
}

proc update_PARAM_VALUE.IN15_RIGHT { PARAM_VALUE.IN15_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN15_RIGHT when any of the dependent parameters in the arguments change
	
	set IN15_RIGHT ${PARAM_VALUE.IN15_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN15_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN15_RIGHT
	} else {
		set_property enabled false $IN15_RIGHT
	}
}

proc validate_PARAM_VALUE.IN15_RIGHT { PARAM_VALUE.IN15_RIGHT } {
	# Procedure called to validate IN15_RIGHT
	return true
}

proc update_PARAM_VALUE.IN16_LEFT { PARAM_VALUE.IN16_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN16_LEFT when any of the dependent parameters in the arguments change
	
	set IN16_LEFT ${PARAM_VALUE.IN16_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN16_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN16_LEFT
	} else {
		set_property enabled false $IN16_LEFT
	}
}

proc validate_PARAM_VALUE.IN16_LEFT { PARAM_VALUE.IN16_LEFT } {
	# Procedure called to validate IN16_LEFT
	return true
}

proc update_PARAM_VALUE.IN16_RIGHT { PARAM_VALUE.IN16_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN16_RIGHT when any of the dependent parameters in the arguments change
	
	set IN16_RIGHT ${PARAM_VALUE.IN16_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN16_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN16_RIGHT
	} else {
		set_property enabled false $IN16_RIGHT
	}
}

proc validate_PARAM_VALUE.IN16_RIGHT { PARAM_VALUE.IN16_RIGHT } {
	# Procedure called to validate IN16_RIGHT
	return true
}

proc update_PARAM_VALUE.IN17_LEFT { PARAM_VALUE.IN17_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN17_LEFT when any of the dependent parameters in the arguments change
	
	set IN17_LEFT ${PARAM_VALUE.IN17_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN17_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN17_LEFT
	} else {
		set_property enabled false $IN17_LEFT
	}
}

proc validate_PARAM_VALUE.IN17_LEFT { PARAM_VALUE.IN17_LEFT } {
	# Procedure called to validate IN17_LEFT
	return true
}

proc update_PARAM_VALUE.IN17_RIGHT { PARAM_VALUE.IN17_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN17_RIGHT when any of the dependent parameters in the arguments change
	
	set IN17_RIGHT ${PARAM_VALUE.IN17_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN17_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN17_RIGHT
	} else {
		set_property enabled false $IN17_RIGHT
	}
}

proc validate_PARAM_VALUE.IN17_RIGHT { PARAM_VALUE.IN17_RIGHT } {
	# Procedure called to validate IN17_RIGHT
	return true
}

proc update_PARAM_VALUE.IN18_LEFT { PARAM_VALUE.IN18_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN18_LEFT when any of the dependent parameters in the arguments change
	
	set IN18_LEFT ${PARAM_VALUE.IN18_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN18_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN18_LEFT
	} else {
		set_property enabled false $IN18_LEFT
	}
}

proc validate_PARAM_VALUE.IN18_LEFT { PARAM_VALUE.IN18_LEFT } {
	# Procedure called to validate IN18_LEFT
	return true
}

proc update_PARAM_VALUE.IN18_RIGHT { PARAM_VALUE.IN18_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN18_RIGHT when any of the dependent parameters in the arguments change
	
	set IN18_RIGHT ${PARAM_VALUE.IN18_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN18_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN18_RIGHT
	} else {
		set_property enabled false $IN18_RIGHT
	}
}

proc validate_PARAM_VALUE.IN18_RIGHT { PARAM_VALUE.IN18_RIGHT } {
	# Procedure called to validate IN18_RIGHT
	return true
}

proc update_PARAM_VALUE.IN19_LEFT { PARAM_VALUE.IN19_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN19_LEFT when any of the dependent parameters in the arguments change
	
	set IN19_LEFT ${PARAM_VALUE.IN19_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN19_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN19_LEFT
	} else {
		set_property enabled false $IN19_LEFT
	}
}

proc validate_PARAM_VALUE.IN19_LEFT { PARAM_VALUE.IN19_LEFT } {
	# Procedure called to validate IN19_LEFT
	return true
}

proc update_PARAM_VALUE.IN19_RIGHT { PARAM_VALUE.IN19_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN19_RIGHT when any of the dependent parameters in the arguments change
	
	set IN19_RIGHT ${PARAM_VALUE.IN19_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN19_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN19_RIGHT
	} else {
		set_property enabled false $IN19_RIGHT
	}
}

proc validate_PARAM_VALUE.IN19_RIGHT { PARAM_VALUE.IN19_RIGHT } {
	# Procedure called to validate IN19_RIGHT
	return true
}

proc update_PARAM_VALUE.IN20_LEFT { PARAM_VALUE.IN20_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN20_LEFT when any of the dependent parameters in the arguments change
	
	set IN20_LEFT ${PARAM_VALUE.IN20_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN20_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN20_LEFT
	} else {
		set_property enabled false $IN20_LEFT
	}
}

proc validate_PARAM_VALUE.IN20_LEFT { PARAM_VALUE.IN20_LEFT } {
	# Procedure called to validate IN20_LEFT
	return true
}

proc update_PARAM_VALUE.IN20_RIGHT { PARAM_VALUE.IN20_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN20_RIGHT when any of the dependent parameters in the arguments change
	
	set IN20_RIGHT ${PARAM_VALUE.IN20_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN20_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN20_RIGHT
	} else {
		set_property enabled false $IN20_RIGHT
	}
}

proc validate_PARAM_VALUE.IN20_RIGHT { PARAM_VALUE.IN20_RIGHT } {
	# Procedure called to validate IN20_RIGHT
	return true
}

proc update_PARAM_VALUE.IN21_LEFT { PARAM_VALUE.IN21_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN21_LEFT when any of the dependent parameters in the arguments change
	
	set IN21_LEFT ${PARAM_VALUE.IN21_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN21_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN21_LEFT
	} else {
		set_property enabled false $IN21_LEFT
	}
}

proc validate_PARAM_VALUE.IN21_LEFT { PARAM_VALUE.IN21_LEFT } {
	# Procedure called to validate IN21_LEFT
	return true
}

proc update_PARAM_VALUE.IN21_RIGHT { PARAM_VALUE.IN21_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN21_RIGHT when any of the dependent parameters in the arguments change
	
	set IN21_RIGHT ${PARAM_VALUE.IN21_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN21_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN21_RIGHT
	} else {
		set_property enabled false $IN21_RIGHT
	}
}

proc validate_PARAM_VALUE.IN21_RIGHT { PARAM_VALUE.IN21_RIGHT } {
	# Procedure called to validate IN21_RIGHT
	return true
}

proc update_PARAM_VALUE.IN22_LEFT { PARAM_VALUE.IN22_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN22_LEFT when any of the dependent parameters in the arguments change
	
	set IN22_LEFT ${PARAM_VALUE.IN22_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN22_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN22_LEFT
	} else {
		set_property enabled false $IN22_LEFT
	}
}

proc validate_PARAM_VALUE.IN22_LEFT { PARAM_VALUE.IN22_LEFT } {
	# Procedure called to validate IN22_LEFT
	return true
}

proc update_PARAM_VALUE.IN22_RIGHT { PARAM_VALUE.IN22_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN22_RIGHT when any of the dependent parameters in the arguments change
	
	set IN22_RIGHT ${PARAM_VALUE.IN22_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN22_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN22_RIGHT
	} else {
		set_property enabled false $IN22_RIGHT
	}
}

proc validate_PARAM_VALUE.IN22_RIGHT { PARAM_VALUE.IN22_RIGHT } {
	# Procedure called to validate IN22_RIGHT
	return true
}

proc update_PARAM_VALUE.IN23_LEFT { PARAM_VALUE.IN23_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN23_LEFT when any of the dependent parameters in the arguments change
	
	set IN23_LEFT ${PARAM_VALUE.IN23_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN23_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN23_LEFT
	} else {
		set_property enabled false $IN23_LEFT
	}
}

proc validate_PARAM_VALUE.IN23_LEFT { PARAM_VALUE.IN23_LEFT } {
	# Procedure called to validate IN23_LEFT
	return true
}

proc update_PARAM_VALUE.IN23_RIGHT { PARAM_VALUE.IN23_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN23_RIGHT when any of the dependent parameters in the arguments change
	
	set IN23_RIGHT ${PARAM_VALUE.IN23_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN23_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN23_RIGHT
	} else {
		set_property enabled false $IN23_RIGHT
	}
}

proc validate_PARAM_VALUE.IN23_RIGHT { PARAM_VALUE.IN23_RIGHT } {
	# Procedure called to validate IN23_RIGHT
	return true
}

proc update_PARAM_VALUE.IN24_LEFT { PARAM_VALUE.IN24_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN24_LEFT when any of the dependent parameters in the arguments change
	
	set IN24_LEFT ${PARAM_VALUE.IN24_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN24_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN24_LEFT
	} else {
		set_property enabled false $IN24_LEFT
	}
}

proc validate_PARAM_VALUE.IN24_LEFT { PARAM_VALUE.IN24_LEFT } {
	# Procedure called to validate IN24_LEFT
	return true
}

proc update_PARAM_VALUE.IN24_RIGHT { PARAM_VALUE.IN24_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN24_RIGHT when any of the dependent parameters in the arguments change
	
	set IN24_RIGHT ${PARAM_VALUE.IN24_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN24_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN24_RIGHT
	} else {
		set_property enabled false $IN24_RIGHT
	}
}

proc validate_PARAM_VALUE.IN24_RIGHT { PARAM_VALUE.IN24_RIGHT } {
	# Procedure called to validate IN24_RIGHT
	return true
}

proc update_PARAM_VALUE.IN25_LEFT { PARAM_VALUE.IN25_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN25_LEFT when any of the dependent parameters in the arguments change
	
	set IN25_LEFT ${PARAM_VALUE.IN25_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN25_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN25_LEFT
	} else {
		set_property enabled false $IN25_LEFT
	}
}

proc validate_PARAM_VALUE.IN25_LEFT { PARAM_VALUE.IN25_LEFT } {
	# Procedure called to validate IN25_LEFT
	return true
}

proc update_PARAM_VALUE.IN25_RIGHT { PARAM_VALUE.IN25_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN25_RIGHT when any of the dependent parameters in the arguments change
	
	set IN25_RIGHT ${PARAM_VALUE.IN25_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN25_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN25_RIGHT
	} else {
		set_property enabled false $IN25_RIGHT
	}
}

proc validate_PARAM_VALUE.IN25_RIGHT { PARAM_VALUE.IN25_RIGHT } {
	# Procedure called to validate IN25_RIGHT
	return true
}

proc update_PARAM_VALUE.IN26_LEFT { PARAM_VALUE.IN26_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN26_LEFT when any of the dependent parameters in the arguments change
	
	set IN26_LEFT ${PARAM_VALUE.IN26_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN26_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN26_LEFT
	} else {
		set_property enabled false $IN26_LEFT
	}
}

proc validate_PARAM_VALUE.IN26_LEFT { PARAM_VALUE.IN26_LEFT } {
	# Procedure called to validate IN26_LEFT
	return true
}

proc update_PARAM_VALUE.IN26_RIGHT { PARAM_VALUE.IN26_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN26_RIGHT when any of the dependent parameters in the arguments change
	
	set IN26_RIGHT ${PARAM_VALUE.IN26_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN26_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN26_RIGHT
	} else {
		set_property enabled false $IN26_RIGHT
	}
}

proc validate_PARAM_VALUE.IN26_RIGHT { PARAM_VALUE.IN26_RIGHT } {
	# Procedure called to validate IN26_RIGHT
	return true
}

proc update_PARAM_VALUE.IN27_LEFT { PARAM_VALUE.IN27_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN27_LEFT when any of the dependent parameters in the arguments change
	
	set IN27_LEFT ${PARAM_VALUE.IN27_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN27_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN27_LEFT
	} else {
		set_property enabled false $IN27_LEFT
	}
}

proc validate_PARAM_VALUE.IN27_LEFT { PARAM_VALUE.IN27_LEFT } {
	# Procedure called to validate IN27_LEFT
	return true
}

proc update_PARAM_VALUE.IN27_RIGHT { PARAM_VALUE.IN27_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN27_RIGHT when any of the dependent parameters in the arguments change
	
	set IN27_RIGHT ${PARAM_VALUE.IN27_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN27_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN27_RIGHT
	} else {
		set_property enabled false $IN27_RIGHT
	}
}

proc validate_PARAM_VALUE.IN27_RIGHT { PARAM_VALUE.IN27_RIGHT } {
	# Procedure called to validate IN27_RIGHT
	return true
}

proc update_PARAM_VALUE.IN28_LEFT { PARAM_VALUE.IN28_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN28_LEFT when any of the dependent parameters in the arguments change
	
	set IN28_LEFT ${PARAM_VALUE.IN28_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN28_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN28_LEFT
	} else {
		set_property enabled false $IN28_LEFT
	}
}

proc validate_PARAM_VALUE.IN28_LEFT { PARAM_VALUE.IN28_LEFT } {
	# Procedure called to validate IN28_LEFT
	return true
}

proc update_PARAM_VALUE.IN28_RIGHT { PARAM_VALUE.IN28_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN28_RIGHT when any of the dependent parameters in the arguments change
	
	set IN28_RIGHT ${PARAM_VALUE.IN28_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN28_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN28_RIGHT
	} else {
		set_property enabled false $IN28_RIGHT
	}
}

proc validate_PARAM_VALUE.IN28_RIGHT { PARAM_VALUE.IN28_RIGHT } {
	# Procedure called to validate IN28_RIGHT
	return true
}

proc update_PARAM_VALUE.IN29_LEFT { PARAM_VALUE.IN29_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN29_LEFT when any of the dependent parameters in the arguments change
	
	set IN29_LEFT ${PARAM_VALUE.IN29_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN29_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN29_LEFT
	} else {
		set_property enabled false $IN29_LEFT
	}
}

proc validate_PARAM_VALUE.IN29_LEFT { PARAM_VALUE.IN29_LEFT } {
	# Procedure called to validate IN29_LEFT
	return true
}

proc update_PARAM_VALUE.IN29_RIGHT { PARAM_VALUE.IN29_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN29_RIGHT when any of the dependent parameters in the arguments change
	
	set IN29_RIGHT ${PARAM_VALUE.IN29_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN29_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN29_RIGHT
	} else {
		set_property enabled false $IN29_RIGHT
	}
}

proc validate_PARAM_VALUE.IN29_RIGHT { PARAM_VALUE.IN29_RIGHT } {
	# Procedure called to validate IN29_RIGHT
	return true
}

proc update_PARAM_VALUE.IN30_LEFT { PARAM_VALUE.IN30_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN30_LEFT when any of the dependent parameters in the arguments change
	
	set IN30_LEFT ${PARAM_VALUE.IN30_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN30_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN30_LEFT
	} else {
		set_property enabled false $IN30_LEFT
	}
}

proc validate_PARAM_VALUE.IN30_LEFT { PARAM_VALUE.IN30_LEFT } {
	# Procedure called to validate IN30_LEFT
	return true
}

proc update_PARAM_VALUE.IN30_RIGHT { PARAM_VALUE.IN30_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN30_RIGHT when any of the dependent parameters in the arguments change
	
	set IN30_RIGHT ${PARAM_VALUE.IN30_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN30_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN30_RIGHT
	} else {
		set_property enabled false $IN30_RIGHT
	}
}

proc validate_PARAM_VALUE.IN30_RIGHT { PARAM_VALUE.IN30_RIGHT } {
	# Procedure called to validate IN30_RIGHT
	return true
}

proc update_PARAM_VALUE.IN31_LEFT { PARAM_VALUE.IN31_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN31_LEFT when any of the dependent parameters in the arguments change
	
	set IN31_LEFT ${PARAM_VALUE.IN31_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN31_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN31_LEFT
	} else {
		set_property enabled false $IN31_LEFT
	}
}

proc validate_PARAM_VALUE.IN31_LEFT { PARAM_VALUE.IN31_LEFT } {
	# Procedure called to validate IN31_LEFT
	return true
}

proc update_PARAM_VALUE.IN31_RIGHT { PARAM_VALUE.IN31_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN31_RIGHT when any of the dependent parameters in the arguments change
	
	set IN31_RIGHT ${PARAM_VALUE.IN31_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN31_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN31_RIGHT
	} else {
		set_property enabled false $IN31_RIGHT
	}
}

proc validate_PARAM_VALUE.IN31_RIGHT { PARAM_VALUE.IN31_RIGHT } {
	# Procedure called to validate IN31_RIGHT
	return true
}

proc update_PARAM_VALUE.IN32_LEFT { PARAM_VALUE.IN32_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN32_LEFT when any of the dependent parameters in the arguments change
	
	set IN32_LEFT ${PARAM_VALUE.IN32_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN32_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN32_LEFT
	} else {
		set_property enabled false $IN32_LEFT
	}
}

proc validate_PARAM_VALUE.IN32_LEFT { PARAM_VALUE.IN32_LEFT } {
	# Procedure called to validate IN32_LEFT
	return true
}

proc update_PARAM_VALUE.IN32_RIGHT { PARAM_VALUE.IN32_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN32_RIGHT when any of the dependent parameters in the arguments change
	
	set IN32_RIGHT ${PARAM_VALUE.IN32_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN32_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN32_RIGHT
	} else {
		set_property enabled false $IN32_RIGHT
	}
}

proc validate_PARAM_VALUE.IN32_RIGHT { PARAM_VALUE.IN32_RIGHT } {
	# Procedure called to validate IN32_RIGHT
	return true
}

proc update_PARAM_VALUE.IN33_LEFT { PARAM_VALUE.IN33_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN33_LEFT when any of the dependent parameters in the arguments change
	
	set IN33_LEFT ${PARAM_VALUE.IN33_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN33_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN33_LEFT
	} else {
		set_property enabled false $IN33_LEFT
	}
}

proc validate_PARAM_VALUE.IN33_LEFT { PARAM_VALUE.IN33_LEFT } {
	# Procedure called to validate IN33_LEFT
	return true
}

proc update_PARAM_VALUE.IN33_RIGHT { PARAM_VALUE.IN33_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN33_RIGHT when any of the dependent parameters in the arguments change
	
	set IN33_RIGHT ${PARAM_VALUE.IN33_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN33_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN33_RIGHT
	} else {
		set_property enabled false $IN33_RIGHT
	}
}

proc validate_PARAM_VALUE.IN33_RIGHT { PARAM_VALUE.IN33_RIGHT } {
	# Procedure called to validate IN33_RIGHT
	return true
}

proc update_PARAM_VALUE.IN34_LEFT { PARAM_VALUE.IN34_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN34_LEFT when any of the dependent parameters in the arguments change
	
	set IN34_LEFT ${PARAM_VALUE.IN34_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN34_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN34_LEFT
	} else {
		set_property enabled false $IN34_LEFT
	}
}

proc validate_PARAM_VALUE.IN34_LEFT { PARAM_VALUE.IN34_LEFT } {
	# Procedure called to validate IN34_LEFT
	return true
}

proc update_PARAM_VALUE.IN34_RIGHT { PARAM_VALUE.IN34_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN34_RIGHT when any of the dependent parameters in the arguments change
	
	set IN34_RIGHT ${PARAM_VALUE.IN34_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN34_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN34_RIGHT
	} else {
		set_property enabled false $IN34_RIGHT
	}
}

proc validate_PARAM_VALUE.IN34_RIGHT { PARAM_VALUE.IN34_RIGHT } {
	# Procedure called to validate IN34_RIGHT
	return true
}

proc update_PARAM_VALUE.IN35_LEFT { PARAM_VALUE.IN35_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN35_LEFT when any of the dependent parameters in the arguments change
	
	set IN35_LEFT ${PARAM_VALUE.IN35_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN35_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN35_LEFT
	} else {
		set_property enabled false $IN35_LEFT
	}
}

proc validate_PARAM_VALUE.IN35_LEFT { PARAM_VALUE.IN35_LEFT } {
	# Procedure called to validate IN35_LEFT
	return true
}

proc update_PARAM_VALUE.IN35_RIGHT { PARAM_VALUE.IN35_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN35_RIGHT when any of the dependent parameters in the arguments change
	
	set IN35_RIGHT ${PARAM_VALUE.IN35_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN35_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN35_RIGHT
	} else {
		set_property enabled false $IN35_RIGHT
	}
}

proc validate_PARAM_VALUE.IN35_RIGHT { PARAM_VALUE.IN35_RIGHT } {
	# Procedure called to validate IN35_RIGHT
	return true
}

proc update_PARAM_VALUE.IN36_LEFT { PARAM_VALUE.IN36_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN36_LEFT when any of the dependent parameters in the arguments change
	
	set IN36_LEFT ${PARAM_VALUE.IN36_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN36_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN36_LEFT
	} else {
		set_property enabled false $IN36_LEFT
	}
}

proc validate_PARAM_VALUE.IN36_LEFT { PARAM_VALUE.IN36_LEFT } {
	# Procedure called to validate IN36_LEFT
	return true
}

proc update_PARAM_VALUE.IN36_RIGHT { PARAM_VALUE.IN36_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN36_RIGHT when any of the dependent parameters in the arguments change
	
	set IN36_RIGHT ${PARAM_VALUE.IN36_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN36_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN36_RIGHT
	} else {
		set_property enabled false $IN36_RIGHT
	}
}

proc validate_PARAM_VALUE.IN36_RIGHT { PARAM_VALUE.IN36_RIGHT } {
	# Procedure called to validate IN36_RIGHT
	return true
}

proc update_PARAM_VALUE.IN37_LEFT { PARAM_VALUE.IN37_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN37_LEFT when any of the dependent parameters in the arguments change
	
	set IN37_LEFT ${PARAM_VALUE.IN37_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN37_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN37_LEFT
	} else {
		set_property enabled false $IN37_LEFT
	}
}

proc validate_PARAM_VALUE.IN37_LEFT { PARAM_VALUE.IN37_LEFT } {
	# Procedure called to validate IN37_LEFT
	return true
}

proc update_PARAM_VALUE.IN37_RIGHT { PARAM_VALUE.IN37_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN37_RIGHT when any of the dependent parameters in the arguments change
	
	set IN37_RIGHT ${PARAM_VALUE.IN37_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN37_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN37_RIGHT
	} else {
		set_property enabled false $IN37_RIGHT
	}
}

proc validate_PARAM_VALUE.IN37_RIGHT { PARAM_VALUE.IN37_RIGHT } {
	# Procedure called to validate IN37_RIGHT
	return true
}

proc update_PARAM_VALUE.IN38_LEFT { PARAM_VALUE.IN38_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN38_LEFT when any of the dependent parameters in the arguments change
	
	set IN38_LEFT ${PARAM_VALUE.IN38_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN38_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN38_LEFT
	} else {
		set_property enabled false $IN38_LEFT
	}
}

proc validate_PARAM_VALUE.IN38_LEFT { PARAM_VALUE.IN38_LEFT } {
	# Procedure called to validate IN38_LEFT
	return true
}

proc update_PARAM_VALUE.IN38_RIGHT { PARAM_VALUE.IN38_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN38_RIGHT when any of the dependent parameters in the arguments change
	
	set IN38_RIGHT ${PARAM_VALUE.IN38_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN38_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN38_RIGHT
	} else {
		set_property enabled false $IN38_RIGHT
	}
}

proc validate_PARAM_VALUE.IN38_RIGHT { PARAM_VALUE.IN38_RIGHT } {
	# Procedure called to validate IN38_RIGHT
	return true
}

proc update_PARAM_VALUE.IN39_LEFT { PARAM_VALUE.IN39_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN39_LEFT when any of the dependent parameters in the arguments change
	
	set IN39_LEFT ${PARAM_VALUE.IN39_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN39_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN39_LEFT
	} else {
		set_property enabled false $IN39_LEFT
	}
}

proc validate_PARAM_VALUE.IN39_LEFT { PARAM_VALUE.IN39_LEFT } {
	# Procedure called to validate IN39_LEFT
	return true
}

proc update_PARAM_VALUE.IN39_RIGHT { PARAM_VALUE.IN39_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN39_RIGHT when any of the dependent parameters in the arguments change
	
	set IN39_RIGHT ${PARAM_VALUE.IN39_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN39_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN39_RIGHT
	} else {
		set_property enabled false $IN39_RIGHT
	}
}

proc validate_PARAM_VALUE.IN39_RIGHT { PARAM_VALUE.IN39_RIGHT } {
	# Procedure called to validate IN39_RIGHT
	return true
}

proc update_PARAM_VALUE.IN40_LEFT { PARAM_VALUE.IN40_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN40_LEFT when any of the dependent parameters in the arguments change
	
	set IN40_LEFT ${PARAM_VALUE.IN40_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN40_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN40_LEFT
	} else {
		set_property enabled false $IN40_LEFT
	}
}

proc validate_PARAM_VALUE.IN40_LEFT { PARAM_VALUE.IN40_LEFT } {
	# Procedure called to validate IN40_LEFT
	return true
}

proc update_PARAM_VALUE.IN40_RIGHT { PARAM_VALUE.IN40_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN40_RIGHT when any of the dependent parameters in the arguments change
	
	set IN40_RIGHT ${PARAM_VALUE.IN40_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN40_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN40_RIGHT
	} else {
		set_property enabled false $IN40_RIGHT
	}
}

proc validate_PARAM_VALUE.IN40_RIGHT { PARAM_VALUE.IN40_RIGHT } {
	# Procedure called to validate IN40_RIGHT
	return true
}

proc update_PARAM_VALUE.IN41_LEFT { PARAM_VALUE.IN41_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN41_LEFT when any of the dependent parameters in the arguments change
	
	set IN41_LEFT ${PARAM_VALUE.IN41_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN41_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN41_LEFT
	} else {
		set_property enabled false $IN41_LEFT
	}
}

proc validate_PARAM_VALUE.IN41_LEFT { PARAM_VALUE.IN41_LEFT } {
	# Procedure called to validate IN41_LEFT
	return true
}

proc update_PARAM_VALUE.IN41_RIGHT { PARAM_VALUE.IN41_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN41_RIGHT when any of the dependent parameters in the arguments change
	
	set IN41_RIGHT ${PARAM_VALUE.IN41_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN41_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN41_RIGHT
	} else {
		set_property enabled false $IN41_RIGHT
	}
}

proc validate_PARAM_VALUE.IN41_RIGHT { PARAM_VALUE.IN41_RIGHT } {
	# Procedure called to validate IN41_RIGHT
	return true
}

proc update_PARAM_VALUE.IN42_LEFT { PARAM_VALUE.IN42_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN42_LEFT when any of the dependent parameters in the arguments change
	
	set IN42_LEFT ${PARAM_VALUE.IN42_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN42_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN42_LEFT
	} else {
		set_property enabled false $IN42_LEFT
	}
}

proc validate_PARAM_VALUE.IN42_LEFT { PARAM_VALUE.IN42_LEFT } {
	# Procedure called to validate IN42_LEFT
	return true
}

proc update_PARAM_VALUE.IN42_RIGHT { PARAM_VALUE.IN42_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN42_RIGHT when any of the dependent parameters in the arguments change
	
	set IN42_RIGHT ${PARAM_VALUE.IN42_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN42_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN42_RIGHT
	} else {
		set_property enabled false $IN42_RIGHT
	}
}

proc validate_PARAM_VALUE.IN42_RIGHT { PARAM_VALUE.IN42_RIGHT } {
	# Procedure called to validate IN42_RIGHT
	return true
}

proc update_PARAM_VALUE.IN43_LEFT { PARAM_VALUE.IN43_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN43_LEFT when any of the dependent parameters in the arguments change
	
	set IN43_LEFT ${PARAM_VALUE.IN43_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN43_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN43_LEFT
	} else {
		set_property enabled false $IN43_LEFT
	}
}

proc validate_PARAM_VALUE.IN43_LEFT { PARAM_VALUE.IN43_LEFT } {
	# Procedure called to validate IN43_LEFT
	return true
}

proc update_PARAM_VALUE.IN43_RIGHT { PARAM_VALUE.IN43_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN43_RIGHT when any of the dependent parameters in the arguments change
	
	set IN43_RIGHT ${PARAM_VALUE.IN43_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN43_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN43_RIGHT
	} else {
		set_property enabled false $IN43_RIGHT
	}
}

proc validate_PARAM_VALUE.IN43_RIGHT { PARAM_VALUE.IN43_RIGHT } {
	# Procedure called to validate IN43_RIGHT
	return true
}

proc update_PARAM_VALUE.IN44_LEFT { PARAM_VALUE.IN44_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN44_LEFT when any of the dependent parameters in the arguments change
	
	set IN44_LEFT ${PARAM_VALUE.IN44_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN44_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN44_LEFT
	} else {
		set_property enabled false $IN44_LEFT
	}
}

proc validate_PARAM_VALUE.IN44_LEFT { PARAM_VALUE.IN44_LEFT } {
	# Procedure called to validate IN44_LEFT
	return true
}

proc update_PARAM_VALUE.IN44_RIGHT { PARAM_VALUE.IN44_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN44_RIGHT when any of the dependent parameters in the arguments change
	
	set IN44_RIGHT ${PARAM_VALUE.IN44_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN44_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN44_RIGHT
	} else {
		set_property enabled false $IN44_RIGHT
	}
}

proc validate_PARAM_VALUE.IN44_RIGHT { PARAM_VALUE.IN44_RIGHT } {
	# Procedure called to validate IN44_RIGHT
	return true
}

proc update_PARAM_VALUE.IN45_LEFT { PARAM_VALUE.IN45_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN45_LEFT when any of the dependent parameters in the arguments change
	
	set IN45_LEFT ${PARAM_VALUE.IN45_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN45_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN45_LEFT
	} else {
		set_property enabled false $IN45_LEFT
	}
}

proc validate_PARAM_VALUE.IN45_LEFT { PARAM_VALUE.IN45_LEFT } {
	# Procedure called to validate IN45_LEFT
	return true
}

proc update_PARAM_VALUE.IN45_RIGHT { PARAM_VALUE.IN45_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN45_RIGHT when any of the dependent parameters in the arguments change
	
	set IN45_RIGHT ${PARAM_VALUE.IN45_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN45_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN45_RIGHT
	} else {
		set_property enabled false $IN45_RIGHT
	}
}

proc validate_PARAM_VALUE.IN45_RIGHT { PARAM_VALUE.IN45_RIGHT } {
	# Procedure called to validate IN45_RIGHT
	return true
}

proc update_PARAM_VALUE.IN46_LEFT { PARAM_VALUE.IN46_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN46_LEFT when any of the dependent parameters in the arguments change
	
	set IN46_LEFT ${PARAM_VALUE.IN46_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN46_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN46_LEFT
	} else {
		set_property enabled false $IN46_LEFT
	}
}

proc validate_PARAM_VALUE.IN46_LEFT { PARAM_VALUE.IN46_LEFT } {
	# Procedure called to validate IN46_LEFT
	return true
}

proc update_PARAM_VALUE.IN46_RIGHT { PARAM_VALUE.IN46_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN46_RIGHT when any of the dependent parameters in the arguments change
	
	set IN46_RIGHT ${PARAM_VALUE.IN46_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN46_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN46_RIGHT
	} else {
		set_property enabled false $IN46_RIGHT
	}
}

proc validate_PARAM_VALUE.IN46_RIGHT { PARAM_VALUE.IN46_RIGHT } {
	# Procedure called to validate IN46_RIGHT
	return true
}

proc update_PARAM_VALUE.IN47_LEFT { PARAM_VALUE.IN47_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN47_LEFT when any of the dependent parameters in the arguments change
	
	set IN47_LEFT ${PARAM_VALUE.IN47_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN47_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN47_LEFT
	} else {
		set_property enabled false $IN47_LEFT
	}
}

proc validate_PARAM_VALUE.IN47_LEFT { PARAM_VALUE.IN47_LEFT } {
	# Procedure called to validate IN47_LEFT
	return true
}

proc update_PARAM_VALUE.IN47_RIGHT { PARAM_VALUE.IN47_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN47_RIGHT when any of the dependent parameters in the arguments change
	
	set IN47_RIGHT ${PARAM_VALUE.IN47_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN47_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN47_RIGHT
	} else {
		set_property enabled false $IN47_RIGHT
	}
}

proc validate_PARAM_VALUE.IN47_RIGHT { PARAM_VALUE.IN47_RIGHT } {
	# Procedure called to validate IN47_RIGHT
	return true
}

proc update_PARAM_VALUE.IN48_LEFT { PARAM_VALUE.IN48_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN48_LEFT when any of the dependent parameters in the arguments change
	
	set IN48_LEFT ${PARAM_VALUE.IN48_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN48_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN48_LEFT
	} else {
		set_property enabled false $IN48_LEFT
	}
}

proc validate_PARAM_VALUE.IN48_LEFT { PARAM_VALUE.IN48_LEFT } {
	# Procedure called to validate IN48_LEFT
	return true
}

proc update_PARAM_VALUE.IN48_RIGHT { PARAM_VALUE.IN48_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN48_RIGHT when any of the dependent parameters in the arguments change
	
	set IN48_RIGHT ${PARAM_VALUE.IN48_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN48_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN48_RIGHT
	} else {
		set_property enabled false $IN48_RIGHT
	}
}

proc validate_PARAM_VALUE.IN48_RIGHT { PARAM_VALUE.IN48_RIGHT } {
	# Procedure called to validate IN48_RIGHT
	return true
}

proc update_PARAM_VALUE.IN49_LEFT { PARAM_VALUE.IN49_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN49_LEFT when any of the dependent parameters in the arguments change
	
	set IN49_LEFT ${PARAM_VALUE.IN49_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN49_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN49_LEFT
	} else {
		set_property enabled false $IN49_LEFT
	}
}

proc validate_PARAM_VALUE.IN49_LEFT { PARAM_VALUE.IN49_LEFT } {
	# Procedure called to validate IN49_LEFT
	return true
}

proc update_PARAM_VALUE.IN49_RIGHT { PARAM_VALUE.IN49_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN49_RIGHT when any of the dependent parameters in the arguments change
	
	set IN49_RIGHT ${PARAM_VALUE.IN49_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN49_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN49_RIGHT
	} else {
		set_property enabled false $IN49_RIGHT
	}
}

proc validate_PARAM_VALUE.IN49_RIGHT { PARAM_VALUE.IN49_RIGHT } {
	# Procedure called to validate IN49_RIGHT
	return true
}

proc update_PARAM_VALUE.IN50_LEFT { PARAM_VALUE.IN50_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN50_LEFT when any of the dependent parameters in the arguments change
	
	set IN50_LEFT ${PARAM_VALUE.IN50_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN50_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN50_LEFT
	} else {
		set_property enabled false $IN50_LEFT
	}
}

proc validate_PARAM_VALUE.IN50_LEFT { PARAM_VALUE.IN50_LEFT } {
	# Procedure called to validate IN50_LEFT
	return true
}

proc update_PARAM_VALUE.IN50_RIGHT { PARAM_VALUE.IN50_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN50_RIGHT when any of the dependent parameters in the arguments change
	
	set IN50_RIGHT ${PARAM_VALUE.IN50_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN50_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN50_RIGHT
	} else {
		set_property enabled false $IN50_RIGHT
	}
}

proc validate_PARAM_VALUE.IN50_RIGHT { PARAM_VALUE.IN50_RIGHT } {
	# Procedure called to validate IN50_RIGHT
	return true
}

proc update_PARAM_VALUE.IN51_LEFT { PARAM_VALUE.IN51_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN51_LEFT when any of the dependent parameters in the arguments change
	
	set IN51_LEFT ${PARAM_VALUE.IN51_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN51_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN51_LEFT
	} else {
		set_property enabled false $IN51_LEFT
	}
}

proc validate_PARAM_VALUE.IN51_LEFT { PARAM_VALUE.IN51_LEFT } {
	# Procedure called to validate IN51_LEFT
	return true
}

proc update_PARAM_VALUE.IN51_RIGHT { PARAM_VALUE.IN51_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN51_RIGHT when any of the dependent parameters in the arguments change
	
	set IN51_RIGHT ${PARAM_VALUE.IN51_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN51_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN51_RIGHT
	} else {
		set_property enabled false $IN51_RIGHT
	}
}

proc validate_PARAM_VALUE.IN51_RIGHT { PARAM_VALUE.IN51_RIGHT } {
	# Procedure called to validate IN51_RIGHT
	return true
}

proc update_PARAM_VALUE.IN52_LEFT { PARAM_VALUE.IN52_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN52_LEFT when any of the dependent parameters in the arguments change
	
	set IN52_LEFT ${PARAM_VALUE.IN52_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN52_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN52_LEFT
	} else {
		set_property enabled false $IN52_LEFT
	}
}

proc validate_PARAM_VALUE.IN52_LEFT { PARAM_VALUE.IN52_LEFT } {
	# Procedure called to validate IN52_LEFT
	return true
}

proc update_PARAM_VALUE.IN52_RIGHT { PARAM_VALUE.IN52_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN52_RIGHT when any of the dependent parameters in the arguments change
	
	set IN52_RIGHT ${PARAM_VALUE.IN52_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN52_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN52_RIGHT
	} else {
		set_property enabled false $IN52_RIGHT
	}
}

proc validate_PARAM_VALUE.IN52_RIGHT { PARAM_VALUE.IN52_RIGHT } {
	# Procedure called to validate IN52_RIGHT
	return true
}

proc update_PARAM_VALUE.IN53_LEFT { PARAM_VALUE.IN53_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN53_LEFT when any of the dependent parameters in the arguments change
	
	set IN53_LEFT ${PARAM_VALUE.IN53_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN53_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN53_LEFT
	} else {
		set_property enabled false $IN53_LEFT
	}
}

proc validate_PARAM_VALUE.IN53_LEFT { PARAM_VALUE.IN53_LEFT } {
	# Procedure called to validate IN53_LEFT
	return true
}

proc update_PARAM_VALUE.IN53_RIGHT { PARAM_VALUE.IN53_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN53_RIGHT when any of the dependent parameters in the arguments change
	
	set IN53_RIGHT ${PARAM_VALUE.IN53_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN53_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN53_RIGHT
	} else {
		set_property enabled false $IN53_RIGHT
	}
}

proc validate_PARAM_VALUE.IN53_RIGHT { PARAM_VALUE.IN53_RIGHT } {
	# Procedure called to validate IN53_RIGHT
	return true
}

proc update_PARAM_VALUE.IN54_LEFT { PARAM_VALUE.IN54_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN54_LEFT when any of the dependent parameters in the arguments change
	
	set IN54_LEFT ${PARAM_VALUE.IN54_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN54_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN54_LEFT
	} else {
		set_property enabled false $IN54_LEFT
	}
}

proc validate_PARAM_VALUE.IN54_LEFT { PARAM_VALUE.IN54_LEFT } {
	# Procedure called to validate IN54_LEFT
	return true
}

proc update_PARAM_VALUE.IN54_RIGHT { PARAM_VALUE.IN54_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN54_RIGHT when any of the dependent parameters in the arguments change
	
	set IN54_RIGHT ${PARAM_VALUE.IN54_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN54_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN54_RIGHT
	} else {
		set_property enabled false $IN54_RIGHT
	}
}

proc validate_PARAM_VALUE.IN54_RIGHT { PARAM_VALUE.IN54_RIGHT } {
	# Procedure called to validate IN54_RIGHT
	return true
}

proc update_PARAM_VALUE.IN55_LEFT { PARAM_VALUE.IN55_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN55_LEFT when any of the dependent parameters in the arguments change
	
	set IN55_LEFT ${PARAM_VALUE.IN55_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN55_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN55_LEFT
	} else {
		set_property enabled false $IN55_LEFT
	}
}

proc validate_PARAM_VALUE.IN55_LEFT { PARAM_VALUE.IN55_LEFT } {
	# Procedure called to validate IN55_LEFT
	return true
}

proc update_PARAM_VALUE.IN55_RIGHT { PARAM_VALUE.IN55_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN55_RIGHT when any of the dependent parameters in the arguments change
	
	set IN55_RIGHT ${PARAM_VALUE.IN55_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN55_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN55_RIGHT
	} else {
		set_property enabled false $IN55_RIGHT
	}
}

proc validate_PARAM_VALUE.IN55_RIGHT { PARAM_VALUE.IN55_RIGHT } {
	# Procedure called to validate IN55_RIGHT
	return true
}

proc update_PARAM_VALUE.IN56_LEFT { PARAM_VALUE.IN56_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN56_LEFT when any of the dependent parameters in the arguments change
	
	set IN56_LEFT ${PARAM_VALUE.IN56_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN56_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN56_LEFT
	} else {
		set_property enabled false $IN56_LEFT
	}
}

proc validate_PARAM_VALUE.IN56_LEFT { PARAM_VALUE.IN56_LEFT } {
	# Procedure called to validate IN56_LEFT
	return true
}

proc update_PARAM_VALUE.IN56_RIGHT { PARAM_VALUE.IN56_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN56_RIGHT when any of the dependent parameters in the arguments change
	
	set IN56_RIGHT ${PARAM_VALUE.IN56_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN56_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN56_RIGHT
	} else {
		set_property enabled false $IN56_RIGHT
	}
}

proc validate_PARAM_VALUE.IN56_RIGHT { PARAM_VALUE.IN56_RIGHT } {
	# Procedure called to validate IN56_RIGHT
	return true
}

proc update_PARAM_VALUE.IN57_LEFT { PARAM_VALUE.IN57_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN57_LEFT when any of the dependent parameters in the arguments change
	
	set IN57_LEFT ${PARAM_VALUE.IN57_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN57_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN57_LEFT
	} else {
		set_property enabled false $IN57_LEFT
	}
}

proc validate_PARAM_VALUE.IN57_LEFT { PARAM_VALUE.IN57_LEFT } {
	# Procedure called to validate IN57_LEFT
	return true
}

proc update_PARAM_VALUE.IN57_RIGHT { PARAM_VALUE.IN57_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN57_RIGHT when any of the dependent parameters in the arguments change
	
	set IN57_RIGHT ${PARAM_VALUE.IN57_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN57_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN57_RIGHT
	} else {
		set_property enabled false $IN57_RIGHT
	}
}

proc validate_PARAM_VALUE.IN57_RIGHT { PARAM_VALUE.IN57_RIGHT } {
	# Procedure called to validate IN57_RIGHT
	return true
}

proc update_PARAM_VALUE.IN58_LEFT { PARAM_VALUE.IN58_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN58_LEFT when any of the dependent parameters in the arguments change
	
	set IN58_LEFT ${PARAM_VALUE.IN58_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN58_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN58_LEFT
	} else {
		set_property enabled false $IN58_LEFT
	}
}

proc validate_PARAM_VALUE.IN58_LEFT { PARAM_VALUE.IN58_LEFT } {
	# Procedure called to validate IN58_LEFT
	return true
}

proc update_PARAM_VALUE.IN58_RIGHT { PARAM_VALUE.IN58_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN58_RIGHT when any of the dependent parameters in the arguments change
	
	set IN58_RIGHT ${PARAM_VALUE.IN58_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN58_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN58_RIGHT
	} else {
		set_property enabled false $IN58_RIGHT
	}
}

proc validate_PARAM_VALUE.IN58_RIGHT { PARAM_VALUE.IN58_RIGHT } {
	# Procedure called to validate IN58_RIGHT
	return true
}

proc update_PARAM_VALUE.IN59_LEFT { PARAM_VALUE.IN59_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN59_LEFT when any of the dependent parameters in the arguments change
	
	set IN59_LEFT ${PARAM_VALUE.IN59_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN59_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN59_LEFT
	} else {
		set_property enabled false $IN59_LEFT
	}
}

proc validate_PARAM_VALUE.IN59_LEFT { PARAM_VALUE.IN59_LEFT } {
	# Procedure called to validate IN59_LEFT
	return true
}

proc update_PARAM_VALUE.IN59_RIGHT { PARAM_VALUE.IN59_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN59_RIGHT when any of the dependent parameters in the arguments change
	
	set IN59_RIGHT ${PARAM_VALUE.IN59_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN59_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN59_RIGHT
	} else {
		set_property enabled false $IN59_RIGHT
	}
}

proc validate_PARAM_VALUE.IN59_RIGHT { PARAM_VALUE.IN59_RIGHT } {
	# Procedure called to validate IN59_RIGHT
	return true
}

proc update_PARAM_VALUE.IN60_LEFT { PARAM_VALUE.IN60_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN60_LEFT when any of the dependent parameters in the arguments change
	
	set IN60_LEFT ${PARAM_VALUE.IN60_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN60_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN60_LEFT
	} else {
		set_property enabled false $IN60_LEFT
	}
}

proc validate_PARAM_VALUE.IN60_LEFT { PARAM_VALUE.IN60_LEFT } {
	# Procedure called to validate IN60_LEFT
	return true
}

proc update_PARAM_VALUE.IN60_RIGHT { PARAM_VALUE.IN60_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN60_RIGHT when any of the dependent parameters in the arguments change
	
	set IN60_RIGHT ${PARAM_VALUE.IN60_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN60_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN60_RIGHT
	} else {
		set_property enabled false $IN60_RIGHT
	}
}

proc validate_PARAM_VALUE.IN60_RIGHT { PARAM_VALUE.IN60_RIGHT } {
	# Procedure called to validate IN60_RIGHT
	return true
}

proc update_PARAM_VALUE.IN61_LEFT { PARAM_VALUE.IN61_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN61_LEFT when any of the dependent parameters in the arguments change
	
	set IN61_LEFT ${PARAM_VALUE.IN61_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN61_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN61_LEFT
	} else {
		set_property enabled false $IN61_LEFT
	}
}

proc validate_PARAM_VALUE.IN61_LEFT { PARAM_VALUE.IN61_LEFT } {
	# Procedure called to validate IN61_LEFT
	return true
}

proc update_PARAM_VALUE.IN61_RIGHT { PARAM_VALUE.IN61_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN61_RIGHT when any of the dependent parameters in the arguments change
	
	set IN61_RIGHT ${PARAM_VALUE.IN61_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN61_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN61_RIGHT
	} else {
		set_property enabled false $IN61_RIGHT
	}
}

proc validate_PARAM_VALUE.IN61_RIGHT { PARAM_VALUE.IN61_RIGHT } {
	# Procedure called to validate IN61_RIGHT
	return true
}

proc update_PARAM_VALUE.IN62_LEFT { PARAM_VALUE.IN62_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN62_LEFT when any of the dependent parameters in the arguments change
	
	set IN62_LEFT ${PARAM_VALUE.IN62_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN62_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN62_LEFT
	} else {
		set_property enabled false $IN62_LEFT
	}
}

proc validate_PARAM_VALUE.IN62_LEFT { PARAM_VALUE.IN62_LEFT } {
	# Procedure called to validate IN62_LEFT
	return true
}

proc update_PARAM_VALUE.IN62_RIGHT { PARAM_VALUE.IN62_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN62_RIGHT when any of the dependent parameters in the arguments change
	
	set IN62_RIGHT ${PARAM_VALUE.IN62_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN62_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN62_RIGHT
	} else {
		set_property enabled false $IN62_RIGHT
	}
}

proc validate_PARAM_VALUE.IN62_RIGHT { PARAM_VALUE.IN62_RIGHT } {
	# Procedure called to validate IN62_RIGHT
	return true
}

proc update_PARAM_VALUE.IN63_LEFT { PARAM_VALUE.IN63_LEFT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN63_LEFT when any of the dependent parameters in the arguments change
	
	set IN63_LEFT ${PARAM_VALUE.IN63_LEFT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN63_LEFT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN63_LEFT
	} else {
		set_property enabled false $IN63_LEFT
	}
}

proc validate_PARAM_VALUE.IN63_LEFT { PARAM_VALUE.IN63_LEFT } {
	# Procedure called to validate IN63_LEFT
	return true
}

proc update_PARAM_VALUE.IN63_RIGHT { PARAM_VALUE.IN63_RIGHT PARAM_VALUE.N_PORTS } {
	# Procedure called to update IN63_RIGHT when any of the dependent parameters in the arguments change
	
	set IN63_RIGHT ${PARAM_VALUE.IN63_RIGHT}
	set N_PORTS ${PARAM_VALUE.N_PORTS}
	set values(N_PORTS) [get_property value $N_PORTS]
	if { [gen_USERPARAMETER_IN63_RIGHT_ENABLEMENT $values(N_PORTS)] } {
		set_property enabled true $IN63_RIGHT
	} else {
		set_property enabled false $IN63_RIGHT
	}
}

proc validate_PARAM_VALUE.IN63_RIGHT { PARAM_VALUE.IN63_RIGHT } {
	# Procedure called to validate IN63_RIGHT
	return true
}

proc update_PARAM_VALUE.GPIO_WIDTH { PARAM_VALUE.GPIO_WIDTH } {
	# Procedure called to update GPIO_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GPIO_WIDTH { PARAM_VALUE.GPIO_WIDTH } {
	# Procedure called to validate GPIO_WIDTH
	return true
}

proc update_PARAM_VALUE.N_PORTS { PARAM_VALUE.N_PORTS } {
	# Procedure called to update N_PORTS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N_PORTS { PARAM_VALUE.N_PORTS } {
	# Procedure called to validate N_PORTS
	return true
}


proc update_MODELPARAM_VALUE.GPIO_WIDTH { MODELPARAM_VALUE.GPIO_WIDTH PARAM_VALUE.GPIO_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GPIO_WIDTH}] ${MODELPARAM_VALUE.GPIO_WIDTH}
}

proc update_MODELPARAM_VALUE.N_PORTS { MODELPARAM_VALUE.N_PORTS PARAM_VALUE.N_PORTS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N_PORTS}] ${MODELPARAM_VALUE.N_PORTS}
}

proc update_MODELPARAM_VALUE.CFG_00 { MODELPARAM_VALUE.CFG_00 PARAM_VALUE.CFG_00 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_00}] ${MODELPARAM_VALUE.CFG_00}
}

proc update_MODELPARAM_VALUE.CFG_01 { MODELPARAM_VALUE.CFG_01 PARAM_VALUE.CFG_01 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_01}] ${MODELPARAM_VALUE.CFG_01}
}

proc update_MODELPARAM_VALUE.CFG_02 { MODELPARAM_VALUE.CFG_02 PARAM_VALUE.CFG_02 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_02}] ${MODELPARAM_VALUE.CFG_02}
}

proc update_MODELPARAM_VALUE.CFG_03 { MODELPARAM_VALUE.CFG_03 PARAM_VALUE.CFG_03 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_03}] ${MODELPARAM_VALUE.CFG_03}
}

proc update_MODELPARAM_VALUE.CFG_04 { MODELPARAM_VALUE.CFG_04 PARAM_VALUE.CFG_04 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_04}] ${MODELPARAM_VALUE.CFG_04}
}

proc update_MODELPARAM_VALUE.CFG_05 { MODELPARAM_VALUE.CFG_05 PARAM_VALUE.CFG_05 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_05}] ${MODELPARAM_VALUE.CFG_05}
}

proc update_MODELPARAM_VALUE.CFG_06 { MODELPARAM_VALUE.CFG_06 PARAM_VALUE.CFG_06 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_06}] ${MODELPARAM_VALUE.CFG_06}
}

proc update_MODELPARAM_VALUE.CFG_07 { MODELPARAM_VALUE.CFG_07 PARAM_VALUE.CFG_07 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_07}] ${MODELPARAM_VALUE.CFG_07}
}

proc update_MODELPARAM_VALUE.CFG_08 { MODELPARAM_VALUE.CFG_08 PARAM_VALUE.CFG_08 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_08}] ${MODELPARAM_VALUE.CFG_08}
}

proc update_MODELPARAM_VALUE.CFG_09 { MODELPARAM_VALUE.CFG_09 PARAM_VALUE.CFG_09 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_09}] ${MODELPARAM_VALUE.CFG_09}
}

proc update_MODELPARAM_VALUE.CFG_10 { MODELPARAM_VALUE.CFG_10 PARAM_VALUE.CFG_10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_10}] ${MODELPARAM_VALUE.CFG_10}
}

proc update_MODELPARAM_VALUE.CFG_11 { MODELPARAM_VALUE.CFG_11 PARAM_VALUE.CFG_11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_11}] ${MODELPARAM_VALUE.CFG_11}
}

proc update_MODELPARAM_VALUE.CFG_12 { MODELPARAM_VALUE.CFG_12 PARAM_VALUE.CFG_12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_12}] ${MODELPARAM_VALUE.CFG_12}
}

proc update_MODELPARAM_VALUE.CFG_13 { MODELPARAM_VALUE.CFG_13 PARAM_VALUE.CFG_13 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_13}] ${MODELPARAM_VALUE.CFG_13}
}

proc update_MODELPARAM_VALUE.CFG_14 { MODELPARAM_VALUE.CFG_14 PARAM_VALUE.CFG_14 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_14}] ${MODELPARAM_VALUE.CFG_14}
}

proc update_MODELPARAM_VALUE.CFG_15 { MODELPARAM_VALUE.CFG_15 PARAM_VALUE.CFG_15 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_15}] ${MODELPARAM_VALUE.CFG_15}
}

proc update_MODELPARAM_VALUE.CFG_16 { MODELPARAM_VALUE.CFG_16 PARAM_VALUE.CFG_16 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_16}] ${MODELPARAM_VALUE.CFG_16}
}

proc update_MODELPARAM_VALUE.CFG_17 { MODELPARAM_VALUE.CFG_17 PARAM_VALUE.CFG_17 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_17}] ${MODELPARAM_VALUE.CFG_17}
}

proc update_MODELPARAM_VALUE.CFG_18 { MODELPARAM_VALUE.CFG_18 PARAM_VALUE.CFG_18 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_18}] ${MODELPARAM_VALUE.CFG_18}
}

proc update_MODELPARAM_VALUE.CFG_19 { MODELPARAM_VALUE.CFG_19 PARAM_VALUE.CFG_19 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_19}] ${MODELPARAM_VALUE.CFG_19}
}

proc update_MODELPARAM_VALUE.CFG_20 { MODELPARAM_VALUE.CFG_20 PARAM_VALUE.CFG_20 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_20}] ${MODELPARAM_VALUE.CFG_20}
}

proc update_MODELPARAM_VALUE.CFG_21 { MODELPARAM_VALUE.CFG_21 PARAM_VALUE.CFG_21 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_21}] ${MODELPARAM_VALUE.CFG_21}
}

proc update_MODELPARAM_VALUE.CFG_22 { MODELPARAM_VALUE.CFG_22 PARAM_VALUE.CFG_22 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_22}] ${MODELPARAM_VALUE.CFG_22}
}

proc update_MODELPARAM_VALUE.CFG_23 { MODELPARAM_VALUE.CFG_23 PARAM_VALUE.CFG_23 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_23}] ${MODELPARAM_VALUE.CFG_23}
}

proc update_MODELPARAM_VALUE.CFG_24 { MODELPARAM_VALUE.CFG_24 PARAM_VALUE.CFG_24 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_24}] ${MODELPARAM_VALUE.CFG_24}
}

proc update_MODELPARAM_VALUE.CFG_25 { MODELPARAM_VALUE.CFG_25 PARAM_VALUE.CFG_25 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_25}] ${MODELPARAM_VALUE.CFG_25}
}

proc update_MODELPARAM_VALUE.CFG_26 { MODELPARAM_VALUE.CFG_26 PARAM_VALUE.CFG_26 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_26}] ${MODELPARAM_VALUE.CFG_26}
}

proc update_MODELPARAM_VALUE.CFG_27 { MODELPARAM_VALUE.CFG_27 PARAM_VALUE.CFG_27 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_27}] ${MODELPARAM_VALUE.CFG_27}
}

proc update_MODELPARAM_VALUE.CFG_28 { MODELPARAM_VALUE.CFG_28 PARAM_VALUE.CFG_28 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_28}] ${MODELPARAM_VALUE.CFG_28}
}

proc update_MODELPARAM_VALUE.CFG_29 { MODELPARAM_VALUE.CFG_29 PARAM_VALUE.CFG_29 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_29}] ${MODELPARAM_VALUE.CFG_29}
}

proc update_MODELPARAM_VALUE.CFG_30 { MODELPARAM_VALUE.CFG_30 PARAM_VALUE.CFG_30 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_30}] ${MODELPARAM_VALUE.CFG_30}
}

proc update_MODELPARAM_VALUE.CFG_31 { MODELPARAM_VALUE.CFG_31 PARAM_VALUE.CFG_31 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_31}] ${MODELPARAM_VALUE.CFG_31}
}

proc update_MODELPARAM_VALUE.CFG_32 { MODELPARAM_VALUE.CFG_32 PARAM_VALUE.CFG_32 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_32}] ${MODELPARAM_VALUE.CFG_32}
}

proc update_MODELPARAM_VALUE.CFG_33 { MODELPARAM_VALUE.CFG_33 PARAM_VALUE.CFG_33 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_33}] ${MODELPARAM_VALUE.CFG_33}
}

proc update_MODELPARAM_VALUE.CFG_34 { MODELPARAM_VALUE.CFG_34 PARAM_VALUE.CFG_34 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_34}] ${MODELPARAM_VALUE.CFG_34}
}

proc update_MODELPARAM_VALUE.CFG_35 { MODELPARAM_VALUE.CFG_35 PARAM_VALUE.CFG_35 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_35}] ${MODELPARAM_VALUE.CFG_35}
}

proc update_MODELPARAM_VALUE.CFG_36 { MODELPARAM_VALUE.CFG_36 PARAM_VALUE.CFG_36 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_36}] ${MODELPARAM_VALUE.CFG_36}
}

proc update_MODELPARAM_VALUE.CFG_37 { MODELPARAM_VALUE.CFG_37 PARAM_VALUE.CFG_37 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_37}] ${MODELPARAM_VALUE.CFG_37}
}

proc update_MODELPARAM_VALUE.CFG_38 { MODELPARAM_VALUE.CFG_38 PARAM_VALUE.CFG_38 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_38}] ${MODELPARAM_VALUE.CFG_38}
}

proc update_MODELPARAM_VALUE.CFG_39 { MODELPARAM_VALUE.CFG_39 PARAM_VALUE.CFG_39 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_39}] ${MODELPARAM_VALUE.CFG_39}
}

proc update_MODELPARAM_VALUE.CFG_40 { MODELPARAM_VALUE.CFG_40 PARAM_VALUE.CFG_40 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_40}] ${MODELPARAM_VALUE.CFG_40}
}

proc update_MODELPARAM_VALUE.CFG_41 { MODELPARAM_VALUE.CFG_41 PARAM_VALUE.CFG_41 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_41}] ${MODELPARAM_VALUE.CFG_41}
}

proc update_MODELPARAM_VALUE.CFG_42 { MODELPARAM_VALUE.CFG_42 PARAM_VALUE.CFG_42 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_42}] ${MODELPARAM_VALUE.CFG_42}
}

proc update_MODELPARAM_VALUE.CFG_43 { MODELPARAM_VALUE.CFG_43 PARAM_VALUE.CFG_43 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_43}] ${MODELPARAM_VALUE.CFG_43}
}

proc update_MODELPARAM_VALUE.CFG_44 { MODELPARAM_VALUE.CFG_44 PARAM_VALUE.CFG_44 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_44}] ${MODELPARAM_VALUE.CFG_44}
}

proc update_MODELPARAM_VALUE.CFG_45 { MODELPARAM_VALUE.CFG_45 PARAM_VALUE.CFG_45 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_45}] ${MODELPARAM_VALUE.CFG_45}
}

proc update_MODELPARAM_VALUE.CFG_46 { MODELPARAM_VALUE.CFG_46 PARAM_VALUE.CFG_46 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_46}] ${MODELPARAM_VALUE.CFG_46}
}

proc update_MODELPARAM_VALUE.CFG_47 { MODELPARAM_VALUE.CFG_47 PARAM_VALUE.CFG_47 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_47}] ${MODELPARAM_VALUE.CFG_47}
}

proc update_MODELPARAM_VALUE.CFG_48 { MODELPARAM_VALUE.CFG_48 PARAM_VALUE.CFG_48 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_48}] ${MODELPARAM_VALUE.CFG_48}
}

proc update_MODELPARAM_VALUE.CFG_49 { MODELPARAM_VALUE.CFG_49 PARAM_VALUE.CFG_49 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_49}] ${MODELPARAM_VALUE.CFG_49}
}

proc update_MODELPARAM_VALUE.CFG_50 { MODELPARAM_VALUE.CFG_50 PARAM_VALUE.CFG_50 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_50}] ${MODELPARAM_VALUE.CFG_50}
}

proc update_MODELPARAM_VALUE.CFG_51 { MODELPARAM_VALUE.CFG_51 PARAM_VALUE.CFG_51 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_51}] ${MODELPARAM_VALUE.CFG_51}
}

proc update_MODELPARAM_VALUE.CFG_52 { MODELPARAM_VALUE.CFG_52 PARAM_VALUE.CFG_52 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_52}] ${MODELPARAM_VALUE.CFG_52}
}

proc update_MODELPARAM_VALUE.CFG_53 { MODELPARAM_VALUE.CFG_53 PARAM_VALUE.CFG_53 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_53}] ${MODELPARAM_VALUE.CFG_53}
}

proc update_MODELPARAM_VALUE.CFG_54 { MODELPARAM_VALUE.CFG_54 PARAM_VALUE.CFG_54 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_54}] ${MODELPARAM_VALUE.CFG_54}
}

proc update_MODELPARAM_VALUE.CFG_55 { MODELPARAM_VALUE.CFG_55 PARAM_VALUE.CFG_55 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_55}] ${MODELPARAM_VALUE.CFG_55}
}

proc update_MODELPARAM_VALUE.CFG_56 { MODELPARAM_VALUE.CFG_56 PARAM_VALUE.CFG_56 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_56}] ${MODELPARAM_VALUE.CFG_56}
}

proc update_MODELPARAM_VALUE.CFG_57 { MODELPARAM_VALUE.CFG_57 PARAM_VALUE.CFG_57 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_57}] ${MODELPARAM_VALUE.CFG_57}
}

proc update_MODELPARAM_VALUE.CFG_58 { MODELPARAM_VALUE.CFG_58 PARAM_VALUE.CFG_58 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_58}] ${MODELPARAM_VALUE.CFG_58}
}

proc update_MODELPARAM_VALUE.CFG_59 { MODELPARAM_VALUE.CFG_59 PARAM_VALUE.CFG_59 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_59}] ${MODELPARAM_VALUE.CFG_59}
}

proc update_MODELPARAM_VALUE.CFG_60 { MODELPARAM_VALUE.CFG_60 PARAM_VALUE.CFG_60 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_60}] ${MODELPARAM_VALUE.CFG_60}
}

proc update_MODELPARAM_VALUE.CFG_61 { MODELPARAM_VALUE.CFG_61 PARAM_VALUE.CFG_61 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_61}] ${MODELPARAM_VALUE.CFG_61}
}

proc update_MODELPARAM_VALUE.CFG_62 { MODELPARAM_VALUE.CFG_62 PARAM_VALUE.CFG_62 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_62}] ${MODELPARAM_VALUE.CFG_62}
}

proc update_MODELPARAM_VALUE.CFG_63 { MODELPARAM_VALUE.CFG_63 PARAM_VALUE.CFG_63 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CFG_63}] ${MODELPARAM_VALUE.CFG_63}
}

proc update_MODELPARAM_VALUE.IN00_LEFT { MODELPARAM_VALUE.IN00_LEFT PARAM_VALUE.IN00_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN00_LEFT}] ${MODELPARAM_VALUE.IN00_LEFT}
}

proc update_MODELPARAM_VALUE.IN01_LEFT { MODELPARAM_VALUE.IN01_LEFT PARAM_VALUE.IN01_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN01_LEFT}] ${MODELPARAM_VALUE.IN01_LEFT}
}

proc update_MODELPARAM_VALUE.IN02_LEFT { MODELPARAM_VALUE.IN02_LEFT PARAM_VALUE.IN02_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN02_LEFT}] ${MODELPARAM_VALUE.IN02_LEFT}
}

proc update_MODELPARAM_VALUE.IN03_LEFT { MODELPARAM_VALUE.IN03_LEFT PARAM_VALUE.IN03_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN03_LEFT}] ${MODELPARAM_VALUE.IN03_LEFT}
}

proc update_MODELPARAM_VALUE.IN04_LEFT { MODELPARAM_VALUE.IN04_LEFT PARAM_VALUE.IN04_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN04_LEFT}] ${MODELPARAM_VALUE.IN04_LEFT}
}

proc update_MODELPARAM_VALUE.IN05_LEFT { MODELPARAM_VALUE.IN05_LEFT PARAM_VALUE.IN05_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN05_LEFT}] ${MODELPARAM_VALUE.IN05_LEFT}
}

proc update_MODELPARAM_VALUE.IN06_LEFT { MODELPARAM_VALUE.IN06_LEFT PARAM_VALUE.IN06_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN06_LEFT}] ${MODELPARAM_VALUE.IN06_LEFT}
}

proc update_MODELPARAM_VALUE.IN07_LEFT { MODELPARAM_VALUE.IN07_LEFT PARAM_VALUE.IN07_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN07_LEFT}] ${MODELPARAM_VALUE.IN07_LEFT}
}

proc update_MODELPARAM_VALUE.IN08_LEFT { MODELPARAM_VALUE.IN08_LEFT PARAM_VALUE.IN08_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN08_LEFT}] ${MODELPARAM_VALUE.IN08_LEFT}
}

proc update_MODELPARAM_VALUE.IN09_LEFT { MODELPARAM_VALUE.IN09_LEFT PARAM_VALUE.IN09_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN09_LEFT}] ${MODELPARAM_VALUE.IN09_LEFT}
}

proc update_MODELPARAM_VALUE.IN10_LEFT { MODELPARAM_VALUE.IN10_LEFT PARAM_VALUE.IN10_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN10_LEFT}] ${MODELPARAM_VALUE.IN10_LEFT}
}

proc update_MODELPARAM_VALUE.IN11_LEFT { MODELPARAM_VALUE.IN11_LEFT PARAM_VALUE.IN11_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN11_LEFT}] ${MODELPARAM_VALUE.IN11_LEFT}
}

proc update_MODELPARAM_VALUE.IN12_LEFT { MODELPARAM_VALUE.IN12_LEFT PARAM_VALUE.IN12_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN12_LEFT}] ${MODELPARAM_VALUE.IN12_LEFT}
}

proc update_MODELPARAM_VALUE.IN13_LEFT { MODELPARAM_VALUE.IN13_LEFT PARAM_VALUE.IN13_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN13_LEFT}] ${MODELPARAM_VALUE.IN13_LEFT}
}

proc update_MODELPARAM_VALUE.IN14_LEFT { MODELPARAM_VALUE.IN14_LEFT PARAM_VALUE.IN14_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN14_LEFT}] ${MODELPARAM_VALUE.IN14_LEFT}
}

proc update_MODELPARAM_VALUE.IN15_LEFT { MODELPARAM_VALUE.IN15_LEFT PARAM_VALUE.IN15_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN15_LEFT}] ${MODELPARAM_VALUE.IN15_LEFT}
}

proc update_MODELPARAM_VALUE.IN16_LEFT { MODELPARAM_VALUE.IN16_LEFT PARAM_VALUE.IN16_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN16_LEFT}] ${MODELPARAM_VALUE.IN16_LEFT}
}

proc update_MODELPARAM_VALUE.IN17_LEFT { MODELPARAM_VALUE.IN17_LEFT PARAM_VALUE.IN17_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN17_LEFT}] ${MODELPARAM_VALUE.IN17_LEFT}
}

proc update_MODELPARAM_VALUE.IN18_LEFT { MODELPARAM_VALUE.IN18_LEFT PARAM_VALUE.IN18_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN18_LEFT}] ${MODELPARAM_VALUE.IN18_LEFT}
}

proc update_MODELPARAM_VALUE.IN19_LEFT { MODELPARAM_VALUE.IN19_LEFT PARAM_VALUE.IN19_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN19_LEFT}] ${MODELPARAM_VALUE.IN19_LEFT}
}

proc update_MODELPARAM_VALUE.IN20_LEFT { MODELPARAM_VALUE.IN20_LEFT PARAM_VALUE.IN20_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN20_LEFT}] ${MODELPARAM_VALUE.IN20_LEFT}
}

proc update_MODELPARAM_VALUE.IN21_LEFT { MODELPARAM_VALUE.IN21_LEFT PARAM_VALUE.IN21_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN21_LEFT}] ${MODELPARAM_VALUE.IN21_LEFT}
}

proc update_MODELPARAM_VALUE.IN22_LEFT { MODELPARAM_VALUE.IN22_LEFT PARAM_VALUE.IN22_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN22_LEFT}] ${MODELPARAM_VALUE.IN22_LEFT}
}

proc update_MODELPARAM_VALUE.IN23_LEFT { MODELPARAM_VALUE.IN23_LEFT PARAM_VALUE.IN23_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN23_LEFT}] ${MODELPARAM_VALUE.IN23_LEFT}
}

proc update_MODELPARAM_VALUE.IN24_LEFT { MODELPARAM_VALUE.IN24_LEFT PARAM_VALUE.IN24_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN24_LEFT}] ${MODELPARAM_VALUE.IN24_LEFT}
}

proc update_MODELPARAM_VALUE.IN25_LEFT { MODELPARAM_VALUE.IN25_LEFT PARAM_VALUE.IN25_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN25_LEFT}] ${MODELPARAM_VALUE.IN25_LEFT}
}

proc update_MODELPARAM_VALUE.IN26_LEFT { MODELPARAM_VALUE.IN26_LEFT PARAM_VALUE.IN26_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN26_LEFT}] ${MODELPARAM_VALUE.IN26_LEFT}
}

proc update_MODELPARAM_VALUE.IN27_LEFT { MODELPARAM_VALUE.IN27_LEFT PARAM_VALUE.IN27_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN27_LEFT}] ${MODELPARAM_VALUE.IN27_LEFT}
}

proc update_MODELPARAM_VALUE.IN28_LEFT { MODELPARAM_VALUE.IN28_LEFT PARAM_VALUE.IN28_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN28_LEFT}] ${MODELPARAM_VALUE.IN28_LEFT}
}

proc update_MODELPARAM_VALUE.IN29_LEFT { MODELPARAM_VALUE.IN29_LEFT PARAM_VALUE.IN29_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN29_LEFT}] ${MODELPARAM_VALUE.IN29_LEFT}
}

proc update_MODELPARAM_VALUE.IN30_LEFT { MODELPARAM_VALUE.IN30_LEFT PARAM_VALUE.IN30_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN30_LEFT}] ${MODELPARAM_VALUE.IN30_LEFT}
}

proc update_MODELPARAM_VALUE.IN31_LEFT { MODELPARAM_VALUE.IN31_LEFT PARAM_VALUE.IN31_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN31_LEFT}] ${MODELPARAM_VALUE.IN31_LEFT}
}

proc update_MODELPARAM_VALUE.IN32_LEFT { MODELPARAM_VALUE.IN32_LEFT PARAM_VALUE.IN32_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN32_LEFT}] ${MODELPARAM_VALUE.IN32_LEFT}
}

proc update_MODELPARAM_VALUE.IN33_LEFT { MODELPARAM_VALUE.IN33_LEFT PARAM_VALUE.IN33_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN33_LEFT}] ${MODELPARAM_VALUE.IN33_LEFT}
}

proc update_MODELPARAM_VALUE.IN34_LEFT { MODELPARAM_VALUE.IN34_LEFT PARAM_VALUE.IN34_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN34_LEFT}] ${MODELPARAM_VALUE.IN34_LEFT}
}

proc update_MODELPARAM_VALUE.IN35_LEFT { MODELPARAM_VALUE.IN35_LEFT PARAM_VALUE.IN35_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN35_LEFT}] ${MODELPARAM_VALUE.IN35_LEFT}
}

proc update_MODELPARAM_VALUE.IN36_LEFT { MODELPARAM_VALUE.IN36_LEFT PARAM_VALUE.IN36_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN36_LEFT}] ${MODELPARAM_VALUE.IN36_LEFT}
}

proc update_MODELPARAM_VALUE.IN37_LEFT { MODELPARAM_VALUE.IN37_LEFT PARAM_VALUE.IN37_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN37_LEFT}] ${MODELPARAM_VALUE.IN37_LEFT}
}

proc update_MODELPARAM_VALUE.IN38_LEFT { MODELPARAM_VALUE.IN38_LEFT PARAM_VALUE.IN38_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN38_LEFT}] ${MODELPARAM_VALUE.IN38_LEFT}
}

proc update_MODELPARAM_VALUE.IN39_LEFT { MODELPARAM_VALUE.IN39_LEFT PARAM_VALUE.IN39_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN39_LEFT}] ${MODELPARAM_VALUE.IN39_LEFT}
}

proc update_MODELPARAM_VALUE.IN40_LEFT { MODELPARAM_VALUE.IN40_LEFT PARAM_VALUE.IN40_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN40_LEFT}] ${MODELPARAM_VALUE.IN40_LEFT}
}

proc update_MODELPARAM_VALUE.IN41_LEFT { MODELPARAM_VALUE.IN41_LEFT PARAM_VALUE.IN41_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN41_LEFT}] ${MODELPARAM_VALUE.IN41_LEFT}
}

proc update_MODELPARAM_VALUE.IN42_LEFT { MODELPARAM_VALUE.IN42_LEFT PARAM_VALUE.IN42_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN42_LEFT}] ${MODELPARAM_VALUE.IN42_LEFT}
}

proc update_MODELPARAM_VALUE.IN43_LEFT { MODELPARAM_VALUE.IN43_LEFT PARAM_VALUE.IN43_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN43_LEFT}] ${MODELPARAM_VALUE.IN43_LEFT}
}

proc update_MODELPARAM_VALUE.IN44_LEFT { MODELPARAM_VALUE.IN44_LEFT PARAM_VALUE.IN44_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN44_LEFT}] ${MODELPARAM_VALUE.IN44_LEFT}
}

proc update_MODELPARAM_VALUE.IN45_LEFT { MODELPARAM_VALUE.IN45_LEFT PARAM_VALUE.IN45_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN45_LEFT}] ${MODELPARAM_VALUE.IN45_LEFT}
}

proc update_MODELPARAM_VALUE.IN46_LEFT { MODELPARAM_VALUE.IN46_LEFT PARAM_VALUE.IN46_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN46_LEFT}] ${MODELPARAM_VALUE.IN46_LEFT}
}

proc update_MODELPARAM_VALUE.IN47_LEFT { MODELPARAM_VALUE.IN47_LEFT PARAM_VALUE.IN47_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN47_LEFT}] ${MODELPARAM_VALUE.IN47_LEFT}
}

proc update_MODELPARAM_VALUE.IN48_LEFT { MODELPARAM_VALUE.IN48_LEFT PARAM_VALUE.IN48_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN48_LEFT}] ${MODELPARAM_VALUE.IN48_LEFT}
}

proc update_MODELPARAM_VALUE.IN49_LEFT { MODELPARAM_VALUE.IN49_LEFT PARAM_VALUE.IN49_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN49_LEFT}] ${MODELPARAM_VALUE.IN49_LEFT}
}

proc update_MODELPARAM_VALUE.IN50_LEFT { MODELPARAM_VALUE.IN50_LEFT PARAM_VALUE.IN50_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN50_LEFT}] ${MODELPARAM_VALUE.IN50_LEFT}
}

proc update_MODELPARAM_VALUE.IN51_LEFT { MODELPARAM_VALUE.IN51_LEFT PARAM_VALUE.IN51_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN51_LEFT}] ${MODELPARAM_VALUE.IN51_LEFT}
}

proc update_MODELPARAM_VALUE.IN52_LEFT { MODELPARAM_VALUE.IN52_LEFT PARAM_VALUE.IN52_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN52_LEFT}] ${MODELPARAM_VALUE.IN52_LEFT}
}

proc update_MODELPARAM_VALUE.IN53_LEFT { MODELPARAM_VALUE.IN53_LEFT PARAM_VALUE.IN53_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN53_LEFT}] ${MODELPARAM_VALUE.IN53_LEFT}
}

proc update_MODELPARAM_VALUE.IN54_LEFT { MODELPARAM_VALUE.IN54_LEFT PARAM_VALUE.IN54_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN54_LEFT}] ${MODELPARAM_VALUE.IN54_LEFT}
}

proc update_MODELPARAM_VALUE.IN55_LEFT { MODELPARAM_VALUE.IN55_LEFT PARAM_VALUE.IN55_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN55_LEFT}] ${MODELPARAM_VALUE.IN55_LEFT}
}

proc update_MODELPARAM_VALUE.IN56_LEFT { MODELPARAM_VALUE.IN56_LEFT PARAM_VALUE.IN56_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN56_LEFT}] ${MODELPARAM_VALUE.IN56_LEFT}
}

proc update_MODELPARAM_VALUE.IN57_LEFT { MODELPARAM_VALUE.IN57_LEFT PARAM_VALUE.IN57_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN57_LEFT}] ${MODELPARAM_VALUE.IN57_LEFT}
}

proc update_MODELPARAM_VALUE.IN58_LEFT { MODELPARAM_VALUE.IN58_LEFT PARAM_VALUE.IN58_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN58_LEFT}] ${MODELPARAM_VALUE.IN58_LEFT}
}

proc update_MODELPARAM_VALUE.IN59_LEFT { MODELPARAM_VALUE.IN59_LEFT PARAM_VALUE.IN59_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN59_LEFT}] ${MODELPARAM_VALUE.IN59_LEFT}
}

proc update_MODELPARAM_VALUE.IN60_LEFT { MODELPARAM_VALUE.IN60_LEFT PARAM_VALUE.IN60_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN60_LEFT}] ${MODELPARAM_VALUE.IN60_LEFT}
}

proc update_MODELPARAM_VALUE.IN61_LEFT { MODELPARAM_VALUE.IN61_LEFT PARAM_VALUE.IN61_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN61_LEFT}] ${MODELPARAM_VALUE.IN61_LEFT}
}

proc update_MODELPARAM_VALUE.IN62_LEFT { MODELPARAM_VALUE.IN62_LEFT PARAM_VALUE.IN62_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN62_LEFT}] ${MODELPARAM_VALUE.IN62_LEFT}
}

proc update_MODELPARAM_VALUE.IN63_LEFT { MODELPARAM_VALUE.IN63_LEFT PARAM_VALUE.IN63_LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN63_LEFT}] ${MODELPARAM_VALUE.IN63_LEFT}
}

proc update_MODELPARAM_VALUE.IN00_RIGHT { MODELPARAM_VALUE.IN00_RIGHT PARAM_VALUE.IN00_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN00_RIGHT}] ${MODELPARAM_VALUE.IN00_RIGHT}
}

proc update_MODELPARAM_VALUE.IN01_RIGHT { MODELPARAM_VALUE.IN01_RIGHT PARAM_VALUE.IN01_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN01_RIGHT}] ${MODELPARAM_VALUE.IN01_RIGHT}
}

proc update_MODELPARAM_VALUE.IN02_RIGHT { MODELPARAM_VALUE.IN02_RIGHT PARAM_VALUE.IN02_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN02_RIGHT}] ${MODELPARAM_VALUE.IN02_RIGHT}
}

proc update_MODELPARAM_VALUE.IN03_RIGHT { MODELPARAM_VALUE.IN03_RIGHT PARAM_VALUE.IN03_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN03_RIGHT}] ${MODELPARAM_VALUE.IN03_RIGHT}
}

proc update_MODELPARAM_VALUE.IN04_RIGHT { MODELPARAM_VALUE.IN04_RIGHT PARAM_VALUE.IN04_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN04_RIGHT}] ${MODELPARAM_VALUE.IN04_RIGHT}
}

proc update_MODELPARAM_VALUE.IN05_RIGHT { MODELPARAM_VALUE.IN05_RIGHT PARAM_VALUE.IN05_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN05_RIGHT}] ${MODELPARAM_VALUE.IN05_RIGHT}
}

proc update_MODELPARAM_VALUE.IN06_RIGHT { MODELPARAM_VALUE.IN06_RIGHT PARAM_VALUE.IN06_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN06_RIGHT}] ${MODELPARAM_VALUE.IN06_RIGHT}
}

proc update_MODELPARAM_VALUE.IN07_RIGHT { MODELPARAM_VALUE.IN07_RIGHT PARAM_VALUE.IN07_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN07_RIGHT}] ${MODELPARAM_VALUE.IN07_RIGHT}
}

proc update_MODELPARAM_VALUE.IN08_RIGHT { MODELPARAM_VALUE.IN08_RIGHT PARAM_VALUE.IN08_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN08_RIGHT}] ${MODELPARAM_VALUE.IN08_RIGHT}
}

proc update_MODELPARAM_VALUE.IN09_RIGHT { MODELPARAM_VALUE.IN09_RIGHT PARAM_VALUE.IN09_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN09_RIGHT}] ${MODELPARAM_VALUE.IN09_RIGHT}
}

proc update_MODELPARAM_VALUE.IN10_RIGHT { MODELPARAM_VALUE.IN10_RIGHT PARAM_VALUE.IN10_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN10_RIGHT}] ${MODELPARAM_VALUE.IN10_RIGHT}
}

proc update_MODELPARAM_VALUE.IN11_RIGHT { MODELPARAM_VALUE.IN11_RIGHT PARAM_VALUE.IN11_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN11_RIGHT}] ${MODELPARAM_VALUE.IN11_RIGHT}
}

proc update_MODELPARAM_VALUE.IN12_RIGHT { MODELPARAM_VALUE.IN12_RIGHT PARAM_VALUE.IN12_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN12_RIGHT}] ${MODELPARAM_VALUE.IN12_RIGHT}
}

proc update_MODELPARAM_VALUE.IN13_RIGHT { MODELPARAM_VALUE.IN13_RIGHT PARAM_VALUE.IN13_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN13_RIGHT}] ${MODELPARAM_VALUE.IN13_RIGHT}
}

proc update_MODELPARAM_VALUE.IN14_RIGHT { MODELPARAM_VALUE.IN14_RIGHT PARAM_VALUE.IN14_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN14_RIGHT}] ${MODELPARAM_VALUE.IN14_RIGHT}
}

proc update_MODELPARAM_VALUE.IN15_RIGHT { MODELPARAM_VALUE.IN15_RIGHT PARAM_VALUE.IN15_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN15_RIGHT}] ${MODELPARAM_VALUE.IN15_RIGHT}
}

proc update_MODELPARAM_VALUE.IN16_RIGHT { MODELPARAM_VALUE.IN16_RIGHT PARAM_VALUE.IN16_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN16_RIGHT}] ${MODELPARAM_VALUE.IN16_RIGHT}
}

proc update_MODELPARAM_VALUE.IN17_RIGHT { MODELPARAM_VALUE.IN17_RIGHT PARAM_VALUE.IN17_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN17_RIGHT}] ${MODELPARAM_VALUE.IN17_RIGHT}
}

proc update_MODELPARAM_VALUE.IN18_RIGHT { MODELPARAM_VALUE.IN18_RIGHT PARAM_VALUE.IN18_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN18_RIGHT}] ${MODELPARAM_VALUE.IN18_RIGHT}
}

proc update_MODELPARAM_VALUE.IN19_RIGHT { MODELPARAM_VALUE.IN19_RIGHT PARAM_VALUE.IN19_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN19_RIGHT}] ${MODELPARAM_VALUE.IN19_RIGHT}
}

proc update_MODELPARAM_VALUE.IN20_RIGHT { MODELPARAM_VALUE.IN20_RIGHT PARAM_VALUE.IN20_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN20_RIGHT}] ${MODELPARAM_VALUE.IN20_RIGHT}
}

proc update_MODELPARAM_VALUE.IN21_RIGHT { MODELPARAM_VALUE.IN21_RIGHT PARAM_VALUE.IN21_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN21_RIGHT}] ${MODELPARAM_VALUE.IN21_RIGHT}
}

proc update_MODELPARAM_VALUE.IN22_RIGHT { MODELPARAM_VALUE.IN22_RIGHT PARAM_VALUE.IN22_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN22_RIGHT}] ${MODELPARAM_VALUE.IN22_RIGHT}
}

proc update_MODELPARAM_VALUE.IN23_RIGHT { MODELPARAM_VALUE.IN23_RIGHT PARAM_VALUE.IN23_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN23_RIGHT}] ${MODELPARAM_VALUE.IN23_RIGHT}
}

proc update_MODELPARAM_VALUE.IN24_RIGHT { MODELPARAM_VALUE.IN24_RIGHT PARAM_VALUE.IN24_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN24_RIGHT}] ${MODELPARAM_VALUE.IN24_RIGHT}
}

proc update_MODELPARAM_VALUE.IN25_RIGHT { MODELPARAM_VALUE.IN25_RIGHT PARAM_VALUE.IN25_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN25_RIGHT}] ${MODELPARAM_VALUE.IN25_RIGHT}
}

proc update_MODELPARAM_VALUE.IN26_RIGHT { MODELPARAM_VALUE.IN26_RIGHT PARAM_VALUE.IN26_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN26_RIGHT}] ${MODELPARAM_VALUE.IN26_RIGHT}
}

proc update_MODELPARAM_VALUE.IN27_RIGHT { MODELPARAM_VALUE.IN27_RIGHT PARAM_VALUE.IN27_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN27_RIGHT}] ${MODELPARAM_VALUE.IN27_RIGHT}
}

proc update_MODELPARAM_VALUE.IN28_RIGHT { MODELPARAM_VALUE.IN28_RIGHT PARAM_VALUE.IN28_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN28_RIGHT}] ${MODELPARAM_VALUE.IN28_RIGHT}
}

proc update_MODELPARAM_VALUE.IN29_RIGHT { MODELPARAM_VALUE.IN29_RIGHT PARAM_VALUE.IN29_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN29_RIGHT}] ${MODELPARAM_VALUE.IN29_RIGHT}
}

proc update_MODELPARAM_VALUE.IN30_RIGHT { MODELPARAM_VALUE.IN30_RIGHT PARAM_VALUE.IN30_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN30_RIGHT}] ${MODELPARAM_VALUE.IN30_RIGHT}
}

proc update_MODELPARAM_VALUE.IN31_RIGHT { MODELPARAM_VALUE.IN31_RIGHT PARAM_VALUE.IN31_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN31_RIGHT}] ${MODELPARAM_VALUE.IN31_RIGHT}
}

proc update_MODELPARAM_VALUE.IN32_RIGHT { MODELPARAM_VALUE.IN32_RIGHT PARAM_VALUE.IN32_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN32_RIGHT}] ${MODELPARAM_VALUE.IN32_RIGHT}
}

proc update_MODELPARAM_VALUE.IN33_RIGHT { MODELPARAM_VALUE.IN33_RIGHT PARAM_VALUE.IN33_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN33_RIGHT}] ${MODELPARAM_VALUE.IN33_RIGHT}
}

proc update_MODELPARAM_VALUE.IN34_RIGHT { MODELPARAM_VALUE.IN34_RIGHT PARAM_VALUE.IN34_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN34_RIGHT}] ${MODELPARAM_VALUE.IN34_RIGHT}
}

proc update_MODELPARAM_VALUE.IN35_RIGHT { MODELPARAM_VALUE.IN35_RIGHT PARAM_VALUE.IN35_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN35_RIGHT}] ${MODELPARAM_VALUE.IN35_RIGHT}
}

proc update_MODELPARAM_VALUE.IN36_RIGHT { MODELPARAM_VALUE.IN36_RIGHT PARAM_VALUE.IN36_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN36_RIGHT}] ${MODELPARAM_VALUE.IN36_RIGHT}
}

proc update_MODELPARAM_VALUE.IN37_RIGHT { MODELPARAM_VALUE.IN37_RIGHT PARAM_VALUE.IN37_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN37_RIGHT}] ${MODELPARAM_VALUE.IN37_RIGHT}
}

proc update_MODELPARAM_VALUE.IN38_RIGHT { MODELPARAM_VALUE.IN38_RIGHT PARAM_VALUE.IN38_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN38_RIGHT}] ${MODELPARAM_VALUE.IN38_RIGHT}
}

proc update_MODELPARAM_VALUE.IN39_RIGHT { MODELPARAM_VALUE.IN39_RIGHT PARAM_VALUE.IN39_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN39_RIGHT}] ${MODELPARAM_VALUE.IN39_RIGHT}
}

proc update_MODELPARAM_VALUE.IN40_RIGHT { MODELPARAM_VALUE.IN40_RIGHT PARAM_VALUE.IN40_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN40_RIGHT}] ${MODELPARAM_VALUE.IN40_RIGHT}
}

proc update_MODELPARAM_VALUE.IN41_RIGHT { MODELPARAM_VALUE.IN41_RIGHT PARAM_VALUE.IN41_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN41_RIGHT}] ${MODELPARAM_VALUE.IN41_RIGHT}
}

proc update_MODELPARAM_VALUE.IN42_RIGHT { MODELPARAM_VALUE.IN42_RIGHT PARAM_VALUE.IN42_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN42_RIGHT}] ${MODELPARAM_VALUE.IN42_RIGHT}
}

proc update_MODELPARAM_VALUE.IN43_RIGHT { MODELPARAM_VALUE.IN43_RIGHT PARAM_VALUE.IN43_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN43_RIGHT}] ${MODELPARAM_VALUE.IN43_RIGHT}
}

proc update_MODELPARAM_VALUE.IN44_RIGHT { MODELPARAM_VALUE.IN44_RIGHT PARAM_VALUE.IN44_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN44_RIGHT}] ${MODELPARAM_VALUE.IN44_RIGHT}
}

proc update_MODELPARAM_VALUE.IN45_RIGHT { MODELPARAM_VALUE.IN45_RIGHT PARAM_VALUE.IN45_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN45_RIGHT}] ${MODELPARAM_VALUE.IN45_RIGHT}
}

proc update_MODELPARAM_VALUE.IN46_RIGHT { MODELPARAM_VALUE.IN46_RIGHT PARAM_VALUE.IN46_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN46_RIGHT}] ${MODELPARAM_VALUE.IN46_RIGHT}
}

proc update_MODELPARAM_VALUE.IN47_RIGHT { MODELPARAM_VALUE.IN47_RIGHT PARAM_VALUE.IN47_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN47_RIGHT}] ${MODELPARAM_VALUE.IN47_RIGHT}
}

proc update_MODELPARAM_VALUE.IN48_RIGHT { MODELPARAM_VALUE.IN48_RIGHT PARAM_VALUE.IN48_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN48_RIGHT}] ${MODELPARAM_VALUE.IN48_RIGHT}
}

proc update_MODELPARAM_VALUE.IN49_RIGHT { MODELPARAM_VALUE.IN49_RIGHT PARAM_VALUE.IN49_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN49_RIGHT}] ${MODELPARAM_VALUE.IN49_RIGHT}
}

proc update_MODELPARAM_VALUE.IN50_RIGHT { MODELPARAM_VALUE.IN50_RIGHT PARAM_VALUE.IN50_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN50_RIGHT}] ${MODELPARAM_VALUE.IN50_RIGHT}
}

proc update_MODELPARAM_VALUE.IN51_RIGHT { MODELPARAM_VALUE.IN51_RIGHT PARAM_VALUE.IN51_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN51_RIGHT}] ${MODELPARAM_VALUE.IN51_RIGHT}
}

proc update_MODELPARAM_VALUE.IN52_RIGHT { MODELPARAM_VALUE.IN52_RIGHT PARAM_VALUE.IN52_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN52_RIGHT}] ${MODELPARAM_VALUE.IN52_RIGHT}
}

proc update_MODELPARAM_VALUE.IN53_RIGHT { MODELPARAM_VALUE.IN53_RIGHT PARAM_VALUE.IN53_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN53_RIGHT}] ${MODELPARAM_VALUE.IN53_RIGHT}
}

proc update_MODELPARAM_VALUE.IN54_RIGHT { MODELPARAM_VALUE.IN54_RIGHT PARAM_VALUE.IN54_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN54_RIGHT}] ${MODELPARAM_VALUE.IN54_RIGHT}
}

proc update_MODELPARAM_VALUE.IN55_RIGHT { MODELPARAM_VALUE.IN55_RIGHT PARAM_VALUE.IN55_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN55_RIGHT}] ${MODELPARAM_VALUE.IN55_RIGHT}
}

proc update_MODELPARAM_VALUE.IN56_RIGHT { MODELPARAM_VALUE.IN56_RIGHT PARAM_VALUE.IN56_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN56_RIGHT}] ${MODELPARAM_VALUE.IN56_RIGHT}
}

proc update_MODELPARAM_VALUE.IN57_RIGHT { MODELPARAM_VALUE.IN57_RIGHT PARAM_VALUE.IN57_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN57_RIGHT}] ${MODELPARAM_VALUE.IN57_RIGHT}
}

proc update_MODELPARAM_VALUE.IN58_RIGHT { MODELPARAM_VALUE.IN58_RIGHT PARAM_VALUE.IN58_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN58_RIGHT}] ${MODELPARAM_VALUE.IN58_RIGHT}
}

proc update_MODELPARAM_VALUE.IN59_RIGHT { MODELPARAM_VALUE.IN59_RIGHT PARAM_VALUE.IN59_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN59_RIGHT}] ${MODELPARAM_VALUE.IN59_RIGHT}
}

proc update_MODELPARAM_VALUE.IN60_RIGHT { MODELPARAM_VALUE.IN60_RIGHT PARAM_VALUE.IN60_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN60_RIGHT}] ${MODELPARAM_VALUE.IN60_RIGHT}
}

proc update_MODELPARAM_VALUE.IN61_RIGHT { MODELPARAM_VALUE.IN61_RIGHT PARAM_VALUE.IN61_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN61_RIGHT}] ${MODELPARAM_VALUE.IN61_RIGHT}
}

proc update_MODELPARAM_VALUE.IN62_RIGHT { MODELPARAM_VALUE.IN62_RIGHT PARAM_VALUE.IN62_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN62_RIGHT}] ${MODELPARAM_VALUE.IN62_RIGHT}
}

proc update_MODELPARAM_VALUE.IN63_RIGHT { MODELPARAM_VALUE.IN63_RIGHT PARAM_VALUE.IN63_RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN63_RIGHT}] ${MODELPARAM_VALUE.IN63_RIGHT}
}

