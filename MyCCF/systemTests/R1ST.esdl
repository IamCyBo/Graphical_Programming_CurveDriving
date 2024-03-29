package systemTests;

import resources.CarMessages;
import SystemLib.CounterTimer.StopWatch;
import common.types.T_1D_REAL;
import resources.TestMessages;
import units.common.kmph;
import SystemLib.Miscellaneous.EdgeFalling;
import SystemLib.Miscellaneous.EdgeRising;

singleton class R1ST
reads CarMessages.v
writes TestMessages.r1st_success, TestMessages.r1st_complete {

	boolean result = true;
	StopWatch StopWatch;
	characteristic T_1D_REAL T_1D_REAL_TEST[4] = {
		{ 0, 4.0, 14.0, 15.0 },
		{ 0.0, 1.0, 1.0, 0.0 }
	};
	characteristic T_1D_REAL T_1D_REAL_END[3] = {
		{ 14, 15.0, 16.0 },
		{ 0.0, 1.0, 1.0 }
	};
	boolean ^start;
	EdgeFalling EdgeFalling;
	EdgeRising EdgeRising;
	characteristic boolean cstart = false;

	@thread
	@generated("blockdiagram", "2ee34876")
	public void calc() {
		if (T_1D_REAL_TEST.getAt(StopWatch.value()) == 1.0) {
			if (abs((CarMessages.v - 60[kmph])) > (60[kmph] * 0.01)) {
				result = false; // Main/calc 1/if-then 1/if-then 1
			} // Main/calc 1/if-then 1
		} // Main/calc 1
		if (1.0 == T_1D_REAL_END.getAt(StopWatch.value())) {
			TestMessages.r1st_complete = true; // Main/calc 2/if-then 1
			TestMessages.r1st_success = result; // Main/calc 2/if-then 2
		} // Main/calc 2
		EdgeFalling.compute(cstart); // Main/calc 3
		EdgeRising.compute(cstart); // Main/calc 4
		if (EdgeFalling.value()) {
			StopWatch.reset(); // Main/calc 5/if-then 1
			^start = false; // Main/calc 5/if-then 2
			TestMessages.r1st_success = false; // Main/calc 5/if-then 3
			TestMessages.r1st_complete = false; // Main/calc 5/if-then 4
			result = true; // Main/calc 5/if-then 5
		} // Main/calc 5
		if (^start) {
			StopWatch.compute(); // Main/calc 6/if-then 1
		} // Main/calc 6
		if (EdgeRising.value()) {
			^start = true; // Main/calc 7/if-then 1
		} // Main/calc 7
	}
}