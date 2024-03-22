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
	public m length(vect v_in) {
		return lib.sqrt((v_in[0] * v_in[0] + v_in[1] * v_in[1]) / 1[m ^ 2]) *1[m];
	}
	
	// Normalizes the given vector by dividing by it's length
	public vect norm(vect v_in) {
		real size = length(v_in)/1[m];
		if (size == 0){
			vect_norm = v_in;
			return vect_norm;
		}
		vect_norm[0] = v_in[0]/size;
		vect_norm[1] = v_in[1]/size;
		return vect_norm;
	}
	
	// Calculates the scalar product of the two given vectors and returns it as a real value
	// The scalar product is calculated using A1*B1 + A2*B2
	public real scalar(vect vectA, vect vectB){
		return (vectA[0]*vectB[0] + vectA[1]*vectB[1])/1[m^2];
	}
	
	// Calculates the cross Product of two vektors and returns it as a real value
	// The cross prduct is calulated by A1*B2-B1*A2
	public real crossProduct(vect pointA, vect pointB){
		return (pointA[0]*pointB[1] - pointB[0]*pointA[1]) /1[m^2];
	}
		
	// Calculates the angle between two vectors and returns it in rad
	public real angle(vect vectA, vect vectB){
		real cross = crossProduct(vectA, vectB);
		real scal = scalar(vectA, vectB);
		
		return lib.atan2(cross, scal);
	}
	
	// Calculates the distance between a Point and a Line Segment and returns it in m
	// The distance is either the distance from the Point to the segment start/end
	// and otherwise calculated by abs(crossproduct(AB/AP))/length(vect(AB,AP))
	public m distancePointSegment(vect point, vect segA, vect segB){
		vect seg_dir;
		real projection_length;
		vect orthogonal_vect;
				
		vect AB = getVect(segA, segB);
		vect AP = getVect(segA, point);
		vect BP = getVect(segB, point);
		
		m seg_length = length(AB);
		if (seg_length == 0) {
			return length(AP);
		}
		
		seg_dir = norm(AB);
		projection_length = scalar(AP, seg_dir);
		
		if (projection_length < 0) {
			return length(AP);
		}
		if (projection_length > seg_length) {
			return length(BP);
		}
		seg_dir[0] = seg_dir[0] * projection_length;
		seg_dir[1] = seg_dir[1] * projection_length;
		orthogonal_vect = getVect(AB, seg_dir);
		return length(orthogonal_vect);
	}
}