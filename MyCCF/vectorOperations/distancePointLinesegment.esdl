package vectorOperations;

import units.si.m;

class distancePointLinesegment {
	vectScalar vScalar;
	getVect vGet;
	
	public void getDistance(m point_x, m point_y, m segment_a_x, m segment_a_y, m segment_b_x, m segment_b_y){		
		m AB_x;
		m AB_y;
		m BP_x;
		m BP_y;
		m AP_x;
		m AP_y;
		m ABBP;
		vGet.getVect(point_x, point_y, segment_a_x, segment_a_y);
		AB_x = vGet.x;
		AB_y = vGet.y;
		vGet.getVect(segment_b_x, segment_b_y, point_x, point_y);
		BP_x = vGet.x;
		BP_y = vGet.y;
		vGet.getVect(segment_a_x, segment_a_y, point_x, point_y);
		AP_x = vGet.x;
		AP_y = vGet.y;
		
		ABBP = vScalar.getScalar(AB_x, AB_y, BP_x, BP_y);
	}
}