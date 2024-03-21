package vectorOperations;

import SystemLib.Math.MathLib;
import units.si.m;

class vectLength {

	MathLib lib;

	public real getLength(m x, m y) {
		return lib.sqrt((x * x + y * y) / 1[m ^ 2]);
	}
}