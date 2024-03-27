package myCar;

import SystemLib.Miscellaneous.EdgeRising;
import resources.CarMessages;
import resources.arr_m;
import units.si.m;
import vectorOperations.vectOps;
import resources.vect;
import units.common.kmph;
import components.velocityController;

singleton class Control
reads CarMessages.mybearing, CarMessages.x, CarMessages.y, CarMessages.v
writes CarMessages.steering, CarMessages.power, CarMessages.brake {

	vectOps vectOps;
	Route Route;
	integer focuspointIndex = 0;
	m distance2focuspoint = 340.0E6[m];
	characteristic m proximity = 5.94328439326[m];
	EdgeRising ^trigger;
	arr_m tmp[2] = {1.0[m], 0.0[m]};
	real str = 0.0;
	Logger Logger_instance;
	SteeringCtrl SteeringCtrl;
	vect currenPos;
	m distance2end = 0.0[m];
	kmph TODO_vsoll = 0.0[kmph];
	velocityController velocityController_instance;

	@thread
	@generated("blockdiagram", "9108815f")
	public void calc() {
		^trigger.compute((distance2focuspoint < proximity)); // Main/calc 1
		if (^trigger.value()) {
			focuspointIndex = (1 + focuspointIndex); // Main/calc 2/if-then 1
		} // Main/calc 2
		Route.calc(focuspointIndex); // Main/calc 3
		SteeringCtrl.^delta = (vectOps.angle(tmp, vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)) - CarMessages.mybearing); // Main/calc 4
		SteeringCtrl.str = str; // Main/calc 5
		SteeringCtrl.calc(); // Main/calc 6
		str = SteeringCtrl.str; // Main/calc 7
		Logger_instance.calc(str, CarMessages.x / 1.0[m], CarMessages.y / 1.0[m], (vectOps.angle(tmp, vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)) - CarMessages.mybearing)); // Main/calc 8
		CarMessages.steering = str; // Main/calc 9
		distance2focuspoint = vectOps.length(vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)); // Main/calc 10
		distance2end = (distance2focuspoint + Route.distanceFocusEnd); // Main/calc 11
		if (distance2end <= 33.5[m]) {
			TODO_vsoll = 0.0[kmph]; // Main/calc 12/if-then 1
		} else {
			TODO_vsoll = 60[kmph]; // Main/calc 12/if-else 1
		} // Main/calc 12
		velocityController_instance.calc(TODO_vsoll, CarMessages.v); // Main/calc 13
		CarMessages.brake = velocityController_instance.brake; // Main/calc 14
		CarMessages.power = velocityController_instance.power; // Main/calc 15
	}
}