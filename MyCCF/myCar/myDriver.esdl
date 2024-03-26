package myCar;

import resources.CarMessages;
import units.common.kmph;

singleton class myDriver
reads CarMessages.v
writes CarMessages.power {

	@thread
	@generated("blockdiagram", "2de92d6a")
	public void calc() {
		if ((2000 * (60[kmph] - CarMessages.v)) / 1.0[kmph] >= 0.0) {
			CarMessages.power = (2000 * (60[kmph] - CarMessages.v)) / 1.0[kmph]; // Main/calc 1/if-then 1
		} else {
			CarMessages.power = 0.0; // Main/calc 1/if-else 1
		} // Main/calc 1
	}
}