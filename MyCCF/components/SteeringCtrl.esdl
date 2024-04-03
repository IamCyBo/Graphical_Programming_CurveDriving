package components;

import SystemLib.Nonlinears.Signum;

class SteeringCtrl {

	@get
	@set
	real str = 0.0;
	@set
	real ^delta = 0.0;
	Signum Signum;

	@generated("blockdiagram", "cfe39f89")
	public void calc() {
		str = ((Signum.value((^delta - str)) * min(abs((^delta - str)), 0.01)) + str); // Main/calc 1
		str = (Signum.value(str) * min(abs(str), 0.5)); // Main/calc 2
	}
}