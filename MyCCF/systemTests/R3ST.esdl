package systemTests;

import resources.TestMessages;
import SystemLib.CounterTimer.Timer;
import SystemLib.Miscellaneous.EdgeRising;
import SystemLib.Miscellaneous.EdgeFalling;
import resources.CarMessages;

singleton class R3ST
writes TestMessages.r3st_complete, TestMessages.r3st_success
reads CarMessages.steering {

	characteristic boolean ^start = false;
	Timer Timer;
	boolean result = true;
	EdgeRising EdgeRising;
	EdgeFalling EdgeFalling;

	@thread
	@generated("blockdiagram", "44311e18")
	public void calc() {
		EdgeFalling.compute(^start); // Main/calc 1
		if (EdgeFalling.value()) {
			TestMessages.r3st_complete = false; // Main/calc 2/if-then 1
			TestMessages.r3st_success = false; // Main/calc 2/if-then 2
			result = true; // Main/calc 2/if-then 3
		} // Main/calc 2
		EdgeRising.compute(^start); // Main/calc 3
		if (EdgeRising.value()) {
			Timer.begin(20); // Main/calc 4/if-then 1
		} // Main/calc 4
		if (^start) {
			Timer.compute(); // Main/calc 5/if-then 1
			if (Timer.isElapsed()) {
				TestMessages.r3st_success = result; // Main/calc 5/if-then 2/if-then 1
				TestMessages.r3st_complete = true; // Main/calc 5/if-then 2/if-then 2
			} else {
				if (abs(CarMessages.steering) > 0.5) {
					result = false; // Main/calc 5/if-then 2/if-else 1/if-then 1
				} // Main/calc 5/if-then 2/if-else 1
			} // Main/calc 5/if-then 2
		} // Main/calc 5
	}
}