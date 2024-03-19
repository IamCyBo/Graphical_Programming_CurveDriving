package resources;

import units.si.m;
import units.si.s;
import units.common.kmph;

data interface CarMessages {
	@a2l_unit_label("km/h")
	kmph v = 0.0 [kmph];
	real power = 0.0;
	real brake = 0.0;
	real steering = 0.0;
	real mybearing = 0.0;
	@a2l_unit_label("m")
	m x = 0.0 [m];
	@a2l_unit_label("m")
	m y = 0.0 [m];
	s time = 0.0 [s];
}
