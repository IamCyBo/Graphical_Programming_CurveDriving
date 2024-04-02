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
import SystemLib.Miscellaneous.EdgeFalling;

singleton class Control
reads CarMessages.mybearing, CarMessages.x, CarMessages.y, CarMessages.v, CarMessages.radius
writes CarMessages.steering, DriverMessages.dist2End, DriverMessages.dist2Route, CarMessages.power, CarMessages.brake {

	vectOps vectOps;
	Route Route;
	integer focuspointIndex = 1;
	m distance2focuspoint = 340.0E6[m];
	characteristic m proximity = 12.0[m];
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
	boolean curve;
	arr_m oldFocuspoint[2];
	m radius = 0.0[m];
	arr_m oldVector[2];
	EdgeRising EdgeRising_instance;
	boolean check;
	real angle;
	EdgeFalling EdgeFalling_instance;

	@thread
	@generated("blockdiagram", "b22df8af")
	public void calc() {
		^trigger.compute((distance2focuspoint < proximity)); // Main/calc 1
		if (^trigger.value()) {
			focuspointIndex = (1 + focuspointIndex); // Main/calc 2/if-then 1
			check = true; // Main/calc 2/if-then 2
		} // Main/calc 2
		EdgeFalling_instance.compute(check); // Main/calc 3
		if (EdgeFalling_instance.value() || ^trigger.value()) {
			oldFocuspoint = Route.focuspoint; // Main/calc 4/if-then 1
			oldVector = vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint); // Main/calc 4/if-then 2
		} // Main/calc 4
		if (EdgeFalling_instance.value()) {
			Route.calc((focuspointIndex + 1)); // Main/calc 5/if-then 1
			angle = MathLib_instance.tan((abs(vectOps.angle(vectOps.getVect(Route.focuspoint, oldFocuspoint), oldVector)) / 2.0)); // Main/calc 5/if-then 2
		} // Main/calc 5
		Route.calc(focuspointIndex); // Main/calc 6
		SteeringCtrl.str = str; // Main/calc 7
		if (check) {
			if (abs(vectOps.angleDiff(vectOps.angle(tmp, vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)), CarMessages.mybearing)) < 0.01) {
				curve = false; // Main/calc 8/if-then 1/if-then 1
				check = false; // Main/calc 8/if-then 1/if-then 2
			} // Main/calc 8/if-then 1
		} // Main/calc 8
		SteeringCtrl.^delta = vectOps.angleDiff(vectOps.angle(tmp, vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)), CarMessages.mybearing); // Main/calc 9
		SteeringCtrl.calc(); // Main/calc 10
		str = SteeringCtrl.str; // Main/calc 11
		Logger.calc(str, CarMessages.x / 1.0[m], CarMessages.y / 1.0[m], CarMessages.v / 1.0[kmph], Route.point_distance(vectOps.getPoint(CarMessages.x, CarMessages.y)) / 1.0[m]); // Main/calc 12
		CarMessages.steering = str; // Main/calc 13
		distance2focuspoint = vectOps.length(vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)); // Main/calc 14
		DriverMessages.dist2End = (distance2focuspoint + Route.distanceFocusEnd); // Main/calc 15
		DriverMessages.dist2Route = Route.point_distance(vectOps.getPoint(CarMessages.x, CarMessages.y)); // Main/calc 16
		if ((distance2focuspoint + Route.distanceFocusEnd) <= 35[m]) {
			target_vel = 0.0[kmph]; // Main/calc 17/if-then 1
		} else {
			if ((!check) && (Route.distanceFocusEnd == 0.0[m])) {
				target_vel = 60.0[kmph]; // Main/calc 17/if-else 1/if-then 1
			} else {
				radius = max((vectOps.length(vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), oldFocuspoint)) * angle), 5.94[m]); // Main/calc 17/if-else 1/if-else 1
				target_vel = min((MathLib_instance.sqrt(((0.8 * g) * real(radius / 1.0[m]))) * 3.6[kmph]), 60.0[kmph]); // Main/calc 17/if-else 1/if-else 2
			} // Main/calc 17/if-else 1
		} // Main/calc 17
	}

	@thread
	@generated("blockdiagram", "e68bbdde")
	public void setTargetVel() {
		if (distance2end <= 35[m]) {
			target_vel = 0.0[kmph]; // LateralAcc/setTargetVel 1/if-then 1
		} else {
			target_vel = min((MathLib_instance.sqrt(((0.8 * g) * real(CarMessages.radius / 1.0[m]))) * 3.6[kmph]), 60.0[kmph]); // LateralAcc/setTargetVel 1/if-else 1
		} // LateralAcc/setTargetVel 1
	}

	@thread
	@generated("blockdiagram", "16003d75")
	public void setPwrBrk() {
		velocityController.calc(target_vel, CarMessages.v); // VelocityCtrl/setPwrBrk 1
		CarMessages.power = velocityController.power; // VelocityCtrl/setPwrBrk 2
		CarMessages.brake = velocityController.brake; // VelocityCtrl/setPwrBrk 3
	}
}