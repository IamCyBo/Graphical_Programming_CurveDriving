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
	vect focuspoint = {0.0[m], 0.0[m]};
	@get
	boolean lastElement;

	@generated("blockdiagram", "3fca29ef")
	public void calc(integer in arg) {
		lastElement = (y.length() == arg); // Main/calc 1
		focuspoint = vectOps.getPoint(x[arg], y[arg]); // Main/calc 2
	}

	public m point_distance(vect point_in) {
		m tmp_distance;
		vect tmp_start = vectOps.getPoint(x[0], y[0]);
		vect tmp_end = vectOps.getPoint(x[1], y[1]);

		m min_distance = vectOps.distancePointSegment(point_in, tmp_start, tmp_end);
		for (i in 1 .. x.length(0) - 2) {
			tmp_start = vectOps.getPoint(x[i], y[i]);
			tmp_end = vectOps.getPoint(x[i + 1], y[i + 1]);
			tmp_distance = vectOps.distancePointSegment(point_in, tmp_start, tmp_end);

			if (tmp_distance < min_distance) {
				min_distance = tmp_distance;
			}
		}
		return min_distance;
	}
}