package myCar;

import resources.arr_m;
import units.si.m;

class Route {

	arr_m x[9] = {0.0[m], 10.264[m], 92.392[m], 128.309[m], 154.688[m], 184.725[m], 380.987[m]};
	arr_m y[9] = {0.0[m], 9.977[m], 94.244[m], 126.387[m], 146.327[m], 67.368[m], 276.906[m]};
	@get
	m x0 = 0.0[m];
	@get
	m y0 = 0.0[m];

	@generated("blockdiagram", "f0b961c2")
	public void calc(integer in arg) {
		x0 = x[arg]; // Main/calc 1
		y0 = y[arg]; // Main/calc 2
	}
}