package systemTests;

import resources.CarMessages;
import SystemLib.CounterTimer.Timer;
import SystemLib.CounterTimer.StopWatch;
import common.types.T_2D_REAL;
import common.types.T_1D_REAL;
import resources.TestMessages;
import units.common.kmph;
import SystemLib.Miscellaneous.EdgeFalling;
import SystemLib.Miscellaneous.EdgeRising;
import myCar.Route;

singleton class R1ST
reads CarMessages.v
writes TestMessages.r1st_success, TestMessages.r1st_complete {

	boolean result = true;
	Timer Timer_instance;
	StopWatch StopWatch_instance;
	characteristic T_2D_REAL T_2D_REAL_instance[3][3] = {
		{ 0.0, 1.0, 2.0 },
		{ 0.0, 1.0, 2.0 },
		{
			{ 0.0, 0.0, 0.0 },
			{ 0.0, 0.0, 0.0 },
			{ 0.0, 0.0, 0.0 }
		}
	};
	characteristic T_1D_REAL T_1D_REAL_instance[4] = {
		{ 0, 4.0, 14.0, 15.0 },
		{ 0.0, 1.0, 1.0, 0.0 }
	};
	characteristic T_1D_REAL T_1D_REAL_instance_2[3] = {
		{ 14, 15.0, 16.0 },
		{ 0.0, 1.0, 1.0 }
	};
	EdgeFalling EdgeFalling_instance;
	EdgeRising EdgeRising_instance;
	characteristic boolean ^start = false;
	Route Route_instance;
	Timer Timer_instance_2;

	@thread
	@generated("blockdiagram", "1b1b99b8")
	public void calc() {
		EdgeFalling_instance.compute(^start); // Main/calc 1
		EdgeRising_instance.compute(^start); // Main/calc 2
		if (EdgeFalling_instance.value()) {
			TestMessages.r1st_success = false; // Main/calc 3/if-then 1
			TestMessages.r1st_complete = false; // Main/calc 3/if-then 2
			result = true; // Main/calc 3/if-then 3
		} // Main/calc 3
		if (EdgeRising_instance.value()) {
			Timer_instance_2.begin(5.0); // Main/calc 4/if-then 1
			Timer_instance.begin(15.0); // Main/calc 4/if-then 2
		} // Main/calc 4
		if (^start) {
			Timer_instance_2.compute(); // Main/calc 5/if-then 1
			Timer_instance.compute(); // Main/calc 5/if-then 2
			if (Timer_instance_2.isElapsed()) {
				if (abs((CarMessages.v - 60[kmph])) > (60[kmph] * 0.01)) {
					result = false; // Main/calc 5/if-then 3/if-then 1/if-then 1
				} // Main/calc 5/if-then 3/if-then 1
			} // Main/calc 5/if-then 3
			if (Timer_instance.isElapsed()) {
				TestMessages.r1st_complete = true; // Main/calc 5/if-then 4/if-then 1
				TestMessages.r1st_success = result; // Main/calc 5/if-then 4/if-then 2
			} // Main/calc 5/if-then 4
		} // Main/calc 5
	}

	@generated("blockdiagram", "339e72d5")
	public void calc_2() {
	}
}