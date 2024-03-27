package myCar;

import SystemLib.Nonlinears.Signum;

class SteeringCtrl {

	characteristic real dstr = 0.2;
	@get
	@set
	real str = 0.0;
	@set
	real ^delta = 0.0;
	Signum Signum_instance;

	@generated("blockdiagram", "b8467dbf")
	public void calc() {
		str = ((Signum_instance.value((^delta - str)) * min(abs((^delta - str)), dstr)) + str); // Main/calc 1
		str = (Signum_instance.value(str) * min(abs(str), 0.5)); // Main/calc 2
	}
}