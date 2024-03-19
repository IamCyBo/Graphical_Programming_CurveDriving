package myCar;
import SystemLib.Math.MathLib;
import units.common.kmph;
import units.si.m;
import units.si.s;

class MyTurn {

	@get
	m x = 0.0 [m];
	@get
	m y = 0.0 [m];
	@get
	real bearing = 0.0;

	characteristic m D = 2.85 [m];
	m ds = 0.0 [m];
	MathLib Lib;
	real dpi = 6.28318531;
	real pi = 3.141592653; 
	
	public void move(real beta, kmph v, s mydt) {
		ds = v*mydt;
		bearing = bearing + (ds/D)*Lib.sin(beta);
		if (bearing > pi) {
			bearing = bearing - 2*pi;
		}
		if (bearing < -pi) {
			bearing = bearing + 2*pi;
		}
		x = x + ds*Lib.cos(bearing);
		y = y + ds*Lib.sin(bearing);
	}
}