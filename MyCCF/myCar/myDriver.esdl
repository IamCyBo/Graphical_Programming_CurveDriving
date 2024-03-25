package myCar;

import resources.CarMessages;
import units.common.kmph;

singleton class myDriver
reads CarMessages.v
writes CarMessages.power, CarMessages.steering {

	SteeringCtrl SteeringCtrl;
	characteristic real steer = 0.0;

	@thread
	@generated("blockdiagram", "f62bd76b")
	public void calc() {
		if ((2000 * (60[kmph] - CarMessages.v)) / 1.0[kmph] >= 0.0) {
			CarMessages.power = (2000 * (60[kmph] - CarMessages.v)) / 1.0[kmph]; // Main/calc 1/if-then 1
		} else {
			CarMessages.power = 0.0; // Main/calc 1/if-else 1
		} // Main/calc 1
		SteeringCtrl.ref = steer; // Main/calc 2
		SteeringCtrl.str = SteeringCtrl.str; // Main/calc 3
		SteeringCtrl.calc(); // Main/calc 4
		CarMessages.steering = SteeringCtrl.str; // Main/calc 5
	}
}