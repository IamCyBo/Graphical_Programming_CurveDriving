package myCar;

import SystemLib.Miscellaneous.EdgeRising;
import resources.CarMessages;
import resources.arr_m;
import units.si.m;
import vectorOperations.vectOps;

singleton class Control
reads CarMessages.mybearing, CarMessages.x, CarMessages.y
writes CarMessages.steering {

	vectOps vectOps;
	Route Route;
	integer focuspointIndex = 0;
	real distance2focuspoint = 340.0E6;
	characteristic real proximity = 5.94328439326;
	EdgeRising ^trigger;
	arr_m tmp[2] = {1.0[m], 0.0[m]};
	real str = 0.0;
	characteristic real dstr = 0.01;
	Logger Logger_instance;
	SteeringCtrl SteeringCtrl;

	@thread
	@generated("blockdiagram", "2928e123")
	public void calc() {
		^trigger.compute((distance2focuspoint < proximity)); // Main/calc 1
		if (^trigger.value()) {
			focuspointIndex = (1 + focuspointIndex); // Main/calc 2/if-then 1
		} // Main/calc 2
		Route.calc(focuspointIndex); // Main/calc 3
		SteeringCtrl.ref = (vectOps.angle(tmp, vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)) - CarMessages.mybearing); // Main/calc 4
		SteeringCtrl.str = str; // Main/calc 5
		SteeringCtrl.calc(); // Main/calc 6
		str = SteeringCtrl.str; // Main/calc 7
		Logger_instance.calc(str, CarMessages.x / 1.0[m], CarMessages.y / 1.0[m], (vectOps.angle(tmp, vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)) - CarMessages.mybearing)); // Main/calc 8
		CarMessages.steering = str; // Main/calc 9
		distance2focuspoint = vectOps.length(vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)); // Main/calc 10
	}
}