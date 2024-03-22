package myCar;

import vectorOperations.vectOps;
import SystemLib.Miscellaneous.EdgeRising;
import resources.CarMessages;
import resources.arr_m;
import units.si.m;

singleton class Control
reads CarMessages.mybearing, CarMessages.x, CarMessages.y
writes CarMessages.steering {

	vectOps vectOps;
	Route Route;
	integer focuspointIndex;
	real distance2focuspoint;
	characteristic real proximity = 0.0;
	EdgeRising ^trigger;
	arr_m tmp[2] = {1.0[m], 0.0[m]};
	real str;
	characteristic real dstr = 0.0;
	Logger Logger_instance;

	@generated("blockdiagram", "632ae129")
	public void calc() {
		Route.calc(focuspointIndex); // Main/calc 1
		^trigger.compute((distance2focuspoint < proximity)); // Main/calc 2
		if (^trigger.value()) {
			focuspointIndex = (1 + focuspointIndex); // Main/calc 3/if-then 1
		} // Main/calc 3
		if ((vectOps.angle(vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.vec), tmp) - CarMessages.mybearing) > str) {
			str = (dstr + str); // Main/calc 4/if-then 1
		} else {
			str = (str - dstr); // Main/calc 4/if-else 1
		} // Main/calc 4
		Logger_instance.calc(str, CarMessages.x / 1.0[m], CarMessages.y / 1.0[m], (vectOps.angle(vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.vec), tmp) - CarMessages.mybearing)); // Main/calc 5
		CarMessages.steering = str; // Main/calc 6
		distance2focuspoint = vectOps.length(Route.vec); // Main/calc 7
	}
}