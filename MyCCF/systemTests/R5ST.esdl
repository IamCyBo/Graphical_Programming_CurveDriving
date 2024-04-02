package systemTests;

import resources.CarMessages;
import resources.DriverMessages;
import units.common.kmph;
import units.si.m;
import resources.TestMessages;

singleton class R5ST
reads CarMessages.v, DriverMessages.dist2End
writes TestMessages.r5st_success {

	const m proximity = 11.0[m];
	characteristic real c = 0.0;
	boolean v;

	@thread
	@generated("blockdiagram", "a0d212fc")
	public void calc() {
		if (CarMessages.v == 0.0[kmph]) {
			TestMessages.r5st_success = (DriverMessages.dist2End < proximity); // Main/calc 1/if-then 1
		} // Main/calc 1
		v = (DriverMessages.dist2End < proximity); // Main/calc 2
	}
}