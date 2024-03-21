package vectorOperations;

import units.si.m;

class vectScalar {	
	public real getScalar(m x1, m y1, m x2, m y2){
		return (x1*x2 + y1*y2)/1[m^2];
	}
}