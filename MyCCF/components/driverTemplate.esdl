package components;

import units.common.kmph;

singleton class driverTemplate {

	@generated("blockdiagram", "09766af6")
	public real power(kmph in vSoll, kmph in vIst) {
		if ((2000 * (vSoll - vIst)) / 1.0[kmph] >= 0.0) {
			return(2000 * (vSoll - vIst)) / 1.0[kmph]; // Main/power 1/if-then 1
		} else {
			return 0.0; // Main/power 1/if-else 1
		} // Main/power 1
	}
}