package vectorOperations;

import SystemLib.Math.MathLib;
import resources.vect;
import units.si.m;

class vectOps {
	private MathLib lib;
	
	private vect vect_norm = {0[m]};
	private vect vect_get = {0[m]};
	
	// Calculates the vector from one point to another
	// The points are given as an origin vector 
	public vect getVect(vect pointA, vect pointB){
		vect_get[0] = pointB[0] - pointA[0];
		vect_get[1] = pointB[1] - pointA[1];
		return vect_get;
	}

	// Calculates the length of a vector and returns it as a real value
	// The length of the vector is calculated using the pythagorean theorem: sqrt(x^2 + y^2)
	public real length(vect v_in) {
		return lib.sqrt((v_in[0] * v_in[0] + v_in[1] * v_in[1]) / 1[m ^ 2]);
	}
	
	// Normalizes the given vector by dividing by it's length
	public vect norm(vect v_in){
		real size = length(v_in);
		vect_norm[0] = v_in[0]/size;
		vect_norm[1] = v_in[1]/size;
		return vect_norm;
	}
	
	// Calculates the scalar product of the two given vectors and returns it as a real value
	// The scalar product is calculated using A1*B1 + A2*B2
	public real scalar(vect vectA, vect vectB){
		return (vectA[0]*vectB[0] + vectA[1]*vectB[1])/1[m^2];
	}
	
	// Calculates the angle between two vectors and returns it in rad
	// The angle is calculated by using acos((A*B)/(|A|*|B|))
	public real angle(vect vectA, vect vectB){
		real scalar = scalar(vectA, vectB);
		real lengthA = length(vectA);
		real lengthB = length(vectB);
		
		return lib.acos(scalar/(lengthA * lengthB));
	}
	
	// Calculates the cross Product of two vektors and returns it as a real value
	// The cross prduct is calulated by A1*B2-B1*A2
	public real crossProduct(vect pointA, vect pointB){
		return (pointA[0]*pointB[1] - pointB[0]*pointA[1]) /1[m^2];
	}
	
	// Calculates the distance between a Point and a Line Segment and returns it in m
	// The distance is either the distance from the Point to the segment start/end
	// and otherwise calculated by abs(crossproduct(AB/AP))/length(vect(AB,AP))
	public m distancePointSegment(vect point, vect segA, vect segB){		
		vect AB = getVect(segA, segB);
		vect BP = getVect(segB, point);
		vect AP = getVect(segA, point);
		
		real scalar_ABBP = scalar(AB, BP);
		real scalar_ABAP = scalar(AB, AP);
		
		if (scalar_ABBP > 0){
			return length(BP)*1[m];
		}
		else if (scalar_ABAP < 0){
			return length(AP)*1[m];
		}
		else {
			return abs(crossProduct(AB, AP))/length(getVect(AB, AP)) *1[m];
		}
	}
}