package myCar;

class SteeringCtrl {

	characteristic real dstr = 0.01;
	@get
	@set
	real str = 0.0;
	@set
	real ref = 0.0;

	@generated("blockdiagram", "4ba64fa9")
	public void calc() {
		if (ref > str) {
			if ((dstr + str) <= 0.5) {
				str = (dstr + str); // Main/calc 1/if-then 1/if-then 1
			} else {
				str = 0.5; // Main/calc 1/if-then 1/if-else 1
			} // Main/calc 1/if-then 1
		} else {
			if (ref == str) {
				str = ref; // Main/calc 1/if-else 1/if-then 1
			} else {
				if ((str - dstr) >= -0.5) {
					str = (str - dstr); // Main/calc 1/if-else 1/if-else 1/if-then 1
				} else {
					str = -0.5; // Main/calc 1/if-else 1/if-else 1/if-else 1
				} // Main/calc 1/if-else 1/if-else 1
			} // Main/calc 1/if-else 1
		} // Main/calc 1
	}
}