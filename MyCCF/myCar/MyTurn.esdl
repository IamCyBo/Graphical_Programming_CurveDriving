package myCar;
import units.common.mps2;
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
	@get
	mps2 acc = 0.0 [mps2];

	characteristic m D = 2.85 [m];
	m ds = 0.0 [m];
	m dx = 0.0 [m];
	m dy = 0.0 [m];
	m radius = 0.0 [m];
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
		dx = ds*Lib.cos(bearing); 
		dy = ds*Lib.sin(bearing);
		x = x + dx;
		y = y + dy;
		
		radius = 2.85 [m] / Lib.sin(abs(beta));
		acc = Lib.pow(v * (5 / 18[kmph]), 2) * 1.0[mps2] * 1.0[m] / radius;	
		
	}
}