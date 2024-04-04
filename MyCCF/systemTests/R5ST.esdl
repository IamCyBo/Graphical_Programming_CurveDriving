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

	@thread
	@generated("blockdiagram", "0b712501")
	public void calc() {
		if (CarMessages.v == 0.0[kmph]) {
			TestMessages.r5st_success = (DriverMessages.dist2End < proximity); // Main/calc 1/if-then 1
		} // Main/calc 1
	}
}