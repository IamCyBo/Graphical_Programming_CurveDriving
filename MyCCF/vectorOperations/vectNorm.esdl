package vectorOperations;

import units.si.m;

class vectNorm {
	@get 
	m x = 0.0 [m];
	
	@get
	m y = 0.0 [m];
	vectLength vlength;
	
	public void getNorm(m x_in, m y_in){
		real size = vlength.getLength(x_in, y_in);
		x = x_in/size;
		y = y_in/size;	
	}
}