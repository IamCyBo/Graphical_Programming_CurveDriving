package vectorOperations;

import SystemLib.Math.MathLib;
import units.si.m;

class vectAngle {
	MathLib lib;
	vectScalar vscalar;
	vectLength vlength;
	
	public real getAngle(m x1, m y1, m x2, m y2){
		real scalar = vscalar.getScalar(x1, y1, x2, y2);
		real lengthA = vlength.getLength(x1, y2);
		real lengthB = vlength.getLength(x2, y2);
		
		return lib.acos(scalar/(lengthA * lengthB));
	}
}