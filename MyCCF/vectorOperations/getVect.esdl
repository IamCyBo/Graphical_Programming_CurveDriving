package vectorOperations;

import units.si.m;

class getVect {
	@get
	m x = 0.0 [m];
	
	@get
	m y = 0.0 [m];
	
	public void getVect(m x1, m y1, m x2, m y2){
		x = x2-x1;
		y = y2-y1;
	}
}