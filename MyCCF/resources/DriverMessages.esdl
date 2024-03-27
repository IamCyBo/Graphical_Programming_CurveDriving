package resources;

import units.si.m;
import units.si.s;
import units.common.kmph;

data interface DriverMessages {
	@a2l_unit_label("m")
	m dist2End = 0.0 [m];
	@a2l_unit_label("m")
	m dist2Route = 0.0 [m];
}