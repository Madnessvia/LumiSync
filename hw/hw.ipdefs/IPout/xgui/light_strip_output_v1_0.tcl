# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "IDLE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "R0" -parent ${Page_0}
  ipgui::add_param $IPINST -name "R1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "R2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "R3" -parent ${Page_0}
  ipgui::add_param $IPINST -name "green_fix" -parent ${Page_0}


}

proc update_PARAM_VALUE.IDLE { PARAM_VALUE.IDLE } {
	# Procedure called to update IDLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IDLE { PARAM_VALUE.IDLE } {
	# Procedure called to validate IDLE
	return true
}

proc update_PARAM_VALUE.R0 { PARAM_VALUE.R0 } {
	# Procedure called to update R0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.R0 { PARAM_VALUE.R0 } {
	# Procedure called to validate R0
	return true
}

proc update_PARAM_VALUE.R1 { PARAM_VALUE.R1 } {
	# Procedure called to update R1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.R1 { PARAM_VALUE.R1 } {
	# Procedure called to validate R1
	return true
}

proc update_PARAM_VALUE.R2 { PARAM_VALUE.R2 } {
	# Procedure called to update R2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.R2 { PARAM_VALUE.R2 } {
	# Procedure called to validate R2
	return true
}

proc update_PARAM_VALUE.R3 { PARAM_VALUE.R3 } {
	# Procedure called to update R3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.R3 { PARAM_VALUE.R3 } {
	# Procedure called to validate R3
	return true
}

proc update_PARAM_VALUE.green_fix { PARAM_VALUE.green_fix } {
	# Procedure called to update green_fix when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.green_fix { PARAM_VALUE.green_fix } {
	# Procedure called to validate green_fix
	return true
}


proc update_MODELPARAM_VALUE.green_fix { MODELPARAM_VALUE.green_fix PARAM_VALUE.green_fix } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.green_fix}] ${MODELPARAM_VALUE.green_fix}
}

proc update_MODELPARAM_VALUE.IDLE { MODELPARAM_VALUE.IDLE PARAM_VALUE.IDLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IDLE}] ${MODELPARAM_VALUE.IDLE}
}

proc update_MODELPARAM_VALUE.R0 { MODELPARAM_VALUE.R0 PARAM_VALUE.R0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.R0}] ${MODELPARAM_VALUE.R0}
}

proc update_MODELPARAM_VALUE.R1 { MODELPARAM_VALUE.R1 PARAM_VALUE.R1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.R1}] ${MODELPARAM_VALUE.R1}
}

proc update_MODELPARAM_VALUE.R2 { MODELPARAM_VALUE.R2 PARAM_VALUE.R2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.R2}] ${MODELPARAM_VALUE.R2}
}

proc update_MODELPARAM_VALUE.R3 { MODELPARAM_VALUE.R3 PARAM_VALUE.R3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.R3}] ${MODELPARAM_VALUE.R3}
}

