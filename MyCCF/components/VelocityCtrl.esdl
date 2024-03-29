package components;

import units.common.kmph;
import SystemLib.Nonlinears.Limiter;

class VelocityCtrl {

	@get
	real power;
	@get
	real brake;
	Limiter Limiter;

	@generated("blockdiagram", "c2a83de7")
	public void calc(kmph in target_velocity, kmph in current_velocity) {
		if ((1000 * (target_velocity - current_velocity)) / 1.0[kmph] == 0) {
			brake = 0.0; // Main/calc 1/if-then 1
			power = 0.0; // Main/calc 1/if-then 2
		} // Main/calc 1
		if ((1000 * (target_velocity - current_velocity)) / 1.0[kmph] > 0) {
			brake = 0.0; // Main/calc 2/if-then 1
			power = Limiter.value(0.0, (1000 * (target_velocity - current_velocity)) / 1.0[kmph], 100.0); // Main/calc 2/if-then 2
		} // Main/calc 2
		if ((1000 * (target_velocity - current_velocity)) / 1.0[kmph] < 0) {
			power = 0.0; // Main/calc 3/if-then 1
			brake = Limiter.value(0.0, abs((1000 * (target_velocity - current_velocity)) / 1.0[kmph]), 100.0); // Main/calc 3/if-then 2
		} // Main/calc 3
	}
}