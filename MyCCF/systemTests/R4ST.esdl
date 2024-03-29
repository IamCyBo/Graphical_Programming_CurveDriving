package systemTests;

import resources.TestMessages;
import SystemLib.CounterTimer.Timer;
import SystemLib.Miscellaneous.EdgeRising;
import SystemLib.Miscellaneous.EdgeFalling;
import resources.CarMessages;
import SystemLib.Miscellaneous.DeltaOneStep;

singleton class R4ST
writes TestMessages.r4st_complete, TestMessages.r4st_success
reads CarMessages.steering {

	characteristic boolean ^start = false;
	Timer Timer;
	boolean result = true;
	EdgeRising EdgeRising;
	EdgeFalling EdgeFalling;
	DeltaOneStep ^delta;

	@thread
	@generated("blockdiagram", "f09ea7d4")
	public void calc() {
		EdgeFalling.compute(^start); // Main/calc 1
		if (EdgeFalling.value()) {
			TestMessages.r4st_complete = false; // Main/calc 2/if-then 1
			TestMessages.r4st_success = false; // Main/calc 2/if-then 2
			result = true; // Main/calc 2/if-then 3
		} // Main/calc 2
		EdgeRising.compute(^start); // Main/calc 3
		if (EdgeRising.value()) {
			Timer.begin(20); // Main/calc 4/if-then 1
		} // Main/calc 4
		if (^start) {
			Timer.compute(); // Main/calc 5/if-then 1
			if (Timer.isElapsed()) {
				TestMessages.r4st_success = result; // Main/calc 5/if-then 2/if-then 1
				TestMessages.r4st_complete = true; // Main/calc 5/if-then 2/if-then 2
			} else {
				if (abs(^delta.value()) > (0.01 + (0.01 * 0.01))) {
					result = false; // Main/calc 5/if-then 2/if-else 1/if-then 1
				} // Main/calc 5/if-then 2/if-else 1
			} // Main/calc 5/if-then 2
		} // Main/calc 5
		^delta.compute(CarMessages.steering); // Main/calc 6
	}
}