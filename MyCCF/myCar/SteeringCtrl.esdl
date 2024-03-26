package myCar;

class SteeringCtrl {

	characteristic real dstr = 0.01;
	@get
	@set
	real str = 0.0;
	@set
	real ^delta = 0.0;

	@generated("blockdiagram", "4da7e6dd")
	public void calc() {
		if (between(dstr, abs(^delta), 0.0)) {
			str = (^delta + str); // Main/calc 1/if-then 1
		} else {
			if (^delta > str) {
				if ((dstr + str) <= 0.5) {
					str = (dstr + str); // Main/calc 1/if-else 1/if-then 1/if-then 1
				} else {
					str = 0.5; // Main/calc 1/if-else 1/if-then 1/if-else 1
				} // Main/calc 1/if-else 1/if-then 1
			} else {
				if (^delta == str) {
					str = ^delta; // Main/calc 1/if-else 1/if-else 1/if-then 1
				} else {
					if ((str - dstr) >= -0.5) {
						str = (str - dstr); // Main/calc 1/if-else 1/if-else 1/if-else 1/if-then 1
					} else {
						str = -0.5; // Main/calc 1/if-else 1/if-else 1/if-else 1/if-else 1
					} // Main/calc 1/if-else 1/if-else 1/if-else 1
				} // Main/calc 1/if-else 1/if-else 1
			} // Main/calc 1/if-else 1
		} // Main/calc 1
	}
}