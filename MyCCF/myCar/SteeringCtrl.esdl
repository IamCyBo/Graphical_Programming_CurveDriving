package myCar;

import SystemLib.Nonlinears.Signum;

class SteeringCtrl {

	characteristic real dstr = 0.2;
	@get
	@set
	real str = 0.0;
	@set
	real ^delta = 0.0;
	Signum Signum;

	@generated("blockdiagram", "e01e6f78")
	public void calc() {
		str = ((Signum.value((^delta - str)) * min(abs((^delta - str)), dstr)) + str); // Main/calc 1
		str = (Signum.value(str) * min(abs(str), 0.5)); // Main/calc 2
	}
}