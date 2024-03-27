package myCar;

import SystemLib.Miscellaneous.EdgeRising;
import resources.CarMessages;
import resources.arr_m;
import units.si.m;
import vectorOperations.vectOps;
import resources.DriverMessages;

singleton class Control
reads CarMessages.mybearing, CarMessages.x, CarMessages.y
writes CarMessages.steering, DriverMessages.dist2End, DriverMessages.dist2Route {

	vectOps vectOps;
	Route Route;
	integer focuspointIndex = 0;
	m distance2focuspoint = 340.0E6[m];
	characteristic m proximity = 11.0[m];
	EdgeRising ^trigger;
	arr_m tmp[2] = {1.0[m], 0.0[m]};
	real str = 0.0;
	Logger Logger;
	SteeringCtrl SteeringCtrl;
	vect currenPos;
	m distance2end = 0.0[m];
	kmph target_vel = 0.0[kmph];
	velocityController velocityController_instance;

	@thread
	@generated("blockdiagram", "1426e39d")
	public void calc() {
		^trigger.compute((distance2focuspoint < proximity)); // Main/calc 1
		if (^trigger.value()) {
			focuspointIndex = (1 + focuspointIndex); // Main/calc 2/if-then 1
		} // Main/calc 2
		Route.calc(focuspointIndex); // Main/calc 3
		SteeringCtrl.str = str; // Main/calc 4
		SteeringCtrl.^delta = vectOps.angleDiff(vectOps.angle(tmp, vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)), CarMessages.mybearing); // Main/calc 5
		SteeringCtrl.calc(); // Main/calc 6
		str = SteeringCtrl.str; // Main/calc 7
		Logger.calc(str, CarMessages.x / 1.0[m], CarMessages.y / 1.0[m], vectOps.angle(tmp, vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)), CarMessages.mybearing); // Main/calc 8
		CarMessages.steering = str; // Main/calc 9
		distance2focuspoint = vectOps.length(vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)); // Main/calc 10
		DriverMessages.dist2End = (distance2focuspoint + Route.distanceFocusEnd); // Main/calc 11
		DriverMessages.dist2Route = Route.point_distance(vectOps.getPoint(CarMessages.x, CarMessages.y)); // Main/calc 12
	}
}