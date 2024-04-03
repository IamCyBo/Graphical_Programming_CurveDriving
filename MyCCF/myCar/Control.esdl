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
	arr_m oldFocuspoint[2];
	m radius = 0.0[m];
	arr_m oldVector[2];
	EdgeRising EdgeRising_instance;
	boolean curve;
	real angle;
	EdgeFalling EdgeFalling_instance;
	boolean first = true;

	@thread
	@generated("blockdiagram", "c9bfff2b")
	public void calc() {
		this.nextFocuspoint(Route.focuspoint, vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)); // Main/calc 1
		Route.calc(focuspointIndex); // Main/calc 2
		SteeringCtrl.str = str; // Main/calc 3
		this.checkDelta(vectOps.angleDiff(vectOps.angle(tmp, vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)), CarMessages.mybearing)); // Main/calc 4
		SteeringCtrl.^delta = vectOps.angleDiff(vectOps.angle(tmp, vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)), CarMessages.mybearing); // Main/calc 5
		SteeringCtrl.calc(); // Main/calc 6
		str = SteeringCtrl.str; // Main/calc 7
		CarMessages.steering = str; // Main/calc 8
		Logger.calc(str, CarMessages.x / 1.0[m], CarMessages.y / 1.0[m], CarMessages.v / 1.0[kmph], CarMessages.v / 1.0[kmph]); // Main/calc 9
		distance2focuspoint = vectOps.length(vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), Route.focuspoint)); // Main/calc 10
		DriverMessages.dist2End = (distance2focuspoint + Route.distanceFocusEnd); // Main/calc 11
		DriverMessages.dist2Route = Route.point_distance(vectOps.getPoint(CarMessages.x, CarMessages.y)); // Main/calc 12
		this.getTargetVelo((distance2focuspoint + Route.distanceFocusEnd), Route.distanceFocusEnd); // Main/calc 13
	}

	@thread
	@generated("blockdiagram", "ab00bf20")
	public void setTargetVel() {
		if (distance2end <= 35[m]) {
			target_vel = 0.0[kmph]; // TargetVeloOld/setTargetVel 1/if-then 1
		} else {
			target_vel = min((MathLib_instance.sqrt(((0.8 * g) * real(CarMessages.radius / 1.0[m]))) * 3.6[kmph]), 60.0[kmph]); // TargetVeloOld/setTargetVel 1/if-else 1
		} // TargetVeloOld/setTargetVel 1
	}

	@thread
	@generated("blockdiagram", "a951ac51")
	public void setPwrBrk() {
		velocityController.calc(target_vel, CarMessages.v); // VelocityCtrl/setPwrBrk 1
		CarMessages.power = velocityController.power; // VelocityCtrl/setPwrBrk 2
		CarMessages.brake = velocityController.brake; // VelocityCtrl/setPwrBrk 3
	}

	@generated("blockdiagram", "90d52fc8")
	public void getTargetVelo(m in d2end, m in distanceFPend) {
		if (d2end <= 35[m]) {
			target_vel = 0.0[kmph]; // TargetVelo/getTargetVelo 1/if-then 1
		} else {
			if ((!curve) && (distanceFPend == 0.0[m])) {
				target_vel = 60.0[kmph]; // TargetVelo/getTargetVelo 1/if-else 1/if-then 1
			} else {
				this.calcRadius(); // TargetVelo/getTargetVelo 1/if-else 1/if-else 1
				target_vel = min((MathLib_instance.sqrt(((0.8 * g) * real(radius / 1.0[m]))) * 3.6[kmph]), 60.0[kmph]); // TargetVelo/getTargetVelo 1/if-else 1/if-else 2
			} // TargetVelo/getTargetVelo 1/if-else 1
		} // TargetVelo/getTargetVelo 1
	}

	@generated("blockdiagram", "742e91c5")
	public void calcAngle() {
		Route.calc((focuspointIndex + 1)); // CalcAngle/calcAngle 1
		angle = MathLib_instance.tan((abs(vectOps.angle(vectOps.getVect(Route.focuspoint, oldFocuspoint), oldVector)) / 2.0)); // CalcAngle/calcAngle 2
	}

	@generated("blockdiagram", "f64bd060")
	public void checkDelta(real in ^delta) {
		if (curve) {
			if (abs(^delta) < 0.01) {
				curve = false; // CheckCurve/checkDelta 1/if-then 1/if-then 1
			} // CheckCurve/checkDelta 1/if-then 1
		} // CheckCurve/checkDelta 1
	}

	@generated("blockdiagram", "2e93f06b")
	public void nextFocuspoint(arr_m in oldFP[2], arr_m in oldVec[2]) {
		^trigger.compute((distance2focuspoint < proximity)); // NextFocuspoint/nextFocuspoint 1
		if (^trigger.value()) {
			focuspointIndex = (1 + focuspointIndex); // NextFocuspoint/nextFocuspoint 2/if-then 1
			curve = true; // NextFocuspoint/nextFocuspoint 2/if-then 2
		} // NextFocuspoint/nextFocuspoint 2
		EdgeFalling_instance.compute(curve); // NextFocuspoint/nextFocuspoint 3
		if (^trigger.value() || EdgeFalling_instance.value()) {
			oldFocuspoint = oldFP; // NextFocuspoint/nextFocuspoint 4/if-then 1
			oldVector = oldVec; // NextFocuspoint/nextFocuspoint 4/if-then 2
		} // NextFocuspoint/nextFocuspoint 4
		if (EdgeFalling_instance.value() || first) {
			this.calcAngle(); // NextFocuspoint/nextFocuspoint 5/if-then 1
			first = false; // NextFocuspoint/nextFocuspoint 5/if-then 2
		} // NextFocuspoint/nextFocuspoint 5
	}

	@generated("blockdiagram", "04058894")
	public void calcRadius() {
		radius = max((vectOps.length(vectOps.getVect(vectOps.getPoint(CarMessages.x, CarMessages.y), oldFocuspoint)) * angle), 5.94[m]); // CalcRadius/calcRadius 1
	}
}