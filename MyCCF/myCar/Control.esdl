package myCar;

import SystemLib.Miscellaneous.EdgeRising;
import resources.CarMessages;
import resources.arr_m;
import units.si.m;
import vectorOperations.vectOps;
import resources.DriverMessages;
import units.common.kmph;
import components.VelocityCtrl;
import components.SteeringCtrl;
import SystemLib.Math.MathLib;

singleton class Control
reads CarMessages.mybearing, CarMessages.x, CarMessages.y, CarMessages.v, CarMessages.radius
writes CarMessages.steering, DriverMessages.dist2End, DriverMessages.dist2Route, CarMessages.power, CarMessages.brake {

	vectOps vectOps;
	Route Route;
	integer focuspointIndex = 1;
	m distance2focuspoint = 340.0E6[m];
	characteristic m proximity = 11.0[m];
	EdgeRising ^trigger;
	arr_m tmp[2] = {1.0[m], 0.0[m]};
	real str = 0.0;
	Logger Logger;
	SteeringCtrl SteeringCtrl;
	kmph target_vel = 0.0[kmph];
	VelocityCtrl velocityController;
	characteristic real g = 9.81;
	MathLib MathLib_instance;
	m distance2end = 0.0[m];

	@thread
	@generated("blockdiagram", "21cfa128")
	public void calc() {
		^trigger.compute((distance2focuspoint < proximity)); // Main/calc 1
		if (^trigger.value()) {
			focuspointIndex = (1 + focuspointIndex); // Main/calc 2/if-then 1
		} // Main/calc 2
		Route.calc(focuspointIndex); // Main/calc 3
		SteeringCtrl.str = str; // Main/calc 4
		SteeringCtrl.^delta = vectOps.angleDiff(vectOps.angle(tmp, vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)), CarMessages.mybearing); // Main/calc 5
		SteeringCtrl.calc(); // Main/calc 6
		str = SteeringCtrl.str; // Main/calc 7
		CarMessages.steering = str; // Main/calc 8
		distance2focuspoint = vectOps.length(vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)); // Main/calc 9
		DriverMessages.dist2End = (distance2focuspoint + Route.distanceFocusEnd); // Main/calc 10
		distance2end = (distance2focuspoint + Route.distanceFocusEnd); // Main/calc 11
		DriverMessages.dist2Route = Route.point_distance(vectOps.getPoint(CarMessages.x, CarMessages.y)); // Main/calc 12
		Logger.calc(str, CarMessages.x / 1.0[m], CarMessages.y / 1.0[m], vectOps.angle(tmp, vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)), Route.point_distance(vectOps.getPoint(CarMessages.x, CarMessages.y)) / 1.0[m]); // Main/calc 13
	}

	@thread
	@generated("blockdiagram", "fdfc92e4")
	public void setTargetVel() {
		if (distance2end <= 35[m]) {
			target_vel = 0.0[kmph]; // LateralAcc/setTargetVel 1/if-then 1
		} else {
			target_vel = min((MathLib_instance.sqrt(((0.8 * g) * real(CarMessages.radius / 1.0[m]))) * 3.6[kmph]), 60.0[kmph]); // LateralAcc/setTargetVel 1/if-else 1
		} // LateralAcc/setTargetVel 1
	}

	@thread
	@generated("blockdiagram", "d9aa222b")
	public void setPwrBrk() {
		velocityController.calc(target_vel, CarMessages.v); // VelocityCtrl/setPwrBrk 1
		CarMessages.power = velocityController.power; // VelocityCtrl/setPwrBrk 2
		CarMessages.brake = velocityController.brake; // VelocityCtrl/setPwrBrk 3
	}
}