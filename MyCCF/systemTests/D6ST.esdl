package systemTests;

import SystemLib.CounterTimer.Timer;
import SystemLib.Miscellaneous.EdgeFalling;
import SystemLib.Miscellaneous.EdgeRising;
import resources.DriverMessages;
import units.si.m;
import resources.TestMessages;

singleton class D6ST
reads DriverMessages.dist2Route
writes TestMessages.d6st_complete, TestMessages.d6st_success {

	EdgeRising EdgeRising;
	EdgeFalling EdgeFalling;
	Timer Timer;
	boolean result = true;
	characteristic boolean ^start = false;

	@thread
	@generated("blockdiagram", "60c92ef9")
	public void calc() {
		EdgeFalling.compute(^start); // Main/calc 1
		if (EdgeFalling.value()) {
			TestMessages.d6st_complete = false; // Main/calc 2/if-then 1
			TestMessages.d6st_success = false; // Main/calc 2/if-then 2
			result = true; // Main/calc 2/if-then 3
		} // Main/calc 2
		EdgeRising.compute(^start); // Main/calc 3
		if (EdgeRising.value()) {
			Timer.begin(20); // Main/calc 4/if-then 1
		} // Main/calc 4
		if (^start) {
			Timer.compute(); // Main/calc 5/if-then 1
			if (Timer.isElapsed()) {
				TestMessages.d6st_success = result; // Main/calc 5/if-then 2/if-then 1
				TestMessages.d6st_complete = true; // Main/calc 5/if-then 2/if-then 2
			} else {
				if (abs(DriverMessages.dist2Route) > (4[m] + (4[m] * 0.01))) {
					result = false; // Main/calc 5/if-then 2/if-else 1/if-then 1
				} // Main/calc 5/if-then 2/if-else 1
			} // Main/calc 5/if-then 2
		} // Main/calc 5
	}
}