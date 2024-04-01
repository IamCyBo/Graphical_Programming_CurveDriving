package myCar;

import resources.CarMessages;
import SystemLib.Miscellaneous.DeltaTimeService;
import units.si.s;
import units.common.mps2;

singleton class myCar
reads CarMessages.steering, CarMessages.power, CarMessages.brake
writes CarMessages.v, CarMessages.x, CarMessages.y, CarMessages.mybearing, CarMessages.radius {

	myDrive_4 myVehicle;
	characteristic mps2 g = 0.0[mps2];
	real mydt = 0.0;

	@thread
	@generated("blockdiagram", "926380f7")
	public void calc() {
		mydt = DeltaTimeService.deltaT; // Main/calc 1
		myVehicle.move(CarMessages.power, CarMessages.brake, mydt * 1.0[s], g, CarMessages.steering); // Main/calc 2
		CarMessages.mybearing = myVehicle.bearing; // Main/calc 3
		CarMessages.x = myVehicle.x; // Main/calc 4
		CarMessages.y = myVehicle.y; // Main/calc 5
		CarMessages.v = myVehicle.v; // Main/calc 6
		CarMessages.radius = myVehicle.radius; // Main/calc 7
	}
}