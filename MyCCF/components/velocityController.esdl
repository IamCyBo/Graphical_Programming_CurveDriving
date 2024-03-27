package components;

import units.common.kmph;
import SystemLib.Miscellaneous.DifferenceQuotient;
import SystemLib.Nonlinears.Limiter;

class velocityController {

	@get
	real power;
	@get
	real brake;
	kmph integrator = 0.0[kmph];
	real multiply;
	DifferenceQuotient DifferenceQuotient_instance;
	kmph testintegrator = 0.0[kmph];
	Limiter Limiter_instance;
	Limiter Limiter_instance_2;

	@generated("blockdiagram", "97893340")
	public void calc(kmph in vSoll, kmph in vIst) {
		if ((1000 * (vSoll - vIst)) / 1.0[kmph] == 0) {
			brake = 0.0; // Main/calc 1/if-then 1
			power = 0.0; // Main/calc 1/if-then 2
		} // Main/calc 1
		if ((1000 * (vSoll - vIst)) / 1.0[kmph] > 0) {
			brake = 0.0; // Main/calc 2/if-then 1
			power = Limiter_instance_2.value(0.0, (1000 * (vSoll - vIst)) / 1.0[kmph], 100.0); // Main/calc 2/if-then 2
		} // Main/calc 2
		if ((1000 * (vSoll - vIst)) / 1.0[kmph] < 0) {
			power = 0.0; // Main/calc 3/if-then 1
			brake = Limiter_instance_2.value(0.0, abs((1000 * (vSoll - vIst)) / 1.0[kmph]), 100.0); // Main/calc 3/if-then 2
		} // Main/calc 3
	}
}