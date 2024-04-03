package myCar;

import resources.curve_m;
import resources.curve_real_mps2;
import resources.curve_kmph_mps2;
import resources.map_real_kmph_mps2;
import units.si.m;
import units.si.s;
import units.common.kmph;
import units.common.mps2;

class myDrive_4 {

	characteristic curve_real_mps2 BrakeMomentum = {
		{ 0.0, 1.0, 40.0, 60.0, 80.0, 100.0 },
		{ 0.0[mps2], 0.0[mps2], -1.0[mps2], -2.0[mps2], -3.0[mps2], -4.0[mps2] }
	};
	characteristic map_real_kmph_mps2 EngineMomentum[6][6] = {
		{ 0.0, 5.0, 20.0, 60.126582278481, 80.0, 100.0 },
		{ 0.0[kmph], 30.0[kmph], 60.0[kmph], 90.0[kmph], 150.0[kmph], 200.0[kmph] },
		{
			{ 0.0[mps2], 0.0[mps2], 0.0[mps2], 0.0[mps2], 0.0[mps2], 0.0[mps2] },
			{ 0.0[mps2], 0.0[mps2], 0.0[mps2], 0.0[mps2], 0.0[mps2], 0.0[mps2] },
			{ 0.849999999999999[mps2], 0.6000000000000001[mps2], 0.30000000000000004[mps2], 0.0[mps2], 0.0[mps2],
				0.0[mps2] },
			{ 3.1500000000000004[mps2], 2.3499999999999988[mps2], 1.5500000000000012[mps2], 0.8000000000000009[mps2],
				0.399999999999999[mps2], 0.0[mps2] },
			{ 4.5[mps2], 3.5999999999999996[mps2], 2.7[mps2], 1.5[mps2], 0.8999999999999999[mps2], 0.0[mps2] },
			{ 5.0[mps2], 4.5[mps2], 3.8000000000000096[mps2], 2.799999999999999[mps2], 1.899999999999999[mps2],
				0.0[mps2] }
		}
	};
	characteristic curve_kmph_mps2 AirFriction = {
		{ 0.0[kmph], 30.0[kmph], 60.0[kmph], 90.0[kmph], 120.0[kmph], 150.0[kmph] },
		{ 0.0[mps2], -0.1[mps2], -0.2[mps2], -0.4[mps2], -0.8[mps2], -1.6[mps2] }
	};
	characteristic curve_m Landscape = {
		{ 0.0[m], 100.0[m], 145.569620253165[m], 202.53164556962025[m], 221.51898734177215[m], 240.0[m],
			259.49367088607596[m], 300.0[m], 350.0[m], 400.0[m], 450.0[m], 500.0[m], 600.0[m], 700.0[m], 750.0[m],
			800.0[m], 810.0[m], 850.0[m], 900.0[m], 1000.0[m], 1100.0[m], 1200.0[m], 1300.0[m], 1400.0[m], 1500.0[m],
			1600.0[m], 1700.0[m], 1800.0[m], 1900.0[m], 2000.0[m], 2100.0[m], 2200.0[m], 2300.0[m], 2400.0[m],
			2500.0[m], 2600.0[m], 2700.0[m], 2800.0[m], 2900.0[m], 3000.0[m], 3100.0[m], 3200.0[m], 3300.0[m],
			3400.0[m], 3500.0[m], 3600.0[m], 3700.0[m], 3800.0[m], 3900.0[m], 4000.0[m], 4100.0[m], 4200.0[m],
			4300.0[m], 4400.0[m], 4500.0[m], 4600.0[m], 4700.0[m], 4800.0[m], 4900.0[m], 5000.0[m], 5100.0[m],
			5200.0[m], 5300.0[m], 5400.0[m], 5500.0[m], 5600.0[m], 5700.0[m], 5800.0[m], 5900.0[m], 6000.0[m],
			6100.0[m], 6200.0[m], 6300.0[m], 6400.0[m], 6500.0[m], 6600.0[m], 6700.0[m], 6800.0[m], 6900.0[m],
			7000.0[m], 7100.0[m], 7200.0[m], 7300.0[m], 7400.0[m], 7500.0[m], 7600.0[m], 7700.0[m], 7800.0[m],
			7900.0[m], 8000.0[m], 8100.0[m], 8200.0[m], 8300.0[m], 8400.0[m], 8500.0[m], 8600.0[m], 8700.0[m],
			8800.0[m], 8900.0[m], 9000.0[m], 9100.0[m], 9200.0[m], 9300.0[m], 9400.0[m], 9500.0[m], 9600.0[m],
			9700.0[m], 9800.0[m], 9900.0[m], 10000.0[m], 10100.0[m], 10200.0[m], 10300.0[m], 10400.0[m], 10500.0[m],
			10600.0[m], 10700.0[m], 10800.0[m], 10900.0[m], 11000.0[m], 11100.0[m], 11200.0[m], 11300.0[m], 11400.0[m],
			11500.0[m], 11600.0[m], 11700.0[m], 11800.0[m] },
		{ 0.0[m], 4.0[m], 7.125[m], 10.375[m], 10.75[m], 10.5[m], 9.0[m], 5.375[m], 2.625[m], 0.625[m], 1.25[m],
			0.625[m], 0.0[m], 0.0[m], 1.375[m], 0.75[m], 0.375[m], 0.625[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m],
			0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m],
			0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m],
			0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m],
			0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m],
			0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m],
			0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m],
			0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m],
			0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m], 0.0[m],
			0.0[m] }
	};
	m h = 0.0[m];
	m dh = 0.0[m];
	m ds = 0.0[m];
	@get
	mps2 momentum = 0.0[mps2];
	@get
	m dist = 0.0[m];
	characteristic m TrackSize = 1000.0[m];
	@get
	kmph v = 0.0[kmph];
	MyTurn MyTurn_instance;
	@get
	m x = 0.0[m];
	@get
	m y = 0.0[m];
	@get
	real bearing = 0.77;
	Logger Logger;
	Logger Logger_instance;
	@get
	mps2 acc = 0.0[mps2];

	@generated("blockdiagram", "19eda048")
	public void move(real in powerCtrl, real in brakeCtrl, s in mydt, mps2 in myg, real in ^delta) {
		if (dist > TrackSize) {
			dist = 0.0[m]; // Main/move 1/if-then 1
		} // Main/move 1
		momentum = EngineMomentum.getAt(powerCtrl, v); // Main/move 2
		dh = (h - Landscape.getAt(dist)); // Main/move 3
		h = Landscape.getAt(dist); // Main/move 4
		v = (((BrakeMomentum.getAt(brakeCtrl) + momentum + AirFriction.getAt(v) + (myg * (dh / ds))) * mydt) + v); // Main/move 5
		if (v < 0.0[kmph]) {
			v = 0.0[kmph]; // Main/move 6/if-then 1
		} // Main/move 6
		ds = (v * mydt); // Main/move 7
		dist = (ds + dist); // Main/move 8
		MyTurn_instance.move(^delta, v, mydt); // Main/move 9
		bearing = MyTurn_instance.bearing; // Main/move 10
		x = MyTurn_instance.x; // Main/move 11
		y = MyTurn_instance.y; // Main/move 12
		Logger_instance.calc(x / 1.0[m], y / 1.0[m], acc / 1.0[mps2], acc / 1.0[mps2], x / 1.0[m]); // Main/move 13
		acc = MyTurn_instance.acc; // Main/move 14
	}
}