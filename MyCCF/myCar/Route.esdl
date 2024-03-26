package myCar;

import resources.vect;
import resources.arr_m;
import units.si.m;
import vectorOperations.vectOps;

class Route {

	vectOps vectOps;
	arr_m x[9] = {0.0[m], 10.264[m], 92.392[m], 128.309[m], 154.688[m], 184.725[m], 380.987[m]};
	arr_m y[9] = {0.0[m], 9.977[m], 94.244[m], 126.387[m], 146.327[m], 67.368[m], 276.906[m]};
	@get
	arr_m focuspoint[2] = {0.0[m], 0.0[m]};

	@generated("blockdiagram", "9d812663")
	public void calc(integer in arg) {
		focuspoint[0] = x[arg]; // Main/calc 1
		focuspoint[1] = y[arg]; // Main/calc 2
	}
}