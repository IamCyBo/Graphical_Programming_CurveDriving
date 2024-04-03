package resources;

import units.si.m;
import units.si.s;
import units.common.kmph;
import units.common.mps2;

data interface CarMessages {
	@a2l_unit_label("km/h")
	kmph v = 0.0 [kmph];
	@a2l_unit_label("m/s^2")
	mps2 acc = 0.0 [mps2];
	real power = 0.0;
	real brake = 0.0;
	real steering = 0.0;
	real mybearing = 0.77;
	@a2l_unit_label("m")
	m x = 0.0 [m];
	@a2l_unit_label("m")
	m y = 0.0 [m];
	s time = 0.0 [s];
}
