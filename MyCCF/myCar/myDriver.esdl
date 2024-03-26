package myCar;

import resources.CarMessages;
import units.common.kmph;
import components.driverTemplate;

singleton class myDriver
reads CarMessages.v
writes CarMessages.power {

	driverTemplate driverTemplate_instance;

	@thread
	@generated("blockdiagram", "18660e94")
	public void calc() {
		CarMessages.power = driverTemplate_instance.power(60[kmph], CarMessages.v); // calc_spec/calc 1
	}
}